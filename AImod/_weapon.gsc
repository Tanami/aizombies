#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\spawn;
#include AImod\_Mod;

TakeWeaponsAfghan()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_afghan")
	{
		self thread StopBarriers();
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroAfghan();
	}
}

TakeWeaponsScrapyard()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_boneyard")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		wait 0.05;
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroScrapyard();
	}
}

TakeWeaponsSkidrow()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroSkidrow();
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroSkidrow();
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroSkidrow();
	}
}

TakeWeaponsUnderpass()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_underpass")
	{
		self setPlayerAngles((0,90,0));
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		wait 0.05;
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroUnderpass();
	}
}

TakeWeaponsTrailerPark()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_trailerpark")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		wait 0.05;
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroTrailerpark();
	}
}

TakeWeaponsSubBase()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_subbase")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		wait 0.05;
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroSubBase();
	}
}

TakeWeaponsQaurry()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_quarry")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroQuarry();
	}
}

TakeWeaponsStrike()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_strike")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroStrike();
	}
}

TakeWeaponsRust()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_rust")
	{
		self.score = 0;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroRust();
	}
}

TakeWeaponsDerail()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_derail")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroDerail();
	}
}

TakeWeaponsTerminal()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_terminal")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroTerminal();
	}
}

TakeWeaponsSalvage()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_compact")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroSalvage();
	}
}

TakeWeaponsWasteland()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_brecourt")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroWasteland();
	}
}

TakeWeaponsHighrise()
{
	if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		self thread StopBarriers();
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroHighrise();
	}
	else if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroHighrise();
	}
}

TakeWeaponsKarachi()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_checkpoint")
	{
		self setPlayerAngles((0,90,0));
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroKarachi();
	}
}

TakeWeaponsFavela()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_favela")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroFavela();
	}
}

TakeWeaponsRundown()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_rundown")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroRundown();
	}
}

TakeWeaponsBailout()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_complex")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroBailout();
	}
}

TakeWeaponsInvasion()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_invasion")
	{
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroBailout();
	}
}

TakeWeaponsEstate()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_estate")
	{
		self thread StopBarriers();
		self.score = 0;
		self.health = 100;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroEstate();
	}
}

TakeWeaponsCarnival()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_abandon")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroCarnival();
	}
}

TakeWeaponsVacant()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_vacant")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroVacant();
	}
}

TakeWeaponsStorm()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_storm")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroStorm();
	}
}

TakeWeaponsFuel()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_fuel2")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroFuel();
	}
}

TakeWeaponsOvergrown()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_overgrown")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroOvergrown();
	}
}

TakeWeaponsCrash()
{
	self endon("disconnect");
	if(getdvar("mapname") == "mp_crash")
	{
		self.score = 0;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self.kills = 0;
		self.pers["botKillstreak"] = 0;
		self.pers["lastKillstreak"] = "";
		self thread MonitorKillstreaks();
		self TakeAllWeapons();
		self _ClearPerks();
		self thread Pistols();
		self maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
		self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
		self AImod\_Intro::IntroCrash();
	}
}

Pistols()
{
	switch(randomInt(4))
	{
		case 0: self giveWeapon("beretta_mp",10,false);
		self giveMaxAmmo("beretta_mp",10,false);
		wait 0.1;
		self switchToWeapon("beretta_mp",10,false);
		break;
		case 1: self giveWeapon("usp_mp",10,false);
		self giveMaxAmmo("usp_mp",10,false);
		wait 0.1;
		self switchToWeapon("usp_mp",10,false);
		break;
		case 2: self giveWeapon("coltanaconda_mp",10,false);
		self giveMaxAmmo("coltanaconda_mp",10,false);
		wait 0.1;
		self switchToWeapon("coltanaconda_mp",10,false);
		break;
		case 3: self giveWeapon("deserteagle_mp",10,false);
		self giveMaxAmmo("deserteagle_mp",10,false);
		wait 0.1;
		self switchToWeapon("deserteagle_mp",10,false);
		break;
	}
}

