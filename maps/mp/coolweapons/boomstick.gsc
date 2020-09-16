
///////////////////////////////////////////
///////////////////////////////////////////
///////////////// stickION ////////////////
///////////////////////////////////////////
///////////////////////////////////////////


Init()
{
	level.stickWeapon = "model1887_akimbo_mp";
	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread dostick();
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

dostick()
{
	for( ;; )
	{
		self waittill( "weapon_fired" );
		if ( self getCurrentWeapon() == "model1887_akimbo_mp" )
		{
			MagicBullet( "rpg_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
		}
	}
}