#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

IntermissionCountdown()
{
	level endon("disconnect");
	level waittill("start_zombie_round");
	for(count = level.IntermissionTimeStart;count > -1;count--)
	{
		wait 1;
		level.IntermissionTime = count;
	}
	wait 5;
	level thread maps\mp\killstreaks\_uav::launchUAV();
	//TODO: add timer [Intermission Time]
	for(i=0;i < level.MaxWaves;i++)
	{
		level thread AImod\_Bot::BotMain();
		level waittill("round_ended");
		level.IntermissionTime = 20;
		wait 1;
		level.IntermissionTime = 19;
		wait 1;
		level.IntermissionTime = 18;
		wait 1;
		level.IntermissionTime = 17;
		wait 1;
		level.IntermissionTime = 16;
		wait 1;
		level.IntermissionTime = 15;
		wait 1;
		level.IntermissionTime = 14;
		wait 1;
		level.IntermissionTime = 13;
		wait 1;
		level.IntermissionTime = 12;
		wait 1;
		level.IntermissionTime = 11;
		wait 1;
		level.IntermissionTime = 10;
		wait 1;
		level.IntermissionTime = 9;
		wait 1;
		level.IntermissionTime = 8;
		wait 1;
		level.IntermissionTime = 7;
		wait 1;
		level.IntermissionTime = 6;
		wait 1;
		level.IntermissionTime = 5;
		wait 1;
		level.IntermissionTime = 4;
		wait 1;
		level.IntermissionTime = 3;
		wait 1;
		level.IntermissionTime = 2;
		wait 1;
		level.IntermissionTime = 1;
		wait 1;
		level.IntermissionTime = 0;
		wait 2;
	}
}

HudMain()
{
	self endon("disconnect");
	{
		self.MainHud[0] = self createFontString("objective", 1.5);
		self.MainHud[0] setPoint("BOTTOMLEFT", "BOTTOMLEFT", 0, -15);
		self.MainHud[0].label = &"Zombies: ";
		self.MainHud[0].HideWhenInMenu = true;
		self.MainHud[0] thread UpdateZombies(self);
		self.MainHud[0].color = (1,0.5,0.2);
		self.MainHud[0].alpha = 1;
		self.MainHud[1] = self createFontString("objective", 1.5);
		self.MainHud[1] setPoint("BOTTOMLEFT", "BOTTOMLEFT", 0, 0);
		self.MainHud[1] thread UpdateRound(self);
		self.MainHud[1].color = (1,0.5,0.2);
		self.MainHud[1].alpha = 1;
	}
}

UpdateZombies(player)
{
	player endon("death");
	while(1)
	{
		if(AImod\_botUtil::ZombieCount() < 1)
		{
			self.color = (0.3,0.9,0.3);
			self setValue(AImod\_botUtil::ZombieCount());
		}
		else
		{
			self.color = (1,0.5,0.2);
			self setValue(AImod\_botUtil::ZombieCount());
		}
		wait 0.1;
	}
}

UpdateRound(player)
{
	player endon("death");
	while(1)
	{
		if(level.zState != "intermission")
		{
			self.color = (1,0.5,0.2);
			self.label = &"Wave: ";
			self setValue(level.Wave);
		}
		else if(level.zState == "intermission")
		{
			self.color = (0.3,0.9,0.3);
			self.label = &"Intermission Next Wave: ";
			self setValue(level.Wave + 1);
		}
		wait 0.1;
	}
}