InitCountableWeapons()
{
	level.countableweapons[0] = "beretta_mp";
	level.countableweapons[1] = "usp_mp";
	level.countableweapons[2] = "deserteagle_mp";
	level.countableweapons[3] = "coltanaconda_mp";
	level.countableweapons[4] = "glock_mp";
	level.countableweapons[5] = "beretta393_mp";
	level.countableweapons[6] = "mp5k_mp";
	level.countableweapons[7] = "pp2000_mp";
	level.countableweapons[8] = "pp2000_eotech_mp";
	level.countableweapons[9] = "uzi_mp";
	level.countableweapons[10] = "p90_mp";
	level.countableweapons[11] = "kriss_mp";
	level.countableweapons[12] = "ump45_mp";
	level.countableweapons[13] = "tmp_mp";
	level.countableweapons[14] = "ak47_mp";
	level.countableweapons[15] = "m16_reflex_mp";
	level.countableweapons[16] = "m4_reflex_mp";
	level.countableweapons[17] = "fn2000_mp";
	level.countableweapons[18] = "masada_mp";
	level.countableweapons[19] = "famas_mp";
	level.countableweapons[20] = "fal_mp";
	level.countableweapons[21] = "scar_mp";
	level.countableweapons[22] = "tavor_mp";
	level.countableweapons[23] = "m79_mp";
	level.countableweapons[24] = "rpg_mp";
	level.countableweapons[25] = "at4_mp";
	level.countableweapons[26] = "javelin_mp";
	level.countableweapons[27] = "barrett_mp";
	level.countableweapons[28] = "wa2000_acog_mp";
	level.countableweapons[29] = "m21_acog_mp";
	level.countableweapons[30] = "cheytac_mp";
	level.countableweapons[31] = "ranger_mp";
	level.countableweapons[32] = "model1887_mp";
	level.countableweapons[33] = "model1887_fmj_mp";
	level.countableweapons[34] = "striker_mp";
	level.countableweapons[35] = "aa12_mp";
	level.countableweapons[36] = "m1014_mp";
	level.countableweapons[37] = "spas12_mp";
	level.countableweapons[38] = "rpd_mp";
	level.countableweapons[39] = "sa80_mp";
	level.countableweapons[40] = "mg4_mp";
	level.countableweapons[41] = "m240_grip_mp";
	level.countableweapons[42] = "aug_mp";
	level.countableweapons[43] = "onemanarmy_mp";
	level.countableweapons[44] = "m4_silencer_mp";
	level.countableweapons[45] = "tmp_silencer_mp";
	level.countableweapons[46] = "ump45_akimbo_rof_mp";
	level.countableweapons[47] = "usp_silencer_xmags_mp";
	level.countableweapons[48] = "deserteagle_akimbo_mp";
	level.countableweapons[49] = "beretta_akimbo_xmags_mp";
	level.countableweapons[50] = "wa2000_acog_xmags_mp";
	level.countableweapons[51] = "m16_eotech_xmags_mp";
	level.countableweapons[52] = "famas_acog_fmj_mp";
	level.countableweapons[52] = "beretta393_akimbo_xmags_mp";
	level.countableweapons[53] = "ak47_fmj_xmags_mp";
	level.countableweapons[54] = "aa12_grip_xmags_mp";
	level.countableweapons[55] = "striker_xmags_mp";
	level.countableweapons[56] = "cheytac_fmj_mp";
	level.countableweapons[57] = "glock_fmj_silencer_mp";
	level.countableweapons[58] = "rpd_eotech_grip_mp";
	level.countableweapons[59] = "ac130_25mm_mp";
	level.countableweapons[60] = "coltanaconda_akimbo_fmj_mp";
	level.countableweapons[61] = "m4_eotech_shotgun_mp";
	level.countableweapons[62] = "mp5k_fmj_xmags_mp";
	level.countableweapons[63] = "ak47_acog_xmags_mp";
	level.countableweapons[64] = "barrett_acog_xmags_mp";
	level.countableweapons[65] = "sa80_grip_xmags_mp";
	level.countableweapons[66] = "m21_acog_xmags_mp";
	level.countableweapons[67] = "spas12_fmj_mp";
	level.countableweapons[68] = "tmp_fmj_silencer_mp";
	level.countableweapons[69] = "mg4_eotech_xmags_mp";
	level.countableweapons[70] = "pp2000_fmj_reflex_mp";
	level.countableweapons[71] = "aug_eotech_xmags_mp";
	level.countableweapons[72] = "m240_eotech_xmags_mp";
	level.countableweapons[73] = "tavor_fmj_reflex_mp";
	level.countableweapons[74] = "kriss_reflex_rof_mp";
	level.countableweapons[75] = "scar_reflex_xmags_mp";
	level.countableweapons[76] = "ranger_akimbo_fmj_mp";
	level.countableweapons[77] = "p90_rof_xmags_mp";
	level.countableweapons[78] = "masada_reflex_xmags_mp";
	level.countableweapons[79] = "uzi_acog_silencer_mp";
	level.countableweapons[80] = "model1887_akimbo_fmj_mp";
	level.countableweapons[81] = "fn2000_reflex_mp";
	level.countableweapons[82] = "fal_reflex_xmags_mp";
	level.countableweapons[83] = "m1014_xmags_mp";
	level.countableweapons[84] = "tmp_silencer_xmags_mp";
	level.countableweapons[85] = "pp2000_eotech_xmags_mp";
	level.countableweapons[86] = "coltanaconda_akimbo_fmj_mp";
	level.countableweapons[87] = "deserteagle_akimbo_fmj_mp";
	level.countableweapons[88] = "m4_acog_silencer_mp";
	level.countableweapons[89] = "ranger_fmj_mp";
	level.countableweapons[90] = "stinger_mp";
	level.countableweapons[91] = "m16_shotgun_xmags_mp";
	level.countableweapons[92] = "cheytac_xmags_mp";
	level.countableweapons[93] = "cheytac_fmj_silencer_mp";
	}

