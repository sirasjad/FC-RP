==============================================================================
== OnPlayerDisconnect
==============================================================================*/

public OnPlayerDisconnect(playerid, reason)
{
	DestroyDynamicObject(furnObject[playerid]);
	KillTimer(TutorialTimer[playerid]);
    FadePlayerDisconnect(playerid);
	if(TaxiTarget[playerid] > -1)
	{
	    if(IsPlayerInAnyVehicle(TaxiTarget[playerid]) && GetPlayerVehicleID(TaxiTarget[playerid]) == GetPlayerVehicleID(playerid))
	    {
	        KillTimer(TaxiTimer[playerid]);
			new player = TaxiTarget[playerid];
		    format(gString, sizeof(gString), "~g~$%d", TaxiCount[player]);
		    GameTextForPlayer(playerid, gString, 4500, 4);
		    GameTextForPlayer(player, gString, 4500, 4);
		    cInfo[playerid][cPaycheck] += TaxiCount[player];
		    cInfo[player][cMoney] -= TaxiCount[player];
		    CPF(playerid, COLOR_GRAY, "%s has disconnected, you were given the current fare.", GetPlayerNameEx(player));
		    CPF(playerid, COLOR_GREEN, "$%d were added to your paycheck.", TaxiCount[player]);
		    TaxiCount[player] = 0;
		    TaxiTarget[playerid] = -1;
	    }
	}
	if(TaxiDuty[playerid] && cInfo[playerid][cJob] == TAXI_DRIVER_JOB)
	{
	    TaxiDuty[playerid] = false;
    }
    RequestedTaxi[playerid] = false;
    if(Logged[playerid]) DestroyDynamic3DTextLabel(playerNametag[playerid]);
    NeedHelp[playerid] = 0;
    KillTimer(DLic[playerid][dTimer]);
	KillTimer(AFKTimer[playerid]);
	for(new i = 0; i < MAX_PLAYERS; i++)
 	{
        if(!IsPlayerConnected(i) || !Logged[i]) continue;
        if(Spec[i] != playerid) continue;
        TogglePlayerSpectating(i, 0);
		CPF(i, -1, ""COL_RED"Player %s(%d) has disconnected, spectate mode disabled.", GetName(playerid), playerid);
		AdminSpectate[i] = false;
		Spec[i] = -1;
 	}
    KillTimer(CountDownTimer[playerid]);
	KillTimer(FishTimer[playerid]);
	switch(reason)
	{
		case 0:
		{
			format(gString,sizeof gString,"%s left the server. (Timed out)", GetName(playerid));
		}
		case 1: format(gString,sizeof gString,"%s left the server. (Leaving)", GetName(playerid));
		case 2: format(gString,sizeof gString,"%s left the server. (Kicked/Banned)", GetName(playerid));
	}
	ProxDetector(10.0, playerid, gString, -1, -1, -1, -1, -1);
	if(Logged[playerid])
	{
	    if(reason == 0)
	    {
			cInfo[playerid][cCrashed] = 1;
			if(InHouse[playerid] > -1)
			{
				cInfo[playerid][cCrashPos][0] = hInfo[InHouse[playerid]][X_OUT];
				cInfo[playerid][cCrashPos][1] = hInfo[InHouse[playerid]][Y_OUT];
				cInfo[playerid][cCrashPos][2] = hInfo[InHouse[playerid]][Z_OUT];
				cInfo[playerid][cCrashINT] = 0;
				cInfo[playerid][cCrashVW] = 0;
			}
			else if(InInterior[playerid] > -1)
			{
				cInfo[playerid][cCrashPos][0] = iInfo[InInterior[playerid]][outX];
				cInfo[playerid][cCrashPos][1] = iInfo[InInterior[playerid]][outY];
				cInfo[playerid][cCrashPos][2] = iInfo[InInterior[playerid]][outZ];
				cInfo[playerid][cCrashINT] = 0;
				cInfo[playerid][cCrashVW] = 0;
			}
			else if(InBiz[playerid] > -1)
			{
				cInfo[playerid][cCrashPos][0] = bInfo[InBiz[playerid]][X_OUT];
				cInfo[playerid][cCrashPos][1] = bInfo[InBiz[playerid]][Y_OUT];
				cInfo[playerid][cCrashPos][2] = bInfo[InBiz[playerid]][Z_OUT];
				cInfo[playerid][cCrashINT] = 0;
				cInfo[playerid][cCrashVW] = 0;
			}
			else
			{
				new Float:avivPos[3];
				GetPlayerPos(playerid, avivPos[0], avivPos[1], avivPos[2]);
				cInfo[playerid][cCrashPos][0] = avivPos[0];
				cInfo[playerid][cCrashPos][1] = avivPos[1];
				cInfo[playerid][cCrashPos][2] = avivPos[2];
				cInfo[playerid][cCrashINT] = GetPlayerInterior(playerid);
				cInfo[playerid][cCrashVW] = GetPlayerVirtualWorld(playerid);
			}
	    }
	    else
		{
        	if(cInfo[playerid][cSpawnType] >= 4)
			{
				new Float:avivPos[3];
				GetPlayerPos(playerid, avivPos[0], avivPos[1], avivPos[2]);
				cInfo[playerid][cSpawn][0] = avivPos[0];
				cInfo[playerid][cSpawn][1] = avivPos[1];
				cInfo[playerid][cSpawn][2] = avivPos[2];
			}
		}
		SavePlayer(playerid, GetName(playerid));
		SaveCharacter(playerid, GetName(playerid));
		SavePlayer(playerid, cInfo[playerid][cCreator]);
	}
 	if(PizzaMission[playerid][OnMission])
    {
  		PizzaMission[playerid][PizzaSeconds] = 0;
  		PizzaMission[playerid][CarryingPizza] = false;
  		RemovePlayerAttachedObject(playerid, 9);
		PizzaMission[playerid][PizzaWarmth] = 100;
		PizzaMission[playerid][OnMission] = false;
		PizzaMission[playerid][TotalSeconds] = 0;
		SetVehicleToRespawn(PizzaMission[playerid][MissionBike]);
		PizzaMission[playerid][MissionBike] = -1;
		PizzaMission[playerid][SessionEarning] = 0;
    }
	Logged[playerid] = false;
	AnticheatSpam[playerid] = false;
	KillTimer(CallTimer[playerid]);
	KillTimer(ReduceCredits[playerid]);
	RemovePlayerAttachedObject(playerid, 1);
	if(InCall[playerid] >= 0)
	{
	    CPF(InCall[playerid], COLOR_GRAY, "The phone line has been disconnected.");
        SetPlayerSpecialAction(InCall[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
		format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(InCall[playerid]));
		ProxDetector(15.0, InCall[playerid], gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		RemovePlayerAttachedObject(InCall[playerid], 1);
	    InCall[InCall[playerid]] = -1;
	    CallOffer[InCall[playerid]] = -1;
		InCall[playerid] = -1;
		CallOffer[playerid] = -1;
	}
	else if(CallOffer[playerid] >= 0)
	{
	    InCall[CallOffer[playerid]] = -1;
	    CallOffer[CallOffer[playerid]] = -1;
	}
    if(cInfo[playerid][cJob] == DELIVERY_MAN_JOB)
    {
        if(CarryingCrate[playerid])
        {
            RemovePlayerAttachedObject(playerid, 9);
            Crates--;
            PlayerCrates[playerid]--;
        }
        Crates -= PlayerCrates[playerid];
        PlayerCrates[playerid] = 0;
        CarryingCrate[playerid] = false;
        if(Mission[playerid])
        {
            Mission[playerid] = false;
            DestroyDynamicCP(Mission_CP[playerid]);
            RemovePlayerMapIcon( playerid, 1 );
            PlayerTextDrawDestroy(playerid, PlayerText:TD_BIZ_NAME[playerid]);
            PlayerTextDrawDestroy(playerid, PlayerText:TD_BIZ_ADRESS[playerid]);
            PlayerTextDrawDestroy(playerid, PlayerText:TD_CRATES[playerid]);
        }
    }
    
    TextDrawDestroy(MoneyDraw[playerid]);
    for(new i = 0; i < 3; i++)
	{
 		if(i != 0) { TextDrawDestroy(PlayerHudS[i][playerid]); }
   	}
	return 1;
}
