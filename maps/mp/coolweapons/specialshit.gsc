Init()
{
	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );
		player thread WeapLoop();
//		player thread giveKnives();
	}
}

WeapLoop()
{
	while(1)
	{
		self waittill( "weapon_change" );

		if(self getCurrentWeapon() == "cheytac_fmj_silencer_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self player_recoilScaleOn(0);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("cg_gun_x", 3);
			self setClientDvar("player_breath_gasp_lerp", 0);
			self setClientDvar("perk_weapSpreadMultiplier", "0.00001");
			self setClientDvar("perk_weapRateMultiplier", 0.35);
			self setClientDvar("perk_bulletPenetrationMultiplier", "300");
			self maps\mp\perks\_perks::givePerk("specialty_rof");
		}
		else if (self getCurrentWeapon() == "glock_fmj_silencer_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self player_recoilScaleOn(0);
			self setClientDvar("cg_gun_x", 3);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("perk_weapSpreadMultiplier", "0.00001");
			self setClientDvar("perk_bulletPenetrationMultiplier", "90");

			/* // does not work on zombies
			self setClientDvar( "aim_autoaim_enabled" , 1 );
			self setClientDvar( "aim_autoaim_lerp" , 100 );
			self setClientDvar( "aim_autoaim_region_height" , 120 );
			self setClientDvar( "aim_autoaim_region_width" , 99999999 );
			self setClientDvar( "aim_autoAimRangeScale" , 2 );
			self setClientDvar( "aim_lockon_debug" , 1 ); 		 
			self setClientDvar( "aim_lockon_enabled" , 1 );
			self setClientDvar( "aim_lockon_region_height" , 0 );
			self setClientDvar( "aim_lockon_region_width" , 1386 );
			self setClientDvar( "aim_lockon_strength" , 1 );
			self setClientDvar( "aim_lockon_deflection" , 0.05 );
			self setClientDvar( "aim_input_graph_debug" , 0 );
			self setClientDvar( "aim_input_graph_enabled" , 1 );
			*/
		}
		else if (self getCurrentWeapon() == "model1887_akimbo_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("perk_quickDrawSpeedScale", 10);
			self setClientDvar("perk_weapRateMultiplier", 0.5);
			self setClientDvar("perk_weapSpreadMultiplier", "0.25");
		}
		else if (self getCurrentWeapon() == "coltanaconda_akimbo_fmj_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self setClientDvar("cg_gun_x", 5);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("perk_weapSpreadMultiplier", "0.05");
			self setClientDvar("perk_bulletPenetrationMultiplier", "30");
		}
		else if (self getCurrentWeapon() == "deserteagle_akimbo_fmj_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self setClientDvar("cg_gun_x", 5);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("perk_weapReloadMultiplier", 0.50);
			self setClientDvar("perk_weapSpreadMultiplier", "0.01");
			self setClientDvar("perk_bulletPenetrationMultiplier", "50");
			}
		else if (self getCurrentWeapon() == "ump45_akimbo_rof_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("cg_gun_x", 3);
			self setClientDvar("perk_weapSpreadMultiplier", "0.05");
		}
		else if (self getCurrentWeapon() == "spas12_fmj_mp")
		{
			self setClientDvar("sv_cheats", 1);
			self setClientDvar("player_sprintUnlimited", "1");
			self setClientDvar("player_sprintSpeedScale", "10.0");
			self setClientDvar("jump_height", 500);
			self setClientDvar("bg_lowGravity", 10);
			self setClientDvar("bg_fallDamageMaxHeight", 9999);
			self setClientDvar("bg_fallDamageMinHeight", 9998);
			self setClientDvar("perk_weapRateMultiplier", 0.05);
			self setClientDvar("perk_weapReloadMultiplier", 0.50);
		}
		else if (self getCurrentWeapon() == "p90_rof_xmags_mp")
		{
			self setClientDvar("perk_weapRateMultiplier", 0.15);
			self setClientDvar("perk_weapReloadMultiplier", 0.50);
			self setClientDvar("perk_weapSpreadMultiplier", "0.15");
			self setClientDvar("perk_bulletPenetrationMultiplier", "50");
		}
		else if (self getCurrentWeapon() == "scar_reflex_xmags_mp")
		{
			self setClientDvar("perk_weapRateMultiplier", 0.02);
			self setClientDvar("perk_weapSpreadMultiplier", "0.05");
			self setClientDvar("perk_bulletPenetrationMultiplier", "50");
		}
		else if (self getCurrentWeapon() == "usp_silencer_xmags_mp")
		{
			self setClientDvar("cg_gun_x", 3);
			self player_recoilScaleOn(0);
			self setClientDvar("cg_laserlight", 1);
			self setClientDvar("laserForceOn", 1);
			self setClientDvar("perk_weapSpreadMultiplier", "0.00001");
			self setClientDvar("perk_bulletPenetrationMultiplier", "200");
		}
		else if (self getCurrentWeapon() == "ak47_acog_xmags_mp")
		{
			self player_recoilScaleOn(0);
		}
		else if (self getCurrentWeapon() == "barrett_acog_xmags_mp")
		{
			self player_recoilScaleOn(0);
			self setClientDvar("player_breath_gasp_lerp", 0);
			self setClientDvar("cg_gun_x", 3);
		}
		else {
				self player_recoilScaleOn(100);
				self setClientDvar("cg_gun_x", 0);
				self setClientDvar("cg_laserlight", 0);
				self setClientDvar("laserForceOn", 0);
				self setClientDvar("perk_weapRateMultiplier", 0.75);
				self setClientDvar("perk_weapReloadMultiplier", 0.5);
				self setClientDvar("perk_weapSpreadMultiplier", "0.65");
				self setClientDvar("perk_bulletPenetrationMultiplier", "2");		
				self setClientDvar("perk_quickDrawSpeedScale", "1.5");
				self setClientDvar("player_breath_gasp_lerp", 6);
				self setClientDvar("jump_height", 39);
				self setClientDvar("bg_fallDamageMaxHeight", 300);
				self setClientDvar("bg_fallDamageMinHeight", 128);
				self setClientDvar("g_gravity", 800);
			}
	}
}

// causes overflow
giveKnives()
{
	for(;;) {
		if (self getCurrentWeapon() == "usp_silencer_xmags_mp") {
			maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
			self setWeaponAmmoClip("throwingknife_mp", 1);
		}
		wait 0.05;
	}
}