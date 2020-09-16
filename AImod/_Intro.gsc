#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WelcomeText( text, text2, text3, text4, text5, intensity, color, glow, glowintensity, color2, glow2, glowintensity2, color3, glow3, glowintensity3, color4, glow4, glowintensity4, color5, glow5, glowintensity5 )
{
	self endon( "disconnect" );
	wait ( 0.05 );
	if(isDefined(self.welcometext[0]))
		self.welcometext[0] destroy();
	if(isDefined(self.welcometext[1]))
		self.welcometext[1] destroy();
	if(isDefined(self.welcometext[2]))
		self.welcometext[2] destroy();
	if(isDefined(self.welcometext[3]))
		self.welcometext[3] destroy();
	if(isDefined(self.welcometext[4]))
		self.welcometext[4] destroy();
	self notify( "welcome_text" );
	self endon( "welcome_text" );
	self.welcometext[0] = self createFontString("objective", 1.5);
	self.welcometext[0] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 45);
	self.welcometext[0].fontscale = 6;
	self.welcometext[0].color = color;
	self.welcometext[0] setText(text);
	self.welcometext[0].alpha = 0;
	self.welcometext[0].glowColor = glow;
	self.welcometext[0].glowAlpha = glowintensity;
	self.welcometext[0] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[0] fadeOverTime( 0.2 );
	self.welcometext[0].alpha = intensity;
	self.welcometext[0].fontScale = 1.5;
	wait 0.5;
	self.welcometext[1] = self createFontString("objective", 1.5);
	self.welcometext[1] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 60);
	self.welcometext[1].fontscale = 6;
	self.welcometext[1].color = color2;
	self.welcometext[1] setText(text2);
	self.welcometext[1].alpha = 0;
	self.welcometext[1].glowColor = glow2;
	self.welcometext[1].glowAlpha = glowintensity2;
	self.welcometext[1] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[1] fadeOverTime( 0.2 );
	self.welcometext[1].alpha = intensity;
	self.welcometext[1].fontScale = 1.5;
	wait 0.5;
	self.welcometext[2] = self createFontString("objective", 1.5);
	self.welcometext[2] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 75);
	self.welcometext[2].fontscale = 6;
	self.welcometext[2].color = color3;
	self.welcometext[2] setText(text3);
	self.welcometext[2].alpha = 0;
	self.welcometext[2].glowColor = glow3;
	self.welcometext[2].glowAlpha = glowintensity3;
	self.welcometext[2] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[2] fadeOverTime( 0.2 );
	self.welcometext[2].alpha = intensity;
	self.welcometext[2].fontScale = 1.5;
	wait 0.5;
	self.welcometext[3] = self createFontString("objective", 1.5);
	self.welcometext[3] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 90);
	self.welcometext[3].fontscale = 6;
	self.welcometext[3].color = color4;
	self.welcometext[3] setText(text4);
	self.welcometext[3].alpha = 0;
	self.welcometext[3].glowColor = glow4;
	self.welcometext[3].glowAlpha = glowintensity4;
	self.welcometext[3] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[3] fadeOverTime( 0.2 );
	self.welcometext[3].alpha = intensity;
	self.welcometext[3].fontScale = 1.5;
	wait 0.5;
	self.welcometext[4] = self createFontString("objective", 1.5);
	self.welcometext[4] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 105);
	self.welcometext[4].fontscale = 6;
	self.welcometext[4].color = color5;
	self.welcometext[4] setText(text5);
	self.welcometext[4].alpha = 0;
	self.welcometext[4].glowColor = glow5;
	self.welcometext[4].glowAlpha = glowintensity5;
	self.welcometext[4] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[4] fadeOverTime( 0.2 );
	self.welcometext[4].alpha = intensity;
	self.welcometext[4].fontScale = 1.5;
	wait 0.5;
	wait 3.5;
	self.welcometext[0] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[0] fadeOverTime( 0.2 );
	self.welcometext[0].alpha = 0;
	self.welcometext[0].fontScale = 4.5;
	wait 0.5;
	self.welcometext[1] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[1] fadeOverTime( 0.2 );
	self.welcometext[1].alpha = 0;
	self.welcometext[1].fontScale = 4.5;
	wait 0.5;
	self.welcometext[2] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[2] fadeOverTime( 0.2 );
	self.welcometext[2].alpha = 0;
	self.welcometext[2].fontScale = 4.5;
	wait 0.5;
	self.welcometext[3] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[3] fadeOverTime( 0.2 );
	self.welcometext[3].alpha = 0;
	self.welcometext[3].fontScale = 4.5;
	wait 0.5;
	self.welcometext[4] ChangeFontScaleOverTime( 0.2 );
	self.welcometext[4] fadeOverTime( 0.2 );
	self.welcometext[4].alpha = 0;
	self.welcometext[4].fontScale = 4.5;
	wait 0.4;
	self.welcometext[0] destroy();
	self.welcometext[1] destroy();
	self.welcometext[2] destroy();
	self.welcometext[3] destroy();
	self.welcometext[4] destroy();
}

