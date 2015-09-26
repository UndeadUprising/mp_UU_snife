#include maps\mp\_utility;

init()
{	
	game[ "KnifeSelection_Menu" ] = "KnifeSelection_Menu";
	precacheMenu( game[ "KnifeSelection_Menu" ] );
	
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	while(true)
	{
		level waittill("connected", player);
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	
	while( true )
	{
		self waittill( "spawned_player" );
		self thread onMenuResponse();
	}	
}

onMenuResponse()
{
	self endon( "death" );
	self endon( "disconnect" );

	while( true )
	{
		self waittill("menuresponse", menu, response);

		if(response == "knife_fsk")
		{
			self giveWeapon("five_seven_tactical_zam");
			self switchToWeapon("five_seven_tactical_zam");
			self SetWeaponAmmoClip("five_seven_tactical_zam", 0);
			self SetWeaponAmmoStock("five_seven_tactical_zam", 0);
			self.primary = "five_seven_tactical_zam";
		}
		else if(response == "knife_b23rk")
		{
			self giveWeapon("b23r_tactical_zam");
			self switchToWeapon("b23r_tactical_zam");
			self SetWeaponAmmoClip("b23r_tactical_zam", 0);
			self SetWeaponAmmoStock("b23r_tactical_zam", 0);
			self.primary = "b23r_tactical_zam";
		}
		else if(response == "knife_deaglek")
		{
			self giveWeapon("deagle_tactical");
			self switchToWeapon("deagle_tactical");
			self SetWeaponAmmoClip("deagle_tactical", 0);
			self SetWeaponAmmoStock("deagle_tactical", 0);
			self.primary = "deagle_tactical";
		}
	}
}