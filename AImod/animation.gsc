#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

RegularAnim()
{
	if(level.power == 0)
	{
		switch(randomInt(8))
		{
			case 0: self scriptModelPlayAnim("pb_sprint_gundown");
			self.animation = "pb_sprint_gundown";
			self.speed = 150;
			self.speed2 = 150;
			break;
			case 1: self scriptModelPlayAnim("pb_sprint_mg");
			self.animation = "pb_sprint_mg";
			self.speed = 170;
			self.speed2 = 170;
			break;
			case 2: self scriptModelPlayAnim("pb_sprint_akimbo");
			self.animation = "pb_sprint_akimbo";
			self.speed = 220;
			self.speed2 = 220;
			break;
			case 3: self scriptModelPlayAnim("pb_sprint_shield");
			self.animation = "pb_sprint_shield";
			self.speed = 170;
			self.speed2 = 170;
			break;
			case 4: self scriptModelPlayAnim("pb_pistol_run_fast");
			self.animation = "pb_pistol_run_fast";
			self.speed = 250;
			self.speed2 = 250;
			break;
			case 5: self scriptModelPlayAnim("pb_sprint_pistol");
			self.animation = "pb_sprint_pistol";
			self.speed = 200;
			self.speed2 = 200;
			break;
			case 6: self scriptModelPlayAnim("pb_walk_forward_shield");
			self.animation = "pb_walk_forward_shield";
			self.speed = 70;
			self.speed2 = 70;
			self.ZombieHealth += 50;
			break;
			case 7: self scriptModelPlayAnim("pb_combatwalk_forward_loop_pistol");
			self.animation = "pb_combatwalk_forward_loop_pistol";
			self.speed = 90;
			self.speed2 = 90;
			self.ZombieHealth += 100;
			break;
		}
		self.idleanimation = 0;
		self.freezed = 0;
		self.automove = 0;
	}
	if(level.power == 1)
	{
		switch(randomInt(9))
		{
			case 0: self scriptModelPlayAnim("pb_sprint_gundown");
			self.animation = "pb_sprint_gundown";
			self.speed = 150;
			self.speed2 = 150;
			break;
			case 1: self scriptModelPlayAnim("pb_sprint_mg");
			self.animation = "pb_sprint_mg";
			self.speed = 170;
			self.speed2 = 170;
			break;
			case 2: self scriptModelPlayAnim("pb_sprint_akimbo");
			self.animation = "pb_sprint_akimbo";
			self.speed = 220;
			self.speed2 = 220;
			break;
			case 3: self scriptModelPlayAnim("pb_sprint_shield");
			self.animation = "pb_sprint_shield";
			self.speed = 170;
			self.speed2 = 170;
			break;
			case 4: self scriptModelPlayAnim("pb_pistol_run_fast");
			self.animation = "pb_pistol_run_fast";
			self.speed = 250;
			self.speed2 = 250;
			break;
			case 5: self scriptModelPlayAnim("pb_sprint_pistol");
			self.animation = "pb_sprint_pistol";
			self.speed = 200;
			self.speed2 = 200;
			break;
			case 6: self scriptModelPlayAnim("pb_combatrun_forward_loop_stickgrenade");
			self.animation = "pb_combatrun_forward_loop_stickgrenade";
			self.c4 = spawn("script_model", self getTagOrigin("tag_inhand"));
			self.c4 setModel("weapon_c4");
			self.c4 linkto(self,"tag_inhand", ( 0,0,0 ), ( 0,0,0));
			self.speed = 160;
			self.speed2 = 160;
			break;
			case 7: self scriptModelPlayAnim("pb_walk_forward_shield");
			self.animation = "pb_walk_forward_shield";
			self.speed = 70;
			self.speed2 = 70;
			self.ZombieHealth += 50;
			self.shield = spawn("script_model",self getTagOrigin("tag_stowed_back")); 
			self.shield setModel(GetWeaponModel("riotshield_mp", 0));
			self.shield.angles = (0,180,0);
			self.shield linkto( self, "tag_stowed_back" );
			break;
			case 8: self scriptModelPlayAnim("pb_combatwalk_forward_loop_pistol");
			self.animation = "pb_combatwalk_forward_loop_pistol";
			self.speed = 90;
			self.speed2 = 90;
			self.ZombieHealth += 100;
			break;
		}
		self.idleanimation = 0;
		self.freezed = 0;
		self.automove = 0;
		self thread SpawnSpeedUp();
	}
}

