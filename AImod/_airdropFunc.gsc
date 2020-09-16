#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

monitorOrigin( entity )
{
	self endon("crate_gone");
	for(;;)
	{
		entity.origin = self.origin;
		wait 0.05;
	}
}

monitorIconOrigin( entity )
{
	self endon("random_drop_destroy");
	for(;;)
	{
		entity.x = self.origin[0];
		entity.y = self.origin[1];
		entity.z = self.origin[2] + 50;
		wait 0.05;
	}
}

GetAirdropPoint( )
{
	sReturn = undefined;
	switch( getDvar("mapname") )
	{
		case "mp_afghan": sReturn = (-2125,-780,-1444);
		break;
		case "mp_terminal": sReturn = (1434,3336,1000);
		break;
		case "mp_quarry": sReturn = (-2877,2178,500);
		break;
		case "mp_rust":
		if(level.edit == 0)
			sReturn = (1825,-9861,300);
		if(level.edit == 1)
			sReturn = (1450,-4817,-134);
		break;
		case "mp_derail": sReturn = (2653,1573,500);
		break;
		case "mp_highrise": 
		if(level.edit == 0)
		{
			sReturn = (-857,10067,2184);
			break;
		}
		if(level.edit == 1)
		{
			sReturn = (4957,2702,2355);
			break;
		}
		break;
		case "mp_brecourt": sReturn = (9833,6781,700);
		break;
		case "mp_boneyard": sReturn = (36,-1581,329);
		break;
		case "mp_underpass": sReturn = (3855,2627,400);
		break;
		case "mp_nightshift": 
		if(level.edit == 0)
		{
			sReturn = (-1666,-644,1000);
			break;
		}
		if(level.edit == 1)
		{
			sReturn = (686,-1273,500);
			break;
		}
		if(level.edit == 2)
		{
			sReturn = (1779,-1129,500);
			break;
		}
		break;
		case "mp_estate": sReturn = (-2980,-1090,-517);
		break;
		case "mp_favela": sReturn = (2329,2859,800);
		break;
		case "mp_invasion": sReturn = (2423,10866,16);
		break;
		case "mp_checkpoint": sReturn = (2429,2274,11);
		break;
		case "mp_subbase": sReturn = (-337,-4557,600);
		break;
		case "mp_rundown": sReturn = (876, 2593, 80);
		break;
		case "mp_compact": sReturn = (2307,2801,600);
		break;
		case "mp_trailerpark": sReturn = (1569,-2053,600);
		break;
		case "mp_strike": sReturn = (-2593,1441,13);
		break;
		case "mp_complex": sReturn = (2884,-1426,1051);
		break;
		case "mp_vacant": sReturn = (-604,1111,-98);
		break;
		case "mp_abandon": sReturn = (-1338,3444,3);
		break;
		case "mp_storm": sReturn = (3611,-1172,-48);
		break;
		case "mp_fuel2": sReturn = (22767,21433,6805);
		break;
		case "mp_overgrown": sReturn = (-1600,-5951,-156);
		break;
		case "mp_crash": sReturn = (-1071,-2744,92);
		break;
	}
	return sReturn;
}

killCrate()
{
	level waittill("random_drop_destroy");
	self delete();
	self.trigger delete();
	self.headIcon destroy();
}