#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

SniperStreak()
{
	self notifyOnPlayerCommand("[{+actionslot 2}]", "+actionslot 2");
	self waittill("[{+actionslot 2}]");	
	self thread AImod\_Mod::TextPopup2("Sub Machine Gun Team Spawned!");
	level thread SpawnSniper(self);
}

MachineGunStreak()
{
	self notifyOnPlayerCommand("[{+actionslot 2}]", "+actionslot 2");
	self waittill("[{+actionslot 2}]");	
	self thread AImod\_Mod::TextPopup2("Machine Gun Team Spawned!");
	level thread SpawnMachineGun(self);
}

SpawnMachineGun(player)
{
	level.guy = spawn("script_model", Spawnpoint());
	level.guy setModel(AImod\_botUtil::FriendlyModels());
	level.guy.angles = (0,0,0);
	level.guy Solid();
	level.guy.team = "allies";
	level.guy.allowfire = "true";
	level.guy.pers["type"] = "lmg";
	level.guy.crate1 = spawn("script_model", level.guy getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
	level.guy.crate1 setModel("com_plasticcase_beige_big");
	level.guy.crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.guy.crate1.angles = (90,0,0);
	level.guy.crate1 hide();
	level.guy.crate1 linkto( level.guy, "j_spinelower" );
	level.guy.headIcon = newHudElem();
	level.guy.headIcon.x = level.guy.origin[0];
	level.guy.headIcon.y = level.guy.origin[1];
	level.guy.headIcon.z = level.guy.origin[2] + 70;
	level.guy.headIcon.alpha = 0.85;
	level.guy.headIcon setShader( "hud_icon_rpd", 10,10 );
	level.guy thread monitorIconOrigin( level.guy.headIcon );
	level.guy.headIcon setWaypoint( true, true, false );
	level.guy scriptModelPlayAnim("pb_stand_alert_mg");
	level.guy thread KillLMG();
	level.guy.currentsurface = "default";
	level.guy PlaySound( maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "mp_stm_iminposition" );
	level.guy.gun = spawn("script_model", level.guy getTagOrigin( "tag_weapon_left" ));
	level.guy.gun setModel(GetWeaponModel("rpd_fmj_mp", 8));
	level.guy.gun.team = "allies";
	level.guy.gun.angles = (0,0,0);
	level.guy.gun linkto( level.guy, "j_gun" );
	level.guy.gun thread HideGunParts("rpd_fmj_mp");
	level.guy.head = spawn("script_model", level.guy getTagOrigin( "j_spine4" ));
	level.guy.head setModel(AImod\_botUtil::GetHeadSpawnModel( ));
	level.guy.head.angles = (270,0,270);
	level.guy.head linkto( level.guy, "j_spine4" );
	level.guy thread MoveBot(level.guy);
	level.guy thread UpdateAngles();
	level.guy thread ClampToGround();
	level.guy thread MoniterFireRPD(player);
	self notify("Clamp");
}

MoniterFireRPD(player)
{
	self endon("died");
	while(1)
	{
		for(i=0; i < 100; i++)
		{
			TmpDist = 999999999;
			pTarget = undefined;
			foreach(zombie in level.bots)
			{
				if( !bulletTracePassed( self.origin+(0,0,30), zombie.origin+(0,0,70), false, self ) )
					continue;
				
				if(distancesquared(self.origin, zombie.origin) < TmpDist)
				{
					TmpDist = distancesquared(self.origin, zombie.origin);
					pTarget = zombie;
				}
			}
			if(isDefined(pTarget) && self.allowfire == "true")
			{
				self scriptModelPlayAnim("pt_stand_shoot_mg");
				MagicBullet( "rpd_mp", self.gun.origin, pTarget.origin+(randomInt(30),randomInt(30),15), player );
				playFx(loadFX("ak47_flash_wv"),self.gun.origin);
				wait 0.15;
				self scriptModelPlayAnim("pb_stand_alert_mg");
			}
			else
			{
				i -= 1;
				wait 0.15;
			}
		}
		self.gun HidePart("tag_clip");
		self scriptModelPlayAnim("pt_reload_stand_mg");
		wait 3;
		self.gun ShowPart("tag_clip");
		self scriptModelPlayAnim("pb_stand_alert_mg");
		wait 1;
	}
}

SpawnSniper(player)
{
	level.ghillie = spawn("script_model", Spawnpoint());
	level.ghillie setModel(AImod\_botUtil::FriendlyModels());
	level.ghillie.angles = (0,0,0);
	level.ghillie Solid();
	level.ghillie.team = "allies";
	level.ghillie.allowfire = "true";
	level.ghillie.pers["type"] = "smg";
	level.ghillie.crate1 = spawn("script_model", level.ghillie getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
	level.ghillie.crate1 setModel("com_plasticcase_beige_big");
	level.ghillie.crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.ghillie.crate1.angles = (90,0,0);
	level.ghillie.crate1 hide();
	level.ghillie.crate1 linkto( level.ghillie, "j_spinelower" );
	level.ghillie.headIcon = newHudElem();
	level.ghillie.headIcon.x = level.ghillie.origin[0];
	level.ghillie.headIcon.y = level.ghillie.origin[1];
	level.ghillie.headIcon.z = level.ghillie.origin[2] + 70;
	level.ghillie.headIcon.alpha = 0.85;
	level.ghillie.headIcon setShader( "hud_icon_ump45", 10,10 );
	level.ghillie thread monitorIconOrigin( level.ghillie.headIcon );
	level.ghillie.headIcon setWaypoint( true, true, false );
	level.ghillie scriptModelPlayAnim("pb_stand_alert");
	level.ghillie thread KillSniper();
	level.ghillie PlaySound( maps\mp\gametypes\_teams::getTeamVoicePrefix( "axis" ) + "mp_stm_iminposition" );
	level.ghillie.currentsurface = "default";
	level.ghillie.gun = spawn("script_model", level.ghillie getTagOrigin( "tag_weapon_left" ));
	switch(RandomInt(1))
	{
		case 0:
		level.ghillie.gun setModel(GetWeaponModel("ump45_mp", 7));
		level.ghillie thread MoniterFireUMP(player);
		level.ghillie.gun thread HideGunParts("ump45_mp");
		break;
	}
	level.ghillie.gun.team = "allies";
	level.ghillie.gun.angles = (0,0,0);
	level.ghillie.gun linkto( level.ghillie, "j_gun" );
	level.ghillie.head = spawn("script_model", level.ghillie getTagOrigin( "j_spine4" ));
	level.ghillie.head setModel(AImod\_botUtil::GetHeadSpawnModel( ));
	level.ghillie.head.angles = (270,0,270);
	level.ghillie.head linkto( level.ghillie, "j_spine4" );
	level.ghillie thread MoveBot(level.ghillie);
	level.ghillie thread UpdateAngles();
	level.ghillie thread ClampToGround();
}

MoniterFireUMP(player)
{
	self endon("died");
	while(1)
	{
		for(i=0; i < 32; i++)
		{
			TmpDist = 999999999;
			pTarget = undefined;
			foreach(zombie in level.bots)
			{
				if( !bulletTracePassed( self.origin+(0,0,30), zombie.origin+(0,0,70), false, self ) )
					continue;
				
				if(distancesquared(self.origin, zombie.origin) < TmpDist)
				{
					TmpDist = distancesquared(self.origin, zombie.origin);
					pTarget = zombie;
				}
			}
			if(isDefined(pTarget) && self.allowfire == "true")
			{
				self scriptModelPlayAnim("pt_stand_shoot_auto");
				MagicBullet( "ump45_mp", self.gun.origin, pTarget.origin+(randomInt(30),randomInt(30),15), player );
				playFx(loadFX("ak47_flash_wv"),self.gun.origin);
				wait 0.1;
				self scriptModelPlayAnim("pb_stand_alert");
			}
			else
			{
				i -= 1;
				wait 0.1;
			}
		}
		self scriptModelPlayAnim("pt_reload_stand_auto_mp40");
		self.gun HidePart("tag_clip");
		self playSound("weap_miniuzi_reload_npc");
		wait 3;
		self.gun2 delete();
		self.gun showPart("tag_clip");
		self scriptModelPlayAnim("pb_stand_alert");
		wait 1;
	}
}

KillLMG()
{
	wait 200;
	self notify("died");
	self PlaySound("explo_mine");
	self thread AImod\animation::DeathReguler();
	self thread AImod\animation::DeathSound();
	wait 2;
	self startRagDoll(1);
	self.gun delete();
	self.headIcon destroy();
	self.crate1 delete();
	wait 25;
	self delete();
	self.head delete();
}

KillSniper()
{
	wait 120;
	self notify("died");
	self PlaySound("explo_mine");
	self thread AImod\animation::DeathReguler();
	self thread AImod\animation::DeathSound();
	wait 2;
	self startRagDoll(1);
	self.gun delete();
	self.headIcon destroy();
	self.crate1 delete();
	wait 25;
	self delete();
	self.head delete();
}

UpdateAngles()
{
	self endon("died");
	while(1)
	{
		TmpDist = 999999999;
		pTarget = undefined;
		pAngle = undefined;
		foreach(zombie in level.bots)
		{
			if( !bulletTracePassed( self.origin+(0,0,30), zombie.origin+(0,0,70), false, self ) )
                continue;
				
			if(distancesquared(self.origin, zombie.origin) < TmpDist)
			{
				TmpDist = distancesquared(self.origin, zombie.origin);
				pTarget = zombie;
				pAngle = "zombie";
			}
		}
		if(pAngle == "zombie" && self.allowfire == "true")
		{
			movetoLoc = VectorToAngles( pTarget.origin - self.origin );
			self RotateTo((0,movetoLoc[1],0), 0.1);
		}
		wait 0.1;
	}
}

MoveBot(bot)
{
	switch( getDvar("mapname") )
	{
		case "mp_checkpoint":
		self thread maps\mp\killstreaks\waypoints\mp_karachi::Init(bot);
		break;
		case "mp_subbase":
		self thread maps\mp\killstreaks\waypoints\mp_subbase::Init(bot);
		break;
		case "mp_rust":
		if(level.edit == 0)
			self thread maps\mp\killstreaks\waypoints\mp_rust::Init(bot);
		else if(level.edit == 1)
			self thread maps\mp\killstreaks\waypoints\mp_rust2::Init(bot);
		break;
		case "mp_afghan":
		self thread maps\mp\killstreaks\waypoints\mp_afghan::Init(bot);
		break;
		case "mp_rundown":
		self thread maps\mp\killstreaks\waypoints\mp_rundown::Init(bot);
		break;
		case "mp_trailerpark":
		self thread maps\mp\killstreaks\waypoints\mp_trailerpark::Init(bot);
		break;
		case "mp_complex":
		self thread maps\mp\killstreaks\waypoints\mp_bailout::Init(bot);
		break;
	}
}

ClampToGround()
{
	self endon("died");
	while(1)
	{	
		trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
		if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "bot")
		{
			trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);
		}
		self.origin = (trace["position"]);
		self.currentsurface = trace["surfacetype"];
		if(self.currentsurface == "none")
		{
			self.currentsurface = "default";
		}
		self waittill("Clamp");
	}
}

