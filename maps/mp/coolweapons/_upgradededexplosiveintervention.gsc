
//////////////////////////////////////////
//////////////////////////////////////////
///////////Upgraded Intervention Explosive Bullets///////////
/////////////////////////////////////////


Init()
{
	level.UpgradedInterventionWeapon = "cheytac_fmj_mp";

	level.UpgradedInterventionWeaponFX["largeexplosion"] = loadFX( "smoke/smoke_trail_black_heli" );

	level.FX_count = 0;

	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread doUpgradedInterventiongun();
	}
}

doUpgradedInterventiongun()
{
	for( ;; )
	{
		self waittill( "weapon_fired", weaponName );

		if( self getCurrentWeapon() != level.UpgradedInterventionWeapon )
			continue;


		start = self getTagOrigin( "tag_eye" );
		end = self getTagOrigin( "tag_eye" ) + vecscale( anglestoforward( self getPlayerAngles() ), 100000 );
		trace = bulletTrace( start, end, true, self );
 

		thread InterventionFX( self getTagOrigin( "tag_flash" ), anglestoforward( self getPlayerAngles() ), trace["position"] );
	}	
}

InterventionFX( startPos, direction, endPos )
{
	doDamage = 1;

	if (level.FX_count < 200) {
		pos = startPos + vecscale( direction, i * 3000 ); 

		if( distance( startPos, pos ) > 10000 ) 
		{
			doDamage = 0;
			break;
		}

		trace = bulletTrace( startPos, pos, true, self );

		if( !bulletTracePassed( startPos, pos, true, self ) )
		{
			largeexplosionFX = spawnFX( level.UpgradedInterventionWeaponFX["largeexplosion"], bulletTrace( startPos, pos, true, self )["position"] );
			level.FX_count ++;
			triggerFX( largeexplosionFX );
			self playsound("explo_mine");

			wait( 0.2 );

			largeexplosionFX delete();
			level.FX_count --;
			
			break;
		}

		level.FX_count ++;

		wait( 0.05 );
	}

	if( doDamage )
		radiusDamage( endPos, 100, 130, 130, self );
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