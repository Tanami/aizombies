
/////////////////////////////////////////////
////////////////////////////////////////////
/////////////////money folder////////////////
///////////////////////////////////////////
///////////////////////////////////////////


Init()
{
	level.moneygunWeapon = "m16_shotgun_xmags_mp";

	level._effect["MoneyFX"]=loadfx("props/cash_player_drop");
	level.moneygunFX["upgradedmoneygun"] = loadFX( "misc/aircraft_light_wingtip_red" );
	level.moneygunFX["impact"] = loadFX( "misc/flare_ambient" );

	level.FX_count = 0;

	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread domoneygun();
	}
}

domoneygun()
{
	for( ;; )
	{
		self waittill( "weapon_fired", weaponName );

		if( self getCurrentWeapon() != level.moneygunWeapon )
			continue;

		start = self getTagOrigin( "tag_eye" );
		end = self getTagOrigin( "tag_eye" ) + vecscale( anglestoforward( self getPlayerAngles() ), 100000 );
		trace = bulletTrace( start, end, true, self );

		thread doLaserFX( self getTagOrigin( "tag_eye" ), anglestoforward( self getPlayerAngles() ), trace["position"] );
	}	
}

doLaserFX( startPos, direction, endPos )
{
	for( i = 1; ; i ++ ) 
	{
		pos = startPos + vecscale( direction, i * 150 ); 

		if (randomint( 150 ) < 10) {
			laserFX = spawnFX( level._effect["MoneyFX"], pos );
			level.FX_count ++;
			triggerFX( laserFX );
			laserFX thread deleteAfterTime( 0.1 );

			}
	
		wait( 0.05 );
	}
}

deleteAfterTime( time )
{
	wait( time );

	self delete();
	level.FX_count --;
}

vecscale( vec, scalar )
{
	return ( vec[0] * scalar, vec[1] * scalar, vec[2] * scalar );
}
