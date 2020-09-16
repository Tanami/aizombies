#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

SetNormalRound()
{
	if(level.BotsForWave >= 350)
	{
	    level.BotsForWave = 350;
	}
	if(level.Wave == 6)
	{
		level.BotsForWave = 60;
		level.ZombieHealth = 160;
	}
	else if(level.Wave == 11)
	{
		level.BotsForWave = 110;
		level.ZombieHealth = 210;
	}
	else if(level.Wave == 16)
	{
		level.BotsForWave = 160;
		level.ZombieHealth = 260;
	}
	else if(level.Wave == 21)
	{
		level.BotsForWave = 210;
		level.ZombieHealth = 310;
	}
	else if(level.Wave == 26)
	{
		level.BotsForWave = 260;
		level.ZombieHealth = 360;
	}
}