SpawnPoint()
{
	rSpawn = undefined;
	switch( getDvar("mapname") )
	{
		case "mp_afghan": switch(RandomInt(4))
		{
			case 0: rSpawn = (-2303,-869,-1439);
			break;
			case 1: rSpawn = (-2420,-637,-1440);
			break;
			case 2: rSpawn = (-2448,-268,-1440);
			break;
			case 3: rSpawn = (-3680,342,-1443);
			break;
		}
		break;
		case "mp_complex": switch(RandomInt(2))
		{
			case 0: rSpawn = (1481,-317,400);
			break;
			case 1: rSpawn = (722,-521,400);
			break;
		}
		break;
		case "mp_nightshift": 
		if(level.edit == 0) switch(RandomInt(4))
		{
			case 0: rSpawn = (-1776,-1280,4);
			break;
			case 1: rSpawn = (-1019,-618,8);
			break;
			case 2: rSpawn = (-1039,-1878,16);
			break;
			case 3: rSpawn = (-1029,831,96);
			break;
		}
		else if(level.edit == 1) switch(RandomInt(1))
		{
			case 0: rSpawn = (62,-448,624);
			break;
		}
		else if(level.edit == 2) switch(RandomInt(1))
		{
			case 0: rSpawn = (1831,-2307,116);
			break;
		}
		break;
		case "mp_rust": if(level.edit == 0) switch(RandomInt(1))
		{
			case 0: rSpawn = (521,-9972,-82);
			break;
		}
		else if(level.edit == 1) switch(RandomInt(2))
		{
			case 0: rSpawn = (1230,-6579,-263);
			break;
			case 1: rSpawn = (961,-6570,-263);
			break;
		}
		break;
		case "mp_rundown": switch(RandomInt(2))
		{
			case 0: rSpawn = (776,3135,75);
			break;
			case 1: rSpawn = (595,2901,74);
			break;
		}
		break;
		case "mp_trailerpark": switch(RandomInt(2))
		{
			case 0: rSpawn = (1191,-2059,19);
			break;
			case 1: rSpawn = (983,-2052,18);
			break;
		}
		break;
		case "mp_boneyard": switch(RandomInt(2))
		{
			case 0: rSpawn = (368,-2587,-128);
			break;
			case 1: rSpawn = (618,-2506,-56);
			break;
		}
		break;
		case "mp_quarry": switch(RandomInt(2))
		{
			case 0: rSpawn = (-3683,2213,177);
			break;
			case 1: rSpawn = (-2142,1366,32);
			break;
		}
		break;
		case "mp_compact": switch(RandomInt(1))
		{
			case 0: rSpawn = (2500,2789,261);
			break;
		}
		break;
		case "mp_underpass": switch(RandomInt(2))
		{
			case 0: rSpawn = (4022,2926,427);
			break;
			case 1: rSpawn = (4022,3041,427);
			break;
		}
		break;
		case "mp_invasion": switch(RandomInt(2))
		{
			case 0: rSpawn = (2432,12631,11);
			break;
			case 1: rSpawn = (2347,12633,11);
			break;
		}
		break;
		case "mp_highrise": 
		if(level.edit == 0)	switch(RandomInt(2))
		{
			case 0: rSpawn = (-1367,11314,2184);
			break;
			case 1: rSpawn = (-1270,11140,2184);
			break;
		}
		else if(level.edit == 1)
		{
			rSpawn = mp\maps\mp_highrise2::BotSpawnsHighrise2();
		}
		break;
		case "mp_strike": switch(RandomInt(2))
		{
			case 0: rSpawn = (-2233,1465,14);
			break;
			case 1: rSpawn = (-2233,1320,22);
			break;
		}
		break;
		case "mp_terminal": switch(RandomInt(2))
		{
			case 0: rSpawn = (2198,3988,108);
			break;
			case 1: rSpawn = (1348,3552,123);
			break;
		}
		break;
		case "mp_derail": switch(RandomInt(2))
		{
			case 0: rSpawn = (2856,2325,139);
			break;
			case 1: rSpawn = (1732,1934,133);
			break;
		}
		break;
		case "mp_brecourt": switch(RandomInt(2))
		{
			case 0: rSpawn = (9780,6684,353);
			break;
			case 1: rSpawn = (10838,7205,1481);
			break;
		}
		break;
		case "mp_subbase": switch(RandomInt(2))
		{
			case 0: rSpawn = (-416,-4018,12);
			break;
			case 1: rSpawn = (-275,-3981,11);
			break;
		}
		break;
		case "mp_checkpoint": switch(RandomInt(9))
		{
			case 0: rSpawn = (2416,3496,11);
			break;
			case 1: rSpawn = (2431,3047,11);
			break;
			case 2: rSpawn = (2424,2576,11);
			break;
			case 3: rSpawn = (2423,2146,14);
			break;
			case 4: rSpawn = (2681,2722,3);
			break;
			case 5: rSpawn = (2422,1957,3);
			break;
			case 6: rSpawn = (2730,2644,8);
			break;
			case 7: rSpawn = (2257,3660,-10);
			break;
			case 8: rSpawn = (2440,3725,-19);
			break;
		}
		break;
		case "mp_favela": switch(RandomInt(2))
		{
			case 0: rSpawn = (2066,2750,291);
			break;
			case 1: rSpawn = (2123,2668,291);
			break;
		}
		break;
		case "mp_estate": switch(RandomInt(3))
		{
			case 0: rSpawn = (-2697,-1319,-527);
			break;
			case 1: rSpawn = (-3029,-1323,-527);
			break;
			case 2: rSpawn = (-2564,-970,-355);
			break;
			
		}
		break;
		case "mp_abandon": switch(RandomInt(3))
		{
			case 0: rSpawn = (-1594,2536,3);
			break;
			case 1: rSpawn = (-2616,3279,3);
			break;
			case 2: rSpawn = (-1787,3754,3);
			break;
			
		}
		break;
		case "mp_vacant": switch(RandomInt(3))
		{
			case 0: rSpawn = (-974,-785,-103);
			break;
			case 1: rSpawn = (-1024,991,-106);
			break;
			case 2: rSpawn = (-1737,1238,-102);
			break;
			
		}
		break;
		case "mp_storm": switch(RandomInt(3))
		{
			case 0: rSpawn = (4787,-1352,16);
			break;
			case 1: rSpawn = (4938,-1064,-48);
			break;
			case 2: rSpawn = (2980,-1165,-48);
			break;
			
		}
		break;
		case "mp_fuel2": switch(RandomInt(3))
		{
			case 0: rSpawn = (17949,27524,6994);
			break;
			case 1: rSpawn = (18544,27508,6994);
			break;
			case 2: rSpawn = (18396,27340,6994);
			break;
			
		}
		break;
		case "mp_overgrown": switch(RandomInt(3))
		{
			case 0: rSpawn = (-1597,-5810,-151);
			break;
			case 1: rSpawn = (-1782,-5751,-132);
			break;
			case 2: rSpawn = (-1502,-6009,-151);
			break;
		}
		break;
		case "mp_crash": switch(RandomInt(6))
		{
			case 0: rSpawn = (-1030,-2174,114);
			break;
			case 1: rSpawn = (-1068,-2366,106);
			break;
			case 2: rSpawn = (-1118,-2228,110);
			break;
			case 3: rSpawn = (-999,-2633,97);
			break;
			case 4: rSpawn = (-1132,-2891,84);
			break;
			case 5: rSpawn = (-983,-3059,82);
			break;
		}
		break;
	}
	return rSpawn;
}

FXFire(pos)
{
	self endon("fire_end");
	while(1)
	{
		playFx(loadfx("props/barrel_fire"),pos);
		wait 1;
	}
}

monitorIconOrigin( entity )
{
	self endon("died");
	for(;;)
	{
		entity.x = self.origin[0];
		entity.y = self.origin[1];
		entity.z = self.origin[2] + 70;
		wait 0.05;
	}
}