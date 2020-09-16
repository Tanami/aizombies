#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

multikill()
{
	if(!isDefined(self.multi)) self.multi = 0;
	self.multi++;
	wait 1;
	if(self.multi == 2)
	{
		self thread AImod\_Mod::TextPopup( "Double Kill!" );
		self.bonus += 1;
		self notify("BONUS");
	}
	if(self.multi == 3)
	{
		self thread AImod\_Mod::TextPopup( "Triple Kill!" );
		self.bonus += 2;
		self notify("BONUS");
	}
	if(self.multi == 4)
	{
	    iPrintLn(self.name + " ^2has got a multikill with ^1" + self.multi + " ^2zombies!");
		self thread AImod\_Mod::TextPopup2( "Take that!!!" );
		self thread AImod\_Mod::TextPopup( "Multi Kill!" );
		self.bonus += 2;
		self notify("BONUS");
	}
	if(self.multi == 5)
	{
	    iPrintLn(self.name + " ^2is on a killing spree with ^1" + self.multi + " ^2zombies!");
		self thread AImod\_Mod::TextPopup2( "OMG!!!" );
		self thread AImod\_Mod::TextPopup( "Multi Kill!" );
		self.bonus += 2;
		self notify("BONUS");
	}
	if(self.multi == 6)
	{
	    iPrintLn(self.name + " ^2is on a killing spree with ^1" + self.multi + " ^2zombies!");
		self thread AImod\_Mod::TextPopup2( "Thats gotta hurt!!!" );
		self thread AImod\_Mod::TextPopup( "Multi Kill!" );
		self.bonus += 2;
		self notify("BONUS");
	}
	if(self.multi >= 7)
	{
		iPrintLn(self.name + " ^2is on a killing spree with ^1" + self.multi + " ^2zombies!");
		self thread AImod\_Mod::TextPopup2( "Killing Spree!!!" );
		self thread AImod\_Mod::TextPopup( "Multi Kill!" );
		self.bonus += 2;
		self notify("BONUS");
	}
	self.multi = 0;
}