init()
{	
	game[ "SnifeSelection_Menu" ] = "SnifeSelection_Menu";
	precacheMenu( game[ "SnifeSelection_Menu" ] );
	
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

		if(response == "snife_m40a3")
		{
			self giveWeapon("m40a3_mp");
			self giveMaxAmmo("m40a3_mp");
			self switchToWeapon("m40a3_mp");
			self.primary = "m40a3_mp";
			self OpenMenu(game["SnifeSelection2_Menu"]);
		}
		else if(response == "snife_barrett")
		{
			self giveWeapon("barrett_mp");
			self giveMaxAmmo("barrett_mp");
			self switchToWeapon("barrett_mp");
			self.primary = "barrett_mp";
			self OpenMenu(game["SnifeSelection2_Menu"]);
		}
		else if(response == "snife_l118a")
		{
			self giveWeapon("l118a_mp");
			self giveMaxAmmo("l118a_mp");
			self switchToWeapon("l118a_mp");
			self.primary = "l118a_mp";
			self OpenMenu(game["SnifeSelection2_Menu"]);
		}
		else if(response == "snife_msr")
		{
			self giveWeapon("msr_mp");
			self giveMaxAmmo("msr_mp");
			self switchToWeapon("msr_mp");
			self.primary = "msr_mp";
			self OpenMenu(game["SnifeSelection2_Menu"]);
		}
		else if(response == "snife_awp")
		{
			self giveWeapon("awp_mp");
			self giveMaxAmmo("awp_mp");
			self switchToWeapon("awp_mp");
			self.primary = "awp_mp";
			self OpenMenu(game["SnifeSelection2_Menu"]);
		}
		else if(response == "snife_cheytac")
		{
			if(self.vip == 1)
			{
				self giveWeapon("intervention_3k_zam");
				self giveMaxAmmo("intervention_3k_zam");
				self switchToWeapon("intervention_3k_zam");
				self.primary = "intervention_3k_zam";
				self OpenMenu(game["SnifeSelection2_Menu"]);
			}
			else
				self openMenu(game[ "SnifeSelection_Menu" ]);
		}
	}
}