getAllWeapons(whatWeapon)//What weapon to get
{
	foundWeapon = 0;
	weaponList = self GetWeaponsListAll();
	{
		foreach(weaponName in weaponList)
		{
			if(weaponName != whatWeapon)
			{
				continue;
			}	
			else if(weaponName == whatWeapon)
			{
				foundWeapon = 1;
			}
		}
	}
	if(foundWeapon == 1)
	{
		return true;
	}
	else
	{
		return false;
	}
}

switchtoRandomWeapon()//What weapon to get
{
	pWeapon = undefined;
	weaponList = self GetWeaponsListAll();
	{
		foreach(weaponName in weaponList)
		{
			foreach(countablegun in level.countableweapons)
			{
				if(weaponName != countablegun)
					continue;
				
				if(weaponName == countablegun)
					pWeapon = weaponName;
			}
		}
		self switchToWeapon(pWeapon);
	}
}

IfCanSetOnFire(sWeapon)
{
	setFire = 0;
	switch(sWeapon)
	{
		case "tmp_silencer_mp":
		setFire = 1;
		break;
		case "tmp_silencer_xmags_mp":
		setFire = 1;
		break;
		case "cheytac_mp":
		setFire = 1;
		break;
		case "cheytac_fmj_mp":
		setFire = 1;
		break;
		case "model1887_akimbo_mp":
		setFire = 1;
		break;
		case "m16_shotgun_xmags_mp":
		setBlow = 1;
		break;
	}
	if(setFire == 0)
		return false;
		
	if(setFire == 1)
		return true;
}

IfCanBlowUp(sWeapon)
{
	setBlow = 0;
	switch(sWeapon)
	{
		case "frag_grenade_mp":
		setBlow = 1;
		break;
		case "m16_shotgun_xmags_mp":
		setBlow = 1;
		break;
		case "semtex_mp":
		setBlow = 1;
		break;
		case "c4_mp":
		setBlow = 1;
		break;
		case "gl_ak47_mp":
		setBlow = 1;
		break;
		case "gl_m16_mp":
		setBlow = 1;
		break;
		case "gl_m4_mp":
		setBlow = 1;
		break;
		case "gl_fn2000_mp":
		setBlow = 1;
		break;
		case "gl_masada_mp":
		setBlow = 1;
		break;
		case "gl_famas_mp":
		setBlow = 1;
		break;
		case "gl_fal_mp":
		setBlow = 1;
		break;
		case "gl_scar_mp":
		setBlow = 1;
		break;
		case "gl_tavor_mp":
		setBlow = 1;
		break;
		case "gl_mp":
		setBlow = 1;
		break;
		case "at4_mp":
		setBlow = 1;
		break;
		case "ac130_40mm_mp":
		setBlow = 1;
		break;
		case "ac130_105mm_mp":
		setBlow = 1;
		break;
	}
	if(setBlow == 0)
		return false;
		
	if(setBlow == 1)
		return true;
}