HellAnim()
{
	switch(randomInt(7))
	{
		case 0: self scriptModelPlayAnim("pb_sprint_gundown");
		self.animation = "pb_sprint_gundown";
		self.speed = 250;
		self.speed2 = 250;
		break;
		case 1: self scriptModelPlayAnim("pb_sprint_mg");
		self.animation = "pb_sprint_mg";
		self.speed = 250;
		self.speed2 = 250;
		break;
		case 2: self scriptModelPlayAnim("pb_sprint_akimbo");
		self.animation = "pb_sprint_akimbo";
		self.speed = 270;
		self.speed2 = 270;
		break;
		case 3: self scriptModelPlayAnim("pb_sprint_shield");
		self.animation = "pb_sprint_shield";
		self.speed = 300;
		self.speed2 = 300;
		self.shield = spawn("script_model",self getTagOrigin("tag_stowed_back")); 
		self.shield setModel(GetWeaponModel("riotshield_mp", 0));
		self.shield.angles = (0,180,0);
		self.shield linkto( self, "tag_stowed_back" );
		break;
		case 4: self scriptModelPlayAnim("pb_pistol_run_fast");
		self.animation = "pb_pistol_run_fast";
		self.speed = 230;
		self.speed2 = 230;
		break;
		case 5: self scriptModelPlayAnim("pb_sprint_pistol");
		self.animation = "pb_sprint_pistol";
		self.speed = 200;
		self.speed2 = 200;
		break;
		case 6: self scriptModelPlayAnim("pb_combatrun_forward_loop_stickgrenade");
		self.animation = "pb_combatrun_forward_loop_stickgrenade";
		self.speed = 270;
		self.speed2 = 270;
		break;
	}
	self.idleanimation = 0;
	self.freezed = 0;
	self.automove = 0;
}

SpawnSpeedUp()
{
	self endon("bot_death");
	self.speed += 100;
	self.speed2 += 100;
	wait 5;
	self.speed -= 100;
	self.speed2 -= 100;
}

BossAnim()
{
	self scriptModelPlayAnim("pb_sprint_mg");
	self.animation = "pb_sprint_mg";
	self.speed = 330;
	self.speed2 = 330;
	self.idleanimation = 0;
	self.freezed = 0;
	self.automove = 0;
}

BossAnim2()
{
	self scriptModelPlayAnim("pb_sprint_mg");
	self.animation = "pb_sprint_mg";
	self.speed = 300;
	self.speed2 = 300;
	self.idleanimation = 0;
	self.freezed = 0;
	self.automove = 0;
}

CrawlerAnim()
{
	self scriptModelPlayAnim("pb_prone_crawl_akimbo");
	self.animation = "pb_prone_crawl_akimbo";
	self.speed = RandomIntRange( 70, 260 );
	self.speed2 = self.speed;
	self.idleanimation = 0;
	self.freezed = 0;
	self.automove = 0;
}

ExplosionDeath()
{
	switch(randomInt(1))
	{
		case 0: self scriptModelPlayAnim("pb_stand_death_leg_kickup");
		break;
	}
}

HitPainAnim()
{
	self endon("bot_death");
	self endon("hit");
	self scriptModelPlayAnim("pb_stumble_forward");
	wait 0.4;
	if(self.idleanimation == 1)
		self scriptModelPlayAnim("pb_stand_alert");
	else
		self scriptModelPlayAnim(self.animation);
}

DeathSound()
{
	switch(randomInt(4))
	{
		case 0:
		self playSound("generic_death_russian_1");
		break;
		case 1:
		self playSound("generic_death_american_1");
		break;
		case 2:
		self playSound("generic_death_russian_2");
		break;
		case 3:
		self playSound("generic_death_american_2");
		break;
	}
}

DeathReguler()
{
	if(getDvar("mapname") == "mp_afghan" || getDvar("mapname") == "mp_trailerpark" || getDvar("mapname") == "mp_estate")
	{
		switch(randomInt(9))
		{
			case 0: self scriptModelPlayAnim("pb_death_run_stumble");
			break;
			case 1: self scriptModelPlayAnim("pb_stand_death_leg_kickup");
			break;
			case 2: self scriptModelPlayAnim("pb_stand_death_shoulderback");
			break;
			case 3: self scriptModelPlayAnim("pb_shotgun_death_front");
			break;
			case 4: self scriptModelPlayAnim("pb_crouch_death_falltohands");
			break;
			case 5: self scriptModelPlayAnim("pb_crouchrun_death_drop");
			break;
			case 6: self scriptModelPlayAnim("pb_death_run_onfront");
			break;
			case 7: self scriptModelPlayAnim("pb_stand_death_head_straight_back");
			break;
			case 8: self scriptModelPlayAnim("pb_crouchrun_death_drop");
			break;
		}
	}
	else
	{
		switch(randomInt(3))
		{
			case 0: self scriptModelPlayAnim("pb_death_run_stumble");
			break;
			case 1: self scriptModelPlayAnim("pb_stand_death_leg_kickup");
			break;
			case 2: self scriptModelPlayAnim("pb_stand_death_shoulderback");
			break;
		}
	}
}

PlayFireDeath()
{
	playFXonTag(loadFx("fire/fire_smoke_trail_L_emitter"), self, "j_spinelower");
	playFXonTag(loadFx("smoke/smoke_trail_black_heli_emitter"), self, "j_spine4");
	wait 0.2;
}

MoniterPosition()
{	
	self endon("bot_death");
	while(1)
	{
		level.zombieorigin = self.origin;
		level.zombieangles = self.angles;
		wait 0.1;
	}
}