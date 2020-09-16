#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;
#include AImod\_airdropFunc;
#include AImod\_Bot;

getFlyHeightOffset( dropSite )
{
	lbFlyHeight = 5000;
	heightEnt = GetEnt( "airstrikeheight", "targetname" );
	if ( !isDefined( heightEnt ) )
	{
		if ( isDefined( level.airstrikeHeightScale ) )
		{
			if ( level.airstrikeHeightScale > 2 )
			{
				lbFlyHeight = 5000;
				return( lbFlyHeight * (level.airStrikeHeightScale ) );
			}
			return( lbFlyHeight * level.airStrikeHeightScale + 2000 + dropSite[2] );
		}
		else return ( lbFlyHeight + dropsite[2] );
	}
	else
	{
		return heightEnt.origin[2];
	}
}

c130Setup( owner, pathStart, pathGoal )
{
	forward = vectorToAngles( pathGoal - pathStart );
	c130 = spawnplane( owner, "script_model", pathStart, "compass_objpoint_c130_friendly", "compass_objpoint_c130_enemy" );
	c130 setModel( "vehicle_ac130_low_mp" );
	if ( !isDefined( c130 ) )
	{
		return;
	}
	c130.owner = owner;
	c130.team = "allies";
	level.c130 = c130;
	return c130;
}

createAirDropCrate( owner, dropType, crateType, startPos )
{
	dropCrate = spawn( "script_model", startPos );
	dropCrate.curProgress = 0;
	dropCrate.useTime = 0;
	dropCrate.useRate = 0;
	dropCrate.team = self.team;
	if ( isDefined( owner ) )
	{
		dropCrate.owner = owner;
	}
	else
	{
		dropCrate.owner = undefined;
	}
	dropCrate.targetname = "care_package";
	dropCrate setModel( "com_plasticcase_friendly" );
	return dropCrate;
}

dropTheCrate( dropPoint, dropType, lbHeight, dropImmediately, crateOverride, startPos )
{
	dropCrate = [];
	self.owner endon ( "disconnect" );
	dropCrate = createAirDropCrate( self.owner, dropType, undefined, startPos );
	dropCrate LinkTo( self, "tag_ground" , (64,32,-128) , (0,0,0) );
	dropCrate.angles = (0,0,0);
	dropCrate show();
	dropSpeed = self.veh_speed;
	self waittill ( "drop_crate" );
	dropCrate Unlink();
	dropCrate PhysicsLaunchServer( (0,0,0), (0,0,0) );
	dropCrate setModel( "com_plasticcase_friendly" );
	dropCrate hide();
	ammodrop = spawn("script_model", dropCrate.origin - (0, 0, 15));
	ammodrop setModel("com_plasticcase_friendly");
	ammodrop.classname = "ammoDrop";
	ammodrop linkTo(dropCrate);
	ammodrop thread rotateBonusDrop();
	ammodrop.trigger = spawn("trigger_radius", ammodrop.origin,0,75,50);
	switch(randomInt(5))
	{
		case 0: ammodrop.trigger thread AmmoDropThink();
		ammodrop.headIcon = newHudElem();
		ammodrop.headIcon.x = ammodrop.origin[0];
		ammodrop.headIcon.y = ammodrop.origin[1];
		ammodrop.headIcon.z = ammodrop.origin[2] + 50;
		ammodrop.headIcon.alpha = 0.85;
		ammodrop.headIcon setShader( "waypoint_ammo_friendly", 10,10 );
		ammodrop thread monitorIconOrigin( ammodrop.headIcon );
		ammodrop.headIcon setWaypoint( true, true, false );
		break;
		case 1: ammodrop.trigger thread InfiniteAmmoDropThink();
		ammodrop.headIcon = newHudElem();
		ammodrop.headIcon.x = ammodrop.origin[0];
		ammodrop.headIcon.y = ammodrop.origin[1];
		ammodrop.headIcon.z = ammodrop.origin[2] + 50;
		ammodrop.headIcon.alpha = 0.85;
		ammodrop.headIcon setShader( "dpad_killstreak_sentry_gun", 10,10 );
		ammodrop thread monitorIconOrigin( ammodrop.headIcon );
		ammodrop.headIcon setWaypoint( true, true, false );
		break;
		case 2: ammodrop.trigger thread AdrenalineDropThink();
		ammodrop.headIcon = newHudElem();
		ammodrop.headIcon.x = ammodrop.origin[0];
		ammodrop.headIcon.y = ammodrop.origin[1];
		ammodrop.headIcon.z = ammodrop.origin[2] + 50;
		ammodrop.headIcon.alpha = 0.85;
		ammodrop.headIcon setShader( "cardicon_doubletap", 10,10 );
		ammodrop thread monitorIconOrigin( ammodrop.headIcon );
		ammodrop.headIcon setWaypoint( true, true, false );
		break;
		case 3: ammodrop.trigger thread MoneyDropThink();
		ammodrop.headIcon = newHudElem();
		ammodrop.headIcon.x = ammodrop.origin[0];
		ammodrop.headIcon.y = ammodrop.origin[1];
		ammodrop.headIcon.z = ammodrop.origin[2] + 50;
		ammodrop.headIcon.alpha = 0.85;
		ammodrop.headIcon setShader( "cardicon_gold", 10,10 );
		ammodrop thread monitorIconOrigin( ammodrop.headIcon );
		ammodrop.headIcon setWaypoint( true, true, false );
		break;
		case 4: ammodrop.trigger thread DeamMachineAirDropThink();
		ammodrop.headIcon = newHudElem();
		ammodrop.headIcon.x = ammodrop.origin[0];
		ammodrop.headIcon.y = ammodrop.origin[1];
		ammodrop.headIcon.z = ammodrop.origin[2] + 50;
		ammodrop.headIcon.alpha = 0.85;
		ammodrop.headIcon setShader( "cardicon_skull", 10,10 );
		ammodrop thread monitorIconOrigin( ammodrop.headIcon );
		ammodrop.headIcon setWaypoint( true, true, false );
		break;
	}
	ammodrop thread monitorOrigin( ammodrop.trigger );
	ammodrop thread killCrate();
	wait 5;
	ammodrop Unlink();
	dropCrate Unlink();
	dropCrate destroy();
}

