==============================================================================
== OnPlayerTakeDamage
==============================================================================*/

hook OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if(IsPlayerConnected(playerid) && Logged[playerid] && issuerid != INVALID_PLAYER_ID)
	{
		new Float:geHealth;
		GetPlayerHealth(playerid, geHealth);
		if(geHealth <= 25.0 && !Dead[playerid])
		{
		    if(Downed[playerid])
		   	{
	   	 		SetPlayerHealth(playerid, 25.0);
			    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
			    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
		   	}
		    else if(GetPlayerWeapon(issuerid) == 5 || GetPlayerWeapon(issuerid) == 0)
		    {
			    CountDown[playerid] = 120;
			    GameTextForPlayer(playerid, "~r~You are knocked down", 1000, 4);
			    CountDownTimer[playerid] = SetTimerEx("CountdownDown", 1000, true, "i", playerid);
		        Downed[playerid] = true;
		        DownTimer[playerid] = SetTimerEx("DownEnd",120*1000, 0, "d", playerid);
		        SetPlayerDrunkLevel (playerid, 50000);
		        CPF(playerid, COLOR_RED, "You have been knocked down to the floor. You will remain on the ground until you start to feel better.");
			    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
			    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
				format(gString, sizeof(gString), "* %s is knocked down.", GetPlayerNameEx(playerid));
				SetPlayerChatBubble(playerid, gString, COLOR_PURPLE, 15.0, 1000);
		    }
		}
	}
    if(AdminDuty[playerid]) return SetPlayerHealth(playerid, 99.0), 0;
	if(Dead[playerid]) return SetPlayerHealth(playerid, 25.0), 0;
	if(issuerid != INVALID_PLAYER_ID)
	{
        new hpp = floatround(amount, floatround_round);
        format(gString, sizeof(gString), ""COL_RED"-%d HP", hpp);
        SetPlayerChatBubble(playerid, gString, -1, 10.0, 1000);
	    if(fInfo[cInfo[issuerid][cFaction]][Type] == 1)
	    {
	        if(GetPlayerWeapon(issuerid) == 23)
	        {
	            if(TazerHolster[issuerid] == 0)
				{
		            if(PlayerHasTazer[issuerid] == 1)
					{
			            if(pTazed[playerid] == 1) return 1;
			            TogglePlayerControllable(playerid, false);
						ApplyAnimation(playerid, "PARACHUTE", "FALL_skyDive_DIE", 4.1, 0,1,1,1,1,1);
						ApplyAnimation(playerid, "PARACHUTE", "FALL_skyDive_DIE", 4.1, 0,1,1,1,1,1);
			            pTazed[playerid] = 1;
			            SetTimerEx("Tazed", 10000, 0, "d", playerid);
			            SetPlayerChatBubble(playerid, "Tazed", COLOR_RED, 15.0, 10000);
			            CPF(playerid, COLOR_WHITE, "You have been tazed for 10 seconds by %s %s.", GetPlayerRank(issuerid), GetName(issuerid));
			            GameTextForPlayer(playerid, "~r~Tazed", 2000, 4);
			            CPF(issuerid, COLOR_WHITE, "You have tazed %s for 10 seconds.", GetName(playerid));
		        	}
	        	}
	        }
	    }
	    if(GetPlayerWeapon(issuerid) == 34)
			SetPlayerHealth(playerid, 0);
    }
    return 1;
}
