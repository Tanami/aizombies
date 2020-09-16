#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

MoveHeli(player)
{
	switch( getDvar("mapname") )
	{
		case "mp_rust":
		if(level.edit == 0)
		{
			self thread maps\mp\killstreaks\waypoints\mp_rust::InitHeli(player);
		}
		break;
		case "mp_afghan":
		self thread maps\mp\killstreaks\waypoints\mp_afghan::InitHeli(player);
		break;
		case "mp_subbase":
		self thread maps\mp\killstreaks\waypoints\mp_subbase::InitHeli(player);
		break;
		case "mp_checkpoint":
		self thread maps\mp\killstreaks\waypoints\mp_karachi::InitHeli(player);
		break;
		case "mp_trailerpark":
		self thread maps\mp\killstreaks\waypoints\mp_trailerpark::InitHeli(player);
		break;
		case "mp_invasion":
		self thread maps\mp\killstreaks\waypoints\mp_invasion::InitHeli(player);
		break;
		case "mp_compact":
		self thread maps\mp\killstreaks\waypoints\mp_salvage::InitHeli(player);
		break;
		case "mp_strike":
		self thread maps\mp\killstreaks\waypoints\mp_strike::InitHeli(player);
		break;
		case "mp_highrise":
		if(level.edit == 0)
		{
			self thread maps\mp\killstreaks\waypoints\mp_highrise::InitHeli(player);
		}
		break;
		case "mp_terminal":
		self thread maps\mp\killstreaks\waypoints\mp_terminal::InitHeli(player);
		break;
		case "mp_brecourt":
		self thread maps\mp\killstreaks\waypoints\mp_wasteland::InitHeli(player);
		break;
		case "mp_derail":
		self thread maps\mp\killstreaks\waypoints\mp_derail::InitHeli(player);
		break;
		case "mp_boneyard":
		self thread maps\mp\killstreaks\waypoints\mp_scrapyard::InitHeli(player);
		break;
	}
}

OverwatchStreak()
{
	self notifyOnPlayerCommand("[{+actionslot 2}]", "+actionslot 2");
	self waittill("[{+actionslot 2}]");
	self thread AImod\_Mod::TextPopup2("Overwatch Inbound!");	
	level thread OverWatchHeli(self);
}

OverWatchHeli(player)
{
	level.heli = spawnHelicopter(player, level.startNode.origin, level.startNode.angles, "pavelow_mp", "vehicle_little_bird_armed");
	level.heli enablelinkto();
	level.heli.mgTurret = spawnTurret( "misc_turret", level.heli.origin, "pavelow_minigun_mp" );
	level.heli.mgTurret linkTo( level.heli, "tag_minigun_attach_left", ( 0,0,0 ), ( 0,0,0) );
	level.heli.mgTurret setModel( "weapon_minigun" );
 	level.heli.mgTurret makeTurretInoperable();
	level.heli.mgTurret setMode("auto_nonai");
	level.heli.mgTurret SetDefaultDropPitch(0);
 	level.heli.mgTurret.team = "allies";
	level.heli.mgTurret.pers["team"] = "allies";
	level.heli.mgTurret setTurretTeam( "allies" );
	level.heli.mgTurret.owner = player;
	level.heli.mgTurret2 = spawnTurret("misc_turret", level.heli.origin, "pavelow_minigun_mp");
	level.heli.mgTurret2 linkTo(level.heli, "tag_minigun_attach_right", ( 0,0,0 ), ( 0,0,0));
	level.heli.mgTurret2 setModel( "weapon_minigun" );
 	level.heli.mgTurret2 makeTurretInoperable();
	level.heli.mgTurret2 setMode( "auto_nonai" );
	level.heli.mgTurret2 SetDefaultDropPitch(0);
 	level.heli.mgTurret2.team = "allies";
	level.heli.mgTurret2.pers["team"] = "allies";
	level.heli.mgTurret2 setTurretTeam( "allies" );
	level.heli.mgTurret2.owner = player;
	level.heli Vehicle_SetSpeed(50,70);
    level.heli setvehgoalpos(player.origin+(0,0,500),1);
	level.heli waittillmatch("goal");	
	level.heli thread MoniterFireMinigun();
	level.heli thread moveHeliZombie();
	level.heli thread moveHeli();
	level.heli thread HeliLeave(player);
}

HeliLeave(player)
{
	wait 150;
	self notify("heli_leaving");
	wait 1;
	self setyawspeed( 180, 180, 180 );
	self thread HeliSpin();
	self playLoopSound("cobra_helicopter_dying_loop");
	self Vehicle_SetSpeed(30,35);
    self setvehgoalpos(self.origin+(randomIntRange(-2000,2000),randomIntRange(-2000,2000),randomIntRange(-500,500)),1);
	self playSound("cobra_helicopter_hit");
	playFxOnTag( loadFx("smoke/smoke_trail_black_heli_emitter"), self, "tag_minigun_attach_right" );
	playFxOnTag( loadFx("smoke/smoke_trail_black_heli_emitter"), self, "tag_minigun_attach_left" );
	playFxOnTag( loadFx("explosions/helicopter_explosion_secondary_small"), self, "tag_engine" );
	wait 6;
	deathAngles = self getTagAngles( "tag_deathfx" );
	self playSound("cobra_helicopter_crash");
	playFx( loadfx( "explosions/aerial_explosion_littlebird_mp" ), self getTagOrigin( "tag_deathfx" ), anglesToForward( deathAngles ), anglesToUp( deathAngles ) );
	self stopLoopSound();
	self delete();
	self.mgTurret delete();
	self.mgTurret2 delete();
}

HeliSpin()
{
	while(isDefined(self))
	{
		self settargetyaw( self.angles[1]+(180*0.9) );
		wait 1;
	}
}

moveHeliZombie()
{
	self endon("heli_leaving");
	while(1)
	{
		TmpDist = 999999999;
		pTarget = undefined;
		helicopterTotarget = undefined;
		foreach(zombie in level.bots)
		{						
			if(distancesquared(self.origin, zombie.origin) < TmpDist)
			{
				TmpDist = distancesquared(self.origin, zombie.origin);
				pTarget = zombie;
			}
		}
		helicopterTotarget = VectorToAngles( pTarget.origin - self.origin );
		self setyawspeed( 180, 180, 180 );
		self settargetyaw(helicopterTotarget[1]);
		wait 1;
	}
}

MoniterFireMinigun()
{
	self endon("heli_leaving");
	while(1)
	{
		for(i=0; i < 50; i++)
		{
			TmpDist = 999999999;
			pZombie = undefined;
			foreach(zombie in level.bots)
			{
				if( !bulletTracePassed( self.origin-(0,0,80), zombie.origin+(0,0,70), false, self ) )
					continue;
				
				if(zombie.pers["isAlive"] == "false")
					continue;
				
				if(distancesquared(self.origin, zombie.origin) < TmpDist)
				{
					TmpDist = distancesquared(self.origin, zombie.origin);
					pZombie = zombie.crate1;
				}
			}
			if(isDefined(pZombie))
			{
				self.mgTurret SetTargetEntity(pZombie);
				self.mgTurret2 SetTargetEntity(pZombie);
				self.mgTurret ShootTurret();
				self.mgTurret2 ShootTurret();
				wait 0.1;
			}
			else
			{
				i -= 1;
				wait 0.1;
			}
		}
		wait 4;
	}
}