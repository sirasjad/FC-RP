==============================================================================
== OnPlayerText
==============================================================================*/

public OnPlayerText(playerid, text[])
{
    if(Logged[playerid] == false || cInfo[playerid][cFirstLogin] >= 1)
		return false;

	/*else if(Muted[playerid] == true)
	    return CPF(playerid, -1, "You are muted!"), 0;*/

	AFKCount[playerid] = 0;
	if(AdminSpectate[playerid])
	{
		SendClientMessage(playerid, -1, ""COL_RED"You shouldn't use chat while spectating as an admin!");
		return 0;
	}
	if(AdminDuty[playerid] && pInfo[playerid][AdminLevel] >= 2)
	{
		gUser = playerid;
		gType = 7;
		format(gString, sizeof(gString), "(( [%d] {33AA33}%s"COL_FADE": %s ))", playerid, cInfo[playerid][cCreator], text);
		ProxDetector(10.0, playerid, gString, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
	}
	else
	{
	    gUser = playerid;
	    gType = 1;
		if(InCall[playerid] >= 0 || CallOffer[playerid] >= 0)
		{
		    if(InCall[playerid] >= 0)
		    {
		        if(taxicall[playerid] > 0  && InCall[playerid] == 554)
		        {
					format(gString, sizeof(gString), "%s says (cellphone): %s", GetPlayerNameEx(playerid), text);
					ProxDetector(6.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
					format(TaxiString[playerid], 156, text);
					RequestedTaxi[playerid] = true;
					CPF(playerid, COLOR_GREEN, "Dispatcher says: A taxi driver will soon respond to your call.");
                    CPF(playerid, COLOR_GRAY, "The other line has hanged up.");
					CallOffer[playerid] = -1;
					InCall[playerid] = -1;
					Calling[playerid] = 0;
			        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
					format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
					RemovePlayerAttachedObject(playerid, 1);
					format(gString, sizeof(gString), ""COL_YELLOW"* %s requires your service. Type /taxi_calls to respond.", GetPlayerNameEx(playerid));
					SendTaxiMessage(-1, gString);
		        }
		        else if(callingEm[playerid] > 0 && InCall[playerid] == 911)
		        {
					format(gString, sizeof(gString), "%s says (cellphone): %s", GetPlayerNameEx(playerid), text);
					ProxDetector(6.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
		            switch(callingEm[playerid])
		            {
		                case 1:
		                {
		                    if(strcmp(text, "No", false) == 0 || strcmp(text, "Yes", false) == 0)
		                    {
		                        if(strcmp(text, "No", false) == 0)
		                        	emCall[playerid][Emergency] = false;

		                        else if(strcmp(text, "Yes", false) == 0)
									emCall[playerid][Emergency] = true;

								CPF(playerid, COLOR_POLICE, "Emergency Line: What service do you require (Police, Paramedic or Both)?");
								callingEm[playerid] = 2;
							}
							else
								CPF(playerid, COLOR_POLICE, "Emergency Line: Hello, is this an emergency call (Yes or No)?");
		                }
		                case 2:
		                {
		                    if(strcmp(text, "Paramedic", false) == 0 || strcmp(text, "Police", false) == 0 || strcmp(text, "Both", false) == 0)
		                    {
		                        if(strcmp(text, "Police", false) == 0)
		                        	emCall[playerid][CallingTo] = 1;

		                        else if(strcmp(text, "Paramedic", false) == 0)
		                        	emCall[playerid][CallingTo] = 2;

		                        else if(strcmp(text, "Both", false) == 0)
		                        	emCall[playerid][CallingTo] = 3;

		                        CPF(playerid, COLOR_POLICE, "Emergency Line: Please provide your current location.");
								callingEm[playerid] = 3;
		                    }
		                }
		                case 3:
		                {
		                    format(emCall[playerid][PreText], 156, text);
	                        CPF(playerid, COLOR_POLICE, "Emergency Line: Please give us a short description of the incident.");
							callingEm[playerid] = 4;
		                }
		                case 4:
		                {
		                    CPF(playerid, COLOR_POLICE, "Emergency Line: Thank you for reporting! Units are being dispatched.");
		                    CPF(playerid, COLOR_GRAY, "The other line has hanged up.");

							CallOffer[playerid] = -1;
							InCall[playerid] = -1;
							Calling[playerid] = 0;
					        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
							format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
							ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
							RemovePlayerAttachedObject(playerid, 1);

		                    GetPlayer2DZone(playerid, emCall[playerid][Location], 64);
		                    format(emCall[playerid][Text], 156, text);
		                    callingEm[playerid] = 0;

		                    if(emCall[playerid][CallingTo] == 1)
		                    {
		                        format(gString, sizeof(gString), "__________ %s Call __________", emCall[playerid][Emergency] ? ("Emergency") : ("Non-Emergency"));
								SendFactionMessage(1, COLOR_POLICE, gString);
								format(gString, sizeof(gString), "Caller: "COL_WHITE"%s (%d)", GetName(playerid), cInfo[playerid][cPhone]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								format(gString, sizeof(gString), "Location: "COL_WHITE"%s", emCall[playerid][PreText]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								format(gString, sizeof(gString), "Description: "COL_WHITE"%s", emCall[playerid][Text]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								format(gString, sizeof(gString), "Trace: "COL_WHITE"%s", emCall[playerid][Location]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(1, COLOR_POLICE, "___________________________________");
		                    }
		                    else if(emCall[playerid][CallingTo] == 2)
		                    {
		                        format(gString, sizeof(gString), "__________ %s Call __________", emCall[playerid][Emergency] ? ("Emergency") : ("Non-Emergency"));
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Caller: "COL_WHITE"%s (%d)", GetName(playerid), cInfo[playerid][cPhone]);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Location: "COL_WHITE"%s", emCall[playerid][PreText]);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Description: "COL_WHITE"%s", emCall[playerid][Text]);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Trace: "COL_WHITE"%s", emCall[playerid][Location]);
								SendFactionMessage(2, 0xFF8282AA, gString);
								SendFactionMessage(2, 0xFF8282AA, "___________________________________");
		                    }
		                    else if(emCall[playerid][CallingTo] == 3)
		                    {
		                        format(gString, sizeof(gString), "__________ %s Call __________", emCall[playerid][Emergency] ? ("Emergency") : ("Non-Emergency"));
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Caller: "COL_WHITE"%s (%d)", GetName(playerid), cInfo[playerid][cPhone]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Location: "COL_WHITE"%s", emCall[playerid][PreText]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Description: "COL_WHITE"%s", emCall[playerid][Text]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(2, 0xFF8282AA, gString);
								format(gString, sizeof(gString), "Trace: "COL_WHITE"%s", emCall[playerid][Location]);
								SendFactionMessage(1, COLOR_POLICE, gString);
								SendFactionMessage(2, 0xFF8282AA, gString);
								SendFactionMessage(1, COLOR_POLICE, "___________________________________");
								SendFactionMessage(2, 0xFF8282AA, "___________________________________");
		                    }
		                }
		            }
		        }
		        else
		        {
					format(gString, sizeof(gString), "%s says (cellphone): %s", GetPlayerNameEx(playerid), text);
					ProxDetector(6.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
			    	CPF(InCall[playerid], -1, ""COL_YELLOW"(Cellphone) %s: %s", GetPlayerNameEx(playerid), text);
			    }
		    }
		    else if(CallOffer[playerid] >= 0)
		    {

				format(gString, sizeof(gString), "%s says: %s", GetPlayerNameEx(playerid), text);
				ProxDetector(10.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
		    }
		}
		else
		{
		    if(Dead[playerid]) return CPF(playerid, COLOR_RED, "You are not able to speak when you are dead."), 0;
		    if(Downed[playerid]) return CPF(playerid, COLOR_RED, "You're knocked down, dizzy and unable to talk."), 0;
			if(MaskOn[playerid])
			{
				format(gString, sizeof(gString), "Mask_%d says: %s", cInfo[playerid][cMask], text);
				ProxDetector(10.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
				if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,1,1), ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,1,1);
				if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) SetTimerEx("StopTalk", strlen(text)*30, false, "i", playerid);
			}
			else
			{
				format(gString, sizeof(gString), "%s says: %s", GetPlayerNameEx(playerid), text);
				ProxDetector(10.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
				if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,1,1), ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,1,1);
				if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) SetTimerEx("StopTalk", strlen(text)*30, false, "i", playerid);
			}
		}
	}
	return 0;
}