IntroAfghan()
{
	if(getdvar("mapname") == "mp_afghan")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Desert Wasteland", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroFavela()
{
	if(getdvar("mapname") == "mp_favela")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Rundown Town", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroEstate()
{
	if(getdvar("mapname") == "mp_estate")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Falls of Hell", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroSubBase()
{
	if(getdvar("mapname") == "mp_subbase")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Sub Pens of Hell", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroScrapyard()
{
	if(getdvar("mapname") == "mp_boneyard")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Deserted Entrance", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroSkidrow()
{
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: SunRise Apartments", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Rundown Apartments", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: River Canal", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroUnderpass()
{
	if(getdvar("mapname") == "mp_underpass")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Shipping Yard", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroTrailerpark()
{
	if(getdvar("mapname") == "mp_trailerpark")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Abandoned Gas Station", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroQuarry()
{
	if(getdvar("mapname") == "mp_quarry")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Construction Graveyard", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroRust()
{
	if(getdvar("mapname") == "mp_rust" && level.edit == 0)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Raging River", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
	if(getdvar("mapname") == "mp_rust" && level.edit == 1)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Raging River Storm", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroSalvage()
{
	if(getdvar("mapname") == "mp_compact")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Snowy Vacation", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroKarachi()
{
	if(getdvar("mapname") == "mp_checkpoint")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Shipping Dock", "Made By [115]Death", "Map Made By [115]Death and [115]xSilent", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroStrike()
{
	if(getdvar("mapname") == "mp_strike")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Back Ally", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroDerail()
{
	if(getdvar("mapname") == "mp_derail")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Frozen Warehouse", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroTerminal()
{
	if(getdvar("mapname") == "mp_terminal")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Airport Invasion", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroBailout()
{
	if(getdvar("mapname") == "mp_complex")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Apartment Invasion", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroWasteland()
{
	if(getdvar("mapname") == "mp_brecourt")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Apartment Rooftops", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}

IntroRundown()
{
	if(getdvar("mapname") == "mp_rundown")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Old Shack", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroInvasion()
{
	if(getdvar("mapname") == "mp_invasion")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Dam Sea", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroCarnival()
{
	if(getdvar("mapname") == "mp_abandon")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Carnival Parking Lot", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroVacant()
{
	if(getdvar("mapname") == "mp_vacant")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Chernoybl Disaster", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroStorm()
{
	if(getdvar("mapname") == "mp_storm")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Dryed Aqueduct", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroFuel()
{
	if(getdvar("mapname") == "mp_fuel2")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Nowhere Mountains", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroOvergrown()
{
	if(getdvar("mapname") == "mp_overgrown")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Overgrown Hell", "Made By [115]Death", "Map Made By [115]Death and [115]DontHate", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroCrash()
{
	if(getdvar("mapname") == "mp_crash")
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: Hell Tunnel", "Made By [115]Death", "Map Made By [115]Death and [115]DontHate", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
    }
}

IntroHighrise()
{
	if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: High Hilton", "Made By [115]Death", "Map Made By [115]Death", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
	else if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		self thread WelcomeText("Welcome " + self.name, "AI Zombies eXtreme", "Map: The Twin Buildings", "Made By [115]Death", "Map Made By [115]Death and [115]DontHate", 1, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.9,0.3,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
	}
}