IfCanDoHitmarker(sWeapon)
{
	Hitmarker = 0;
	switch(sWeapon)
	{
		case "tmp_silencer_mp":
		Hitmarker = 1;
		break;
		case "tmp_silencer_xmags_mp":
		Hitmarker = 1;
		break;
		case "pp2000_eotech_mp":
		Hitmarker = 1;
		break;
		case "pp2000_eotech_xmags_mp":
		Hitmarker = 1;
		break;
	}
	if(Hitmarker == 0)
		return true;
		
	if(Hitmarker == 1)
		return false;
}

blowBackGrenade(vPoint)
{
	self startRagDoll(1);
	PhysicsExplosionSphere( vPoint, 30, 30, 6 );
}

AmmoMaticAdd(sWeapon)
{
	AmmoMatic = 0;
	switch(sWeapon)
	{
		case "m16_shotgun_xmags_mp":
		AmmoMatic = 6;
		break;
		case "beretta_mp":
		AmmoMatic = 4;
		break;
		case "usp_mp":
		AmmoMatic = 4;
		break;
		case "deserteagle_mp":
		AmmoMatic = 2;
		break;
		case "coltanaconda_mp":
		AmmoMatic = 2;
		break;
		case "glock_mp":
		AmmoMatic = 4;
		break;
		case "beretta393_mp":
		AmmoMatic = 4;
		break;
		case "mp5k_mp":
		AmmoMatic = 3;
		break;
		case "pp2000_mp":
		AmmoMatic = 2;
		break;
		case "pp2000_eotech_mp":
		AmmoMatic = 1;
		break;
		case "uzi_mp":
		AmmoMatic = 2;
		break;
		case "p90_mp":
		AmmoMatic = 3;
		break;
		case "kriss_mp":
		AmmoMatic = 3;
		break;
		case "ump45_mp":
		AmmoMatic = 2;
		break;
		case "tmp_mp":
		AmmoMatic = 3;
		break;
		case "ak47_mp":
		AmmoMatic = 2;
		break;
		case "m16_reflex_mp":
		AmmoMatic = 2;
		break;
		case "m4_reflex_mp":
		AmmoMatic = 3;
		break;
		case "fn2000_mp":
		AmmoMatic = 3;
		break;
		case "masada_mp":
		AmmoMatic = 3;
		break;
		case "famas_mp":
		AmmoMatic = 2;
		break;
		case "fal_mp":
		AmmoMatic = 1;
		break;
		case "scar_mp":
		AmmoMatic = 2;
		break;
		case "tavor_mp":
		AmmoMatic = 3;
		break;
		case "m79_mp":
		AmmoMatic = 1;
		break;
		case "rpg_mp":
		AmmoMatic = 1;
		break;
		case "at4_mp":
		AmmoMatic = 1;
		break;
		case "javelin_mp":
		AmmoMatic = 1;
		break;
		case "barrett_mp":
		AmmoMatic = 1;
		break;
		case "wa2000_acog_mp":
		AmmoMatic = 1;
		break;
		case "m21_acog_mp":
		AmmoMatic = 1;
		break;
		case "cheytac_mp":
		AmmoMatic = 1;
		break;
		case "ranger_mp":
		AmmoMatic = 1;
		break;
		case "model1887_mp":
		AmmoMatic = 1;
		break;
		case "model1887_fmj_mp":
		AmmoMatic = 1;
		break;
		case "striker_mp":
		AmmoMatic = 1;
		break;
		case "aa12_mp":
		AmmoMatic = 1;
		break;
		case "m1014_mp":
		AmmoMatic = 1;
		break;
		case "spas12_mp":
		AmmoMatic = 1;
		break;
		case "rpd_mp":
		AmmoMatic = 2;
		break;
		case "sa80_mp":
		AmmoMatic = 2;
		break;
		case "mg4_mp":
		AmmoMatic = 2;
		break;
		case "m240_grip_mp":
		AmmoMatic = 2;
		break;
		case "aug_mp":
		AmmoMatic = 2;
		break;
		case "m4_silencer_mp":
		AmmoMatic = 2;
		break;
		case "tmp_silencer_mp":
		AmmoMatic = 1;
		break;
		case "ump45_akimbo_rof_mp":
		AmmoMatic = 7;
		break;
		case "usp_silencer_xmags_mp":
		AmmoMatic = 10;
		break;
		case "deserteagle_akimbo_mp":
		AmmoMatic = 4;
		break;
		case "beretta_akimbo_xmags_mp":
		AmmoMatic = 2;
		break;
		case "wa2000_acog_xmags_mp":
		AmmoMatic = 2;
		break;
		case "m16_eotech_xmags_mp":
		AmmoMatic = 3;
		break;
		case "famas_acog_fmj_mp":
		AmmoMatic = 3;
		break;
		case "beretta393_akimbo_xmags_mp":
		AmmoMatic = 4;
		break;
		case "ak47_fmj_xmags_mp":
		AmmoMatic = 4;
		break;
		case "aa12_grip_xmags_mp":
		AmmoMatic = 2;
		break;
		case "striker_xmags_mp":
		AmmoMatic = 2;
		break;
		case "cheytac_fmj_mp":
		AmmoMatic = 2;
		break;
		case "cheytac_xmags_mp":
		AmmoMatic = 2;
		break;
		case "cheytac_fmj_silencer_mp":
		AmmoMatic = 2;
		break;
		case "glock_fmj_silencer_mp":
		AmmoMatic = 8;
		break;
		case "rpd_eotech_grip_mp":
		AmmoMatic = 3;
		break;
		case "coltanaconda_akimbo_fmj_mp":
		AmmoMatic = 4;
		break;
		case "m4_eotech_shotgun_mp":
		AmmoMatic = 3;
		break;
		case "mp5k_fmj_xmags_mp":
		AmmoMatic = 3;
		break;
		case "ak47_acog_xmags_mp":
		AmmoMatic = 4;
		break;
		case "sa80_grip_xmags_mp":
		AmmoMatic = 3;
		break;
		case "m21_acog_xmags_mp":
		AmmoMatic = 2;
		break;
		case "spas12_fmj_mp":
		AmmoMatic = 2;
		break;
		case "tmp_fmj_silencer_mp":
		AmmoMatic = 10;
		break;
		case "mg4_eotech_xmags_mp":
		AmmoMatic = 3;
		break;
		case "pp2000_fmj_reflex_mp":
		AmmoMatic = 3;
		break;
		case "aug_eotech_xmags_mp":
		AmmoMatic = 3;
		break;
		case "m240_eotech_xmags_mp":
		AmmoMatic = 3;
		break;
		case "tavor_fmj_reflex_mp":
		AmmoMatic = 3;
		break;
		case "kriss_reflex_rof_mp":
		AmmoMatic = 3;
		break;
		case "scar_reflex_xmags_mp":
		AmmoMatic = 3;
		break;
		case "ranger_akimbo_fmj_mp":
		AmmoMatic = 2;
		break;
		case "p90_rof_xmags_mp":
		AmmoMatic = 7;
		break;
		case "masada_reflex_xmags_mp":
		AmmoMatic = 4;
		break;
		case "uzi_acog_silencer_mp":
		AmmoMatic = 3;
		break;
		case "model1887_akimbo_fmj_mp":
		AmmoMatic = 2;
		break;
		case "fn2000_reflex_mp":
		AmmoMatic = 3;
		break;
		case "fal_reflex_xmags_mp":
		AmmoMatic = 2;
		break;
		case "m1014_xmags_mp":
		AmmoMatic = 2;
		break;
		case "tmp_silencer_xmags_mp":
		AmmoMatic = 2;
		break;
		case "pp2000_eotech_xmags_mp":
		AmmoMatic = 1;
		break;
		case "deserteagle_akimbo_fmj_mp":
		AmmoMatic = 4;
		break;
		case "m4_acog_silencer_mp":
		AmmoMatic = 3;
		break;
		case "barrett_acog_xmags_mp":
		AmmoMatic = 1;
		break;
		case "ranger_fmj_mp":
		AmmoMatic = 1;
		break;
		case "stinger_mp":
		AmmoMatic = 1;
		break;
	}
	return AmmoMatic;
}