C130FlyBy()
{
	owner = GetHost();
	dropSite = GetAirdropPoint( );
	planeHalfDistance = 24000;
	planeFlySpeed = 2000;
	yaw = vectorToYaw( dropsite );
	direction = ( 0, yaw, 0 );
	flyHeight = self getFlyHeightOffset( dropSite );
	pathStart = dropSite + vector_multiply( anglestoforward( direction ), -1 * planeHalfDistance );
	pathStart = pathStart * ( 1, 1, 0 ) + ( 0, 0, flyHeight );
	pathEnd = dropSite + vector_multiply( anglestoforward( direction ), planeHalfDistance );
	pathEnd = pathEnd * ( 1, 1, 0 ) + ( 0, 0, flyHeight );
	d = length( pathStart - pathEnd );
	flyTime = ( d / planeFlySpeed );
	c130 = c130Setup( owner, pathStart, pathEnd );
	c130.veh_speed = planeFlySpeed;
	c130 playloopsound( "veh_ac130_sonic_boom" );
	c130.angles = direction;
	forward = anglesToForward( direction );
	c130 moveTo( pathEnd, flyTime, 0, 0 );
	minDist = distance2D( c130.origin, dropSite );
	boomPlayed = false;
	for(;;)
	{
		dist = distance2D( c130.origin, dropSite );
		if ( dist < minDist ) minDist = dist;
		else if ( dist > minDist ) break;
		if ( dist < 256 )
		{
			break;
		}
		else if ( dist < 768 )
		{
			earthquake( 0.15, 1.5, dropSite, 1500 );
			if ( !boomPlayed )
			{
				c130 playSound( "veh_ac130_sonic_boom" );
				boomPlayed = true;
			}
		}
		wait ( .05 );
	}
	wait( 0.05 );
	c130 thread dropTheCrate( dropSite, undefined, flyHeight, false, undefined , pathStart );
	wait ( 0.05 );
	c130 notify ( "drop_crate" );
	wait 4.30;
	c130 delete();
}