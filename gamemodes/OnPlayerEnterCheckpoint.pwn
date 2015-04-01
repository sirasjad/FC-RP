==============================================================================
== OnPlayerEnterCheckpoint
==============================================================================*/

public OnPlayerEnterCheckpoint(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 4.0, JobPos[playerid][0], JobPos[playerid][1], JobPos[playerid][2]))
	{
	    switch(cInfo[playerid][cJob])
	    {
			case GARBAGE_MAN_JOB:
			{
	            SetPlayerAttachedObject( playerid, 9, 1264, 1, 0.3, 0.520760, 0.0, 0.000000, 84.217391, 0.000000, 1.000000, 1.000000, 1.000000 );
	            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	            GameTextForPlayer(playerid, "~g~You picked up a trash bag!", 3000, 6);
	            new bagid = GetClosestBag(playerid);
	            DestroyDynamicObject(Bag_Objects[bagid]);
	            CarryingBag[playerid] = true;
	            BagCreated[bagid] = false;
	            SetTimerEx("BagRecreation", BAG_RECREATION, false, "ifff", bagid, Garbage_BAGS[bagid][0], Garbage_BAGS[bagid][1], Garbage_BAGS[bagid][2]);
			}
			case DELIVERY_MAN_JOB:
			{
	            new bizid = GetPVarInt(playerid, "MissionBizID");
	            if(!CarryingCrate[playerid])
	                    return SendClientMessage(playerid, 0x33AA33FF, "Please deliver the crate to the marked checkpoint on the map.");

				JobPos[playerid][0] = 0.0;
				JobPos[playerid][1] = 0.0;
				JobPos[playerid][2] = 0.0;
	            Mission[playerid] = false;
	            CarryingCrate[playerid] = false;
	            PlayerCrates[playerid]--;
	            Crates--;
	            DisablePlayerCheckpoint(playerid);
				new mon = RandomEx(MONEY_PER_CRATE, MONEY_PER_CRATE+20);
	            cInfo[playerid][cPaycheck] += mon;
	            bInfo[bizid][Products] += PRODUCTS_PER_CRATE;
	            RemovePlayerAttachedObject(playerid, 9);
	            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	            CPF(playerid, COLOR_GREEN, "You have delivered the crate to the designated location and an amount of $%d was added to your paycheck.", mon);
			}
	    }
	}
	if(PizzaMission[playerid][OnMission])
	{
	    OnPlayerEnterPizzaCheckpoint(playerid);
	}
	if(ShowCP[playerid] == true) DisablePlayerCheckpoint(playerid), ShowCP[playerid] = false;
	if(DLic[playerid][Step] == 2 && IsPlayerInAnyVehicle(playerid))
	{
	    new vid = GetPlayerVehicleID(playerid);
	    if(IsPlayerInRangeOfPoint(playerid, 5.0, DLic[playerid][licPos][0], DLic[playerid][licPos][1], DLic[playerid][licPos][2]))
	    {
	        if(DLic[playerid][Checkpoint] >= 24)
	        {
				DLic[playerid][Step] = 0;
				DLic[playerid][TookTest] = false;
				KillTimer(DLic[playerid][dTimer]);
				new Float:getPos[3];
				GetPlayerPos(playerid, getPos[0], getPos[1], getPos[2]);
				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, getPos[0], getPos[1], getPos[2]+2.0);
				SetVehicleToRespawn(vid);
				CPF(playerid, 0x33AA33FF, "You have passed your driving test successfully!");
				cInfo[playerid][cDrivingLicense] = 1;
				DisablePlayerCheckpoint(playerid);
	        }
	        else
	        {
				DLic[playerid][Checkpoint] = DLic[playerid][Checkpoint] + 1;
				DLic[playerid][licPos][0] = LicenseCheckpoint[DLic[playerid][Checkpoint]][0];
				DLic[playerid][licPos][1] = LicenseCheckpoint[DLic[playerid][Checkpoint]][1];
				DLic[playerid][licPos][2] = LicenseCheckpoint[DLic[playerid][Checkpoint]][2];
				SetPlayerCheckpoint(playerid, DLic[playerid][licPos][0], DLic[playerid][licPos][1], DLic[playerid][licPos][2], 5.0);
			}
	    }
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}
