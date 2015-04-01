==============================================================================
== OnPlayerStateChange
==============================================================================*/

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_PASSENGER || oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
    {
        if(IsPlayerInAnyDynamicArea(playerid))
        {
            for(new i = 0; i < MAX_BOOMBOX; i++)
            {
                if(IsPlayerInDynamicArea(playerid, Boombox[i][Bareaid]))
                {
                    if(!isnull(Boombox[i][Bstationurl]))PlayAudioStreamForPlayer(playerid, Boombox[i][Bstationurl], Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2], Boombox[i][Bvolume] * 2.5 + 1, 1);
                            break;
                }
            }
        }
    }
    if(newstate == PLAYER_STATE_DRIVER && cInfo[playerid][cDrivingLicense] <= 0)
    {
        CPF(playerid, COLOR_GRAY, "Be aware of the law enforcers! You do not possess a driving license.");
    }
    if(newstate == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vInfo[vehicleid][Job] == GARBAGE_MAN_JOB)
        {
            if(cInfo[playerid][cJob] != GARBAGE_MAN_JOB)
        	{
                SendClientMessage(playerid, -1, "Only Garbage Man can drive this vehicle!");
                RemovePlayerFromVehicle(playerid);
            }
            else
            {
                if(!Mission[playerid] && vBags[vehicleid] != MAX_VEHICLE_BAGS)
                {
                    LoadGarbageMission(playerid);
                }
                PlayerTextDrawShow(playerid, PlayerText:TD_GARBAGE_BAGS[playerid]);
            }
        }
    }
	if(newstate == PLAYER_STATE_ONFOOT)
	{
 		for(new i = 0; i < MAX_PLAYERS; i++)
	    {
	        if(!IsPlayerConnected(i) || !Logged[i]) continue;
	        if(Spec[i] != playerid) continue;
	        PlayerSpectatePlayer(i, playerid);
	    }
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
	        if(!IsPlayerConnected(i) || !Logged[i]) continue;
	        if(Spec[i] != playerid) continue;
	        PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
	    }
		new model = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(model)
		{
			case 592,577,511,512,520,593,553,476,519,460,513,548,425,417,487,488,497,563,447,469: PlayerWeapons[playerid][46]=true;
			case 457: PlayerWeapons[playerid][2]=true;
			case 596,597,598,599: PlayerWeapons[playerid][25]=true;
		}
	}
	if(newstate == PLAYER_STATE_PASSENGER)
	{ // Disables Drive By with Walther PPK (Model ID 24)
	    if(GetPlayerWeapon(playerid) == 24) {
	        SetPlayerArmedWeapon(playerid, 0);
	    }
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
 		if(IsABike(GetPlayerVehicleID(playerid))) {
   			Engine[GetPlayerVehicleID(playerid)] = true;
      		SetVehicleParamsEx(GetPlayerVehicleID(playerid), true, true, vAlarm, vDoors, vBonnet, vBoot, vObjective);
        }
        if(cInfo[playerid][SQLID] == vInfo[GetPlayerVehicleID(playerid)][Owner] && AdminVehicle[GetPlayerVehicleID(playerid)] == false) {
            CPF(playerid, -1, "{33aa33}Info: "COL_WHITE"Welcome to your %s, %s.", VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400], GetPlayerNameEx(playerid));
        }
	}
    if(newstate == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vInfo[vehicleid][Job] == DELIVERY_MAN_JOB)
        {
            if(cInfo[playerid][cJob] != DELIVERY_MAN_JOB)
            {
                SendClientMessage(playerid, -1, "Only Delivery Man can drive this vehicle!");
                RemovePlayerFromVehicle(playerid);
            }
            else
            {
            	if(!Mission[playerid] && vCrates[vehicleid] >= 1)
                {
					LoadMission(playerid);
					PlayerTextDrawShow(playerid, TD_BIZ_NAME[playerid]);
					PlayerTextDrawShow(playerid, TD_BIZ_ADRESS[playerid]);
					PlayerTextDrawShow(playerid, TD_CRATES[playerid]);
                }
            }
        }
    }
    else
    {
        PlayerTextDrawHide(playerid, TD_BIZ_NAME[playerid]);
        PlayerTextDrawHide(playerid, TD_BIZ_ADRESS[playerid]);
        PlayerTextDrawHide(playerid, TD_CRATES[playerid]);
    }
    if(newstate == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
		if(vInfo[vehicleid][Faction] == 99)
		{
		    if(cInfo[playerid][cDrivingLicense] == 1)
		    {
		        RemovePlayerFromVehicle(playerid);
		        CPF(playerid, COLOR_GRAY, "You already possess a driving license.");
		    }
		    else
			{
		        if(DLic[playerid][TookTest] == false)
		        {
			        RemovePlayerFromVehicle(playerid);
			        SendWrappedMessageToPlayer(playerid, COLOR_GRAY, "Driving Instructor: It looks like you did not regulate payment methods and documents registration. Please head inside the headquarters and do so!");
		        }
		        else
		        {
		            TogglePlayerControllable(playerid, 0);
		            SendWrappedMessageToPlayer(playerid, COLOR_GRAY, "Driving Instructor: Hello sir, I will be your driving instructor for today. Let's make sure our seatbelts are tight and will soon begin with the test.");
		            SendWrappedMessageToPlayer(playerid, COLOR_GRAY, "Driving Instructor: Alright! Here are some instructions before going on the wild road of Los Santos:");
					CPF(playerid, COLOR_GRAY, "1) Always stick to the right lane of the road.");
					CPF(playerid, COLOR_GRAY, "2) Do not exceed the speed limit which is 90.");
					CPF(playerid, COLOR_GRAY, "3) Do not damage the vehicle, you will be charged the cost.");
					CPF(playerid, COLOR_YELLOW, "Please wait 6 seconds before the test begins.");
					DLic[playerid][Step] = 1;
					DLic[playerid][Checkpoint] = 0;
					DLic[playerid][licPos][0] = LicenseCheckpoint[DLic[playerid][Checkpoint]][0];
					DLic[playerid][licPos][1] = LicenseCheckpoint[DLic[playerid][Checkpoint]][1];
					DLic[playerid][licPos][2] = LicenseCheckpoint[DLic[playerid][Checkpoint]][2];
					DLic[playerid][dTimer] = SetTimerEx("DrivingTimer", 6000, false, "i", playerid);
		        }
		    }
		}
    }
	return 1;
}