IncreaseDamage(sWeapon, type)
{
	switch(sWeapon)
	{
		case "ac130_105mm_mp":
		self.crate1.health -= 2000;
		break;
		case "glock_fmj_silencer_mp":
		self.crate1.health -= 15;
		break;
		case "ac130_40mm_mp":
		self.crate1.health -= 2000;
		break;
		case "ac130_25mm_mp":
		self.crate1.health -= 0;
		break;
		case "m240_xmags_mp":
		self.crate1.health -= 30;
		break;
		case "m240_fmj_xmags_mp":
		self.crate1.health -= 15;
		break;
		case "ak47_acog_xmags_mp":
		self.crate1.health -= 10;
		break;
		case "m4_eotech_shotgun_mp":
		self.crate1.health -= 15;
		break;
		case "coltanaconda_akimbo_fmj_mp":
		self.crate1.health -= 40;
		break;
		case "fal_reflex_xmags_mp":
		self.crate1.health -= 20;
		break;
		case "cheytac_mp":
		self.crate1.health -= 80;
		break;
		case "m16_shotgun_xmags_mp":
		self.crate1.health -= 50;
		break;
		case "cheytac_fmj_mp":
		self.crate1.health -= 340;
		break;
		case "cheytac_xmags_mp":
		self.crate1.health -= 500;
		break;
		case "cheytac_fmj_silencer_mp":
		self.crate1.health -= 340;
		break;
		case "m21_acog_xmags_mp":
		self.crate1.health -= 15;
		break;
		case "tmp_fmj_silencer_mp":
		self.crate1.health -= 19;
		break;
		case "spas12_fmj_mp":
		self.crate1.health -= 30;
		break;
		case "beretta393_akimbo_xmags_mp":
		self.crate1.health -= 10;
		break;
		case "ump45_akimbo_rof_mp":
		self.crate1.health -= 10;
		break;
		case "aa12_grip_xmags_mp":
		self.crate1.health -= 30;
		break;
		case "kriss_reflex_rof_mp":
		self.crate1.health -= 15;
		break;
		case "deserteagle_akimbo_fmj_mp":
		self.crate1.health -= 145;
		break;
		case "fn2000_reflex_mp":
		self.crate1.health -= 15;
		break;
		case "barrett_acog_xmags_mp":
		self.crate1.health -= 170;
		break;
		case "mp5k_fmj_xmags_mp":
		self.crate1.health -= 10;
		break;
		case "p90_rof_xmags_mp":
		self.crate1.health -= 15;
		break;
		case "sa80_grip_xmags_mp":
		self.crate1.health -= 10;
		break;
		case "famas_acog_fmj_mp":
		self.crate1.health -= 15;
		break;
		case "m16_eotech_xmags_mp":
		self.crate1.health -= 50;
		break;
		// lol
		case "usp_silencer_xmags_mp":
		self.crate1.health -= 10;
		break;
	}
}

ZombieAirstrikeSound(sWeapon)
{
	switch(randomInt(12))
	{
		case 0:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_rightontarget" );
		break;
		case 1:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_goodkill" );
		break;
		case 2:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_yougothim" );
		break;
		case 3:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_yougothim2" );
		break;
		case 4:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_thatsahit" );
		break;
		case 5:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_directhit" );
		break;
		case 6:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_within2feet" );
		break;
		case 7:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_plt_gottahurt" );
		break;
		case 8:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_oopsiedaisy" );
		break;
		case 9:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_iseepieces" );
		break;
		case 10:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_nice" );
		break;
		case 11:
		self PlayLocalSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "ac130_fco_directhits" );
		break;
	}
}