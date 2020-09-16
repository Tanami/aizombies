
///////////////////////////////////////////
///////////////////////////////////////////
///////////////// knifeION ////////////////
///////////////////////////////////////////
///////////////////////////////////////////


Init()
{
	level.knifeWeapon = "usp_silencer_xmags_mp";
	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread doknife();
	}
}

GetCursorPos()
{
	forward = self getTagOrigin("tag_eye");
	end = self thread vector_scale(anglestoforward(self getPlayerAngles()),1000000);
	location = BulletTrace( forward, end, 0, self)[ "position" ];
	return location;
}

vector_scale(vec, scale)
{
	return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
} 

doknife()
{
	for( ;; )
	{
		self waittill( "weapon_fired" );

		if( self getCurrentWeapon() != level.knifeWeapon )
			continue;

		start = self getTagOrigin("tag_weapon_right");
		sentry = spawn("script_model", start);
		sentry setModel( "weapon_parabolic_knife");
		sentry.angles = self getTagAngles("tag_eye");
		sentry MoveTo(GetCursorPos(), 0.05);
		MagicBullet( "throwingknife_mp", self getTagOrigin("tag_weapon_right"), GetCursorPos(), self );
		wait 0.1;
		sentry delete();
		
	}
}