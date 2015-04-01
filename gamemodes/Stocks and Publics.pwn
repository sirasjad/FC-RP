==============================================================================
== Stocks and Publics
==============================================================================*/

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == PDPickup[0])
	{
	    GameTextForPlayer(playerid, "~w~/pdup to the headquarters", 2250, 4);
	}
	else if(pickupid == PDPickup[1])
	{
	    GameTextForPlayer(playerid, "~w~/pdup to the roof~n~/pddown to the garage", 2250, 4);
	}
	else if(pickupid == PDPickup[2])
	{
	    GameTextForPlayer(playerid, "~w~/pddown to the headquarters", 2250, 4);
	}
	else if(pickupid == ArmouryPickup)
	{
	    GameTextForPlayer(playerid, "~w~/armoury", 2250, 4);
	}
	else if(pickupid == emsPickup[0])
	{
	    GameTextForPlayer(playerid, "~w~/enter - headquarters~n~/up - roof", 2250, 4);
	}
	else if(pickupid == emsPickup[1])
	{
        GameTextForPlayer(playerid, "~w~/exit", 2250, 4);
	}
	else if(pickupid == emsPickup[2])
	{
        GameTextForPlayer(playerid, "~w~/down - headquarters", 2250, 4);
	}
    return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	for(new i = 1;i < MAX_INTERIORS;i++)
 	{
		if(pickupid == iInfo[i][Pickup])
		{
			GameTextForPlayer(playerid, "~w~Type ~y~/enter~w~ to get in!", 2250, 4);
		    return true;
		}
	}
    if(cInfo[playerid][cJob] == DELIVERY_MAN_JOB && pickupid == Storage_PU)
    {
        if(CarryingCrate[playerid] == true)
                return 1;

        if(PlayerCrates[playerid] == MAX_CRATES_PER_PLAYER)
                return SendClientMessage(playerid, COLOR_GRAY, "You reached the maximum amount of crates per player, please complete few deliveries before you use this again.");

        ApplyAnimation(playerid, "carry", "liftup", 1, 0, 1, 1, 0, 1000);
        ApplyAnimation(playerid, "carry", "liftup", 1, 0, 1, 1, 0, 1000);
        ClearAnimations(playerid);
        SetPlayerAttachedObject( playerid, 9, 1271, 1, 0.3, 0.520760, 0.0, 0.000000, 84.217391, 0.000000, 1.000000, 1.000000, 1.000000 );
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
        CarryingCrate[playerid] = true;
        PlayerCrates[playerid]++;
        Crates++;
    }
	else if(pickupid == FishPickup)
	{
	    GameTextForPlayer(playerid, "~w~/sellfish", 2250, 4);
	}
	else if(pickupid == DealershipPickup)
	{
	    GameTextForPlayer(playerid, "~w~/v buy", 2250, 4);
	}
	else if(pickupid == DrivingPickup)
	{
	    GameTextForPlayer(playerid, "~w~/licenseexam", 2250, 4);
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    StopAudioStreamForPlayer(playerid);
	if(AdminVehicle[vehicleid] == true && pInfo[playerid][AdminLevel] <= 1)
	{
	    GetPlayerPos(playerid, xa, ya, za);
	    SetPlayerPos(playerid, xa, ya, za);
		GameTextForPlayer(playerid, "~r~You are not an admin!", 2500, 4);
	}
	else if(vInfo[vehicleid][Faction] > 0 && !ispassenger && pInfo[playerid][AdminLevel] <= 1)
	{
	    switch(vInfo[vehicleid][Faction])
	    {
	        case 99:
	        {
				if(!DLic[playerid][TookTest])
				{
				    GetPlayerPos(playerid, xa, ya, za);
				    SetPlayerPos(playerid, xa, ya, za);
					GameTextForPlayer(playerid, "~r~No permissions!", 2500, 4);
				}
	        }
	        default:
	        {
				if(vInfo[vehicleid][Faction] != cInfo[playerid][cFaction])
				{
				    GetPlayerPos(playerid, xa, ya, za);
				    SetPlayerPos(playerid, xa, ya, za);
					GameTextForPlayer(playerid, "~r~No permissions!", 2500, 4);
				}
	        }
	    }
	}
	else if(vInfo[vehicleid][Job] != 0 && cInfo[playerid][cJob] != vInfo[vehicleid][Job] && !ispassenger  && pInfo[playerid][AdminLevel] <= 1) {
	    GetPlayerPos(playerid, xa, ya, za);
	    SetPlayerPos(playerid, xa, ya, za);
		GameTextForPlayer(playerid, "~r~No permissions!", 2500, 4);
	}
	else if(vInfo[vehicleid][Locked] == 1)
	{
	    GetPlayerPos(playerid, xa, ya, za);
	    SetPlayerPos(playerid, xa, ya, za);
     	if(VehicleSpam[playerid] == false) SendClientMessage(playerid, COLOR_RED, "Vehicle is locked!");
     	VehicleSpam[playerid] = true;
      	SetTimerEx("PreventVSpam", 3500, false, "i", playerid);
	}
	return 1;
}

forward KickAllPlayers();
public KickAllPlayers()
{
	for(new i; i < MAX_PLAYERS; i++)
	{
		Kick(i);
	}
	SetTimer("RestartServer", 3000, true);
	return 1;
}

forward RestartServer();
public RestartServer()
{
	GameModeExit();
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	#if RconSecurity == 1
	new str[22];
    for(new i = 0,j = MAX_BOOTS; i < j; i ++)
	{
		if(rcon[i][ID] != 0) continue;
		rcon[i][ID] = i;
		format(rcon[i][rIP], 22, ip);
		break;
	}
	if(!success)
	{
	    for(new i = 0,j = MAX_BOOTS; i < j; i ++)
		{
	        if(rcon[i][ID] != 0) continue;
	        if(IsPlayerConnected(i))
	        {
	            rcon[i][InGame] = true;
	            GetPlayerIp(i, str, sizeof(str));
	            if(strcmp(str, rcon[i][rIP], false) == 0)
	            {
	                if(rcon[i][Tries] <= 3)
					{
	                    rcon[i][Tries] += 1;
						break;
	                }
	                else
	                {
	                    rcon[i][Tries] = 0;
	                    rcon[i][ID] = 0;
						format(gString, sizeof(gString), "ban %d", i);
						SendRconCommand(gString);
						format(gString, sizeof(gString), "banip %s", ip);
						SendRconCommand(gString);
						printf("< Banned an %s rcon access point from Player : %d [ %s ] >", rcon[i][InGame] ? ("internal") : ("external"), i, ip);
						break;
	                }
	            }
	            else
	                continue;
	        }
	        else
	        {
				if(strcmp(rcon[i][rIP], ip, false) == 0)
				{
				    rcon[i][InGame] = false;
	                if(rcon[i][Tries] <= 3)
					{
	                    rcon[i][Tries] += 1;
						break;
	                }
	                else
	                {
	                    rcon[i][Tries] = 0;
	                    rcon[i][ID] = 0;
						format(gString, sizeof(gString), "banip %s", ip);
						SendRconCommand(gString);
						printf("< Banned an %s rcon access point from IP : %s >", rcon[i][InGame] ? ("internal") : ("external"), ip);
						break;
	                }
				}
				else
				    continue;
	        }
	    }
	}
	else
	{
	    for(new i = 0,j = MAX_BOOTS; i < j; i ++)
		{
	        if(rcon[i][ID] != 0) continue;
	        if(strcmp(rcon[i][rIP], ip, false) == 0)
	        {
	            rcon[i][ID] = 0;
	            rcon[i][Tries] = 0;
	            rcon[i][Granted] = true;
				printf("< Granted rcon access point from IP : %s >", ip);
				break;
	        }
	        else
	            continue;
		}
	}

	#endif
	return 1;
}

forward AFKCheck();
public AFKCheck()
{
    foreach(new i : Player)
    {
		if(!IsPlayerConnected(i) || !Logged[i]) continue;
        if(!IsPlayerInRangeOfPoint(i, 1.0, LastPos[i][0], LastPos[i][1],LastPos[i][2]))
            AFKCount[i] = 0;

        AFKCount[i]++;
        if(AFKCount[i] >= MAX_AFK_TIME && pInfo[i][AdminLevel] < 5)
        {
            AFKCount[i] = 0;
            SendClientMessage(i, COLOR_RED, "Kicked: AFK for too long.");
            TogglePlayerControllable(i, 0);
            KickEx(i);
        }
    }
    return 1;
}

forward IsPayday();
public IsPayday()
{
	new hour,mxn,sec;
	gettime(hour, mxn, sec);
	if(sec == 00 && mxn == 00)
	{
		print("Payday");
	    foreach(new i : Player)
	    {
	        if(Logged[i] && cInfo[i][cFirstLogin] <= 0 && Tutorial[i] <= 0) Call_Payday(i);
	    }
	}
	return 1;
}

forward SaveLastPos();
public SaveLastPos()
{
    foreach(new i : Player)
    {
    	GetPlayerPos(i, LastPos[i][0], LastPos[i][1],LastPos[i][2]);
    }
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(TaxiDuty[playerid] && cInfo[playerid][cJob] == TAXI_DRIVER_JOB)
	{
	    TaxiDuty[playerid] = false;
	    format(gString, sizeof(gString), ""COL_YELLOW"* Taxi Driver %s is now off duty.", GetPlayerNameEx(playerid));
	    SendTaxiMessage(-1, gString);
	    if(TaxiTarget[playerid] > -1)
	    {
			KillTimer(TaxiTimer[playerid]);
			new player = TaxiTarget[playerid];
			if(TaxiCount[player] > 0)
			{
			    format(gString, sizeof(gString), "~g~$%d", TaxiCount[player]);
			    GameTextForPlayer(playerid, gString, 4500, 4);
			    GameTextForPlayer(player, gString, 4500, 4);
			    cInfo[playerid][cPaycheck] += TaxiCount[player];
			    CPF(playerid, COLOR_GREEN, "$%d were added to your paycheck.", TaxiCount[player]);
			    cInfo[player][cMoney] -= TaxiCount[player];
			    TaxiCount[player] = 0;
			}
			TaxiTarget[playerid] = -1;
	    }
	}
    if(vInfo[vehicleid][Job] == cInfo[playerid][cJob] && Mission[playerid])
    {
        PlayerTextDrawHide(playerid, TD_BIZ_NAME[playerid]);
        PlayerTextDrawHide(playerid, TD_BIZ_ADRESS[playerid]);
        PlayerTextDrawHide(playerid, TD_CRATES[playerid]);
    }
    if(vInfo[vehicleid][Job] == cInfo[playerid][cJob] && Mission[playerid])
            PlayerTextDrawHide(playerid, TD_GARBAGE_BAGS[playerid]);
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerLeaveDynamicCP(playerid,checkpointid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerAirbreak(playerid)
{
	if(!AdminDuty[playerid] && pInfo[playerid][AdminLevel] <= 0)
	{
		format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] travels in an impossible speed (Airbreak) (%02d ms)", GetName(playerid), playerid, GetPlayerSpeed(playerid));
	    if(AnticheatSpam[playerid] == false) SendAdminMessage(-1, gString);
	    AnticheatSpam[playerid] = true;
	    SetTimerEx("PreventACSpam", 5000, false, "i", playerid);
    }
    return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(GetPlayerWeapon(playerid) != 0 && AttachingWeapon[playerid] > -1)
    {
        new id = AttachingWeapon[playerid];
        if(Bag[playerid][bagItemLoadAmount][id] <= 1)
        {
            ResetPlayerWeapons(playerid);
			SetPlayerAttachedObject(playerid, 2, GetItemObject(Bag[playerid][bagItem][id]), 6);
			GameTextForPlayer(playerid, "~r~Out of ammo!~n~~w~Press ~y~~k~~CONVERSATION_YES~~w~ to reload", 3500, 4);
			Bag[playerid][bagItemLoaded][id] = 0;
        }
        Bag[playerid][bagItemLoadAmount][id] -= 1;
    }
    return 1;
}

forward KilometerUpdate();
public KilometerUpdate()
{
    new address[MAX_ZONE_NAME], avivi[64], count;
 	foreach(Player,i)
 	{
 	    if(Logged[i] && IsPlayerConnected(i))
  		{
			for(new x = 0; x < MAX_ITEMS; x++)
			{
				if(Bag[i][bagItem][x] <= 0) continue;
				if(Bag[i][bagItem][x] == 104 && Bag[i][bagItemAttached][x])
				    count++;

				else
					continue;
			}
			if(count >= 1) SetPlayerArmour(i, 99.0);
			else SetPlayerArmour(i, 0.0);
			GetPlayer2DZone(i, address, MAX_ZONE_NAME);
			format(avivi, 64, address);
  		    PlayerTextDrawSetString(i, LocationName[i], avivi);
  		    PlayerTextDrawShow(i, LocationName[i]);
		    if(AttachingWeapon[i] > -1)
		    {
		        new id = AttachingWeapon[i];
		        if(Bag[i][bagItemLoadAmount][id] > 0)
		        {
			        if(GetPlayerWeapon(i) != Bag[i][bagItem][id])
			        {
			            ResetPlayerWeapons(i);
			            GivePlayerWeaponEx(i, Bag[i][bagItem][id], Bag[i][bagItemLoadAmount][id]);
			            SetPlayerArmedWeapon(i, Bag[i][bagItem][id]);
			        }
		        }
		        else
		        {
		            ResetPlayerWeapons(i);
		            SetPlayerArmedWeapon(i, 0);
		        }
		    }
		    else
		    {
		        ResetPlayerWeapons(i);
		    }
			if(InHouse[i] > 0)
			{
			    if(HouseLights[InHouse[i]] == false)
			    {
			        TextDrawShowForPlayer(i, LightTD);
			    }
			    else TextDrawHideForPlayer(i, LightTD);
		    }
 	    	//UpdateNamelabel(i);
			if(Spawned[i] && pInfo[i][AdminLevel] <= 0)
			{
				if(GetHealth(i) >= 100.0)
				{
					format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] is using health hacks.", GetName(i), i);
				    if(AnticheatSpam[i] == false) SendAdminMessage(-1, gString);
				    AnticheatSpam[i] = true;
				    SetTimerEx("PreventACSpam", 10000, false, "i", i);
				    SetPlayerHealth(i, 99.0);
				}
				else if(GetArmour(i) >= 100.0)
				{
					format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] is using armour hacks.", GetName(i), i);
				    if(AnticheatSpam[i] == false) SendAdminMessage(-1, gString);
				    AnticheatSpam[i] = true;
				    SetTimerEx("PreventACSpam", 10000, false, "i", i);
				}
			}
	 	    new tdstring[256], rslot[32];
	 	    if(SeeHUD[i])
	 	    {
		 	    if(cInfo[i][cRadio][ cInfo[i][cRSlot] ] > 0 || GetPlayerState(i) == PLAYER_STATE_DRIVER)
		 	    {
			 	    if(cInfo[i][cRSlot] > 0)
			 	    {
			 	    	format(rslot, 32, "~y~Radio Channel: ~r~%d (%d)~n~",cInfo[i][cRadio][ cInfo[i][cRSlot] ], cInfo[i][cRSlot]);
			 	    	strcat(tdstring, rslot);
			 	    }

				  	if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
					{
					    new vehicleid = GetPlayerVehicleID(i);
						format(rslot, 64, "~y~Model: ~r~%s~n~", VehicleNames[GetVehicleModel(GetPlayerVehicleID(i))-400]);
						strcat(tdstring, rslot);
						  format(rslot, 32, "~y~KM/H: ~r~%d", GetVehicleSpeed(vehicleid));
						strcat(tdstring, rslot);
						if(!AdminVehicle[vehicleid] == true && !IsABike(vehicleid))
					 	{
							format(rslot, 32, "~n~~y~Fuel: ~r~%d", vInfo[vehicleid][Fuel]);
							strcat(tdstring, rslot);
						}
					}
					PlayerTextDrawSetString(i, Textdraw2[i], tdstring);
					PlayerTextDrawShow(i, Textdraw2[i]);
			 	}
				else
				{
				    PlayerTextDrawHide(i, Textdraw2[i]);
				}
			}
		}
 	}
}

public OnPlayerUpdate(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
    if(IsPlayerNPC(playerid)) return true;
    new Float:health, Float:armour;
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1470.2048,-1807.2263,5476.7861))
	{
	    if(cInfo[playerid][cJob] != 0)
	        GameTextForPlayer(playerid, "~r~You already have a job! Leave your current one.", 2250, 4);

		else
		    GameTextForPlayer(playerid, "~w~/jobs", 2250, 4);
	}
	SetPlayerScore(playerid, cInfo[playerid][cLevel]);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerSpeed(playerid) > 250)
	{
		format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] travels in an impossible speed (Vehicle Speedhack) (%02d ms)", GetName(playerid), playerid, GetPlayerSpeed(playerid));
	    if(AnticheatSpam[playerid] == false) SendAdminMessage(-1, gString);
	    AnticheatSpam[playerid] = true;
	    SetTimerEx("PreventACSpam", 5000, false, "i", playerid);
	}
	GetPlayerHealth(playerid, health), GetPlayerArmour(playerid, armour);
	if(GetPVarFloat(playerid, "PlayerHealth") != health)
	{
	    SetPVarFloat(playerid, "PlayerHealth", health), CallRemoteFunction("PrintHud","i",playerid);
	}
	if(GetPVarFloat(playerid, "PlayerArmour") != armour)
	{
	    SetPVarFloat(playerid, "PlayerArmour", armour), CallRemoteFunction("PrintHud","i",playerid);
	}
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(vInfo[vehicleid][Server] > 0)
	    LoadVehicle(vehicleid);

    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
    {
        if(!IsPlayerConnected(i)) continue;
        if(!Logged[i]) continue;
        if(cInfo[i][SQLID] == vInfo[vehicleid][Owner])
		{
			if(vInfo[vehicleid][Insurances] >= 1)
			{
				CPF(i, COLOR_RED, "Your %s was destroyed and you lost one insurance point.", VehicleNames[GetVehicleModel(vehicleid)-400]);
				CPF(i, COLOR_RED, "Insurance points left on your vehicle: %d.", vInfo[vehicleid][Insurances]-1);
				vInfo[vehicleid][Insurances] -= 1;
				SaveVehicle(vehicleid);
				ClearVehStats(vehicleid);
				DestroyVehicle(vehicleid);
				return 1;
			}
			else if(vInfo[vehicleid][Insurances] <= 0)
			{
				CPF(i, COLOR_RED, "Your vehicle has no insurance points left, thus it will be permanently removed.");
				format(_query, sizeof(_query), "DELETE FROM `vehicles` WHERE `ID` = '%d'", vInfo[vehicleid][ID]);
				mysql_query(_query);
				if(vInfo[vehicleid][ID] == cInfo[i][cVehicle1]) cInfo[i][cVehicle1] = 0;
				else if(vInfo[vehicleid][ID] == cInfo[i][cVehicle2]) cInfo[i][cVehicle2] = 0;
				else if(vInfo[vehicleid][ID] == cInfo[i][cVehicle3]) cInfo[i][cVehicle3] = 0;
				ClearVehStats(vehicleid);
				DestroyVehicle(vehicleid);
				return 1;
			}
		}
	}
    if(vInfo[vehicleid][Job] == DELIVERY_MAN_JOB)
    {
        if(cInfo[killerid][cJob] == DELIVERY_MAN_JOB)
        {
            if(Mission[killerid])
            {
                DestroyDynamicCP(Mission_CP[killerid]);
                RemovePlayerMapIcon( killerid, 1 );
                PlayerTextDrawHide(killerid, TD_BIZ_NAME[killerid]);
                PlayerTextDrawHide(killerid, TD_BIZ_ADRESS[killerid]);
                PlayerTextDrawHide(killerid, TD_CRATES[killerid]);
                Mission[killerid] = false;
            }
            if(PlayerCrates[killerid])
                PlayerCrates[killerid] -= vCrates[vehicleid];
            if(vCrates[vehicleid])
            {
                Crates -= vCrates[vehicleid];
                vCrates[vehicleid] = 0;
            }
        }
    }
	KillTimer(EngineTimer[vehicleid]);
	Engine[vehicleid] = false;
	VehicleSpawned[vehicleid] = false;
    if(vInfo[vehicleid][Job] == GARBAGE_MAN_JOB)
    {
        if(cInfo[killerid][cJob] == GARBAGE_MAN_JOB && Mission[killerid])
        {
            DestroyDynamicCP(Mission_CP[killerid]);
            RemovePlayerMapIcon(killerid, Mission_Map[killerid]);
            PlayerTextDrawHide(killerid, TD_GARBAGE_BAGS[killerid]);
            Mission[killerid] = false;
        }
        vBags[vehicleid] = 0;
    }
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    KillTimer(CountDownTimer[playerid]);
    Downed[playerid] = false;
//    if(IsValidDynamic3DTextLabel(playerNametag[playerid])) DestroyDynamic3DTextLabel(playerNametag[playerid]);
	Dead[playerid] = true;
	GetPlayerPos(playerid, DeathPos[playerid][0], DeathPos[playerid][1], DeathPos[playerid][2]);
	deathInt[playerid] = GetPlayerInterior(playerid);
	deathVW[playerid] = GetPlayerVirtualWorld(playerid);
    ResetPlayerWeapons(playerid);
	for(new i=0;i<47;i++) PlayerWeapons[playerid][i]=false;
    if(cInfo[playerid][cJob] == DELIVERY_MAN_JOB)
    {
        if(CarryingCrate[playerid])
        {
            RemovePlayerAttachedObject(playerid, 9);
            CarryingCrate[playerid] = false;
            PlayerCrates[playerid]--;
            Crates--;
        }
        Crates += PlayerCrates[playerid];
        Mission[playerid] = false;
        PlayerCrates[playerid] = 0;
        if(Mission[playerid])
        {
            DestroyDynamicCP(Mission_CP[playerid]);
            RemovePlayerMapIcon( playerid, 1 );
            PlayerTextDrawHide(playerid, TD_BIZ_NAME[playerid]);
            PlayerTextDrawHide(playerid, TD_BIZ_ADRESS[playerid]);
            PlayerTextDrawHide(playerid, TD_CRATES[playerid]);
        }
    }
    if(cInfo[playerid][cJob] == GARBAGE_MAN_JOB)
    {
        if(CarryingBag[playerid])
        {
            RemovePlayerAttachedObject(playerid, 9);
            CarryingBag[playerid] = false;
        }
        if(Mission[playerid])
        {
            DestroyDynamicCP(Mission_CP[playerid]);
            RemovePlayerMapIcon(playerid, Mission_Map[playerid]);
            Mission[playerid] = false;
            PlayerTextDrawHide(playerid, TD_GARBAGE_BAGS[playerid]);
        }
    }
	SpawnPlayer(playerid);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(BuyingFurn[playerid])
	{
		if(response == 1)
		{
			new list = BuyingObject[playerid];
			cInfo[playerid][cMoney] -= Furnitures[list][Price];
			DestroyDynamicObject(furnObject[playerid]);
			if(Furnitures[list][Authority] == 2)
			{
			    format(_query, sizeof(_query), "INSERT INTO `safes`(`HouseID`) VALUES (%d)", InHouse[playerid]);
		 		mysql_query(_query);
		 		Safe[InHouse[playerid]][ID] = mysql_insert_id();
		 		Safe[InHouse[playerid]][sMoney] = 0;
		 		Safe[InHouse[playerid]][Code] = 0;
		 		Safe[InHouse[playerid]][sLocked] = true;
		 		Safe[InHouse[playerid]][HouseID] = InHouse[playerid];
			}
		 	for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
		 	{
				if(Furn[i][ID] <= 0)
				{
					format(_query, sizeof(_query), "INSERT INTO `furnitures`(`ObjectID`, `ObjectName`, `HouseID`, `Authority`, `VirtualWorld`, `fX`, `fY`, `fZ`, `fRotX`, `fRotY`, `fRotZ`, `Interior`) VALUES (%d, '%s', %d, %d, %d, %f, %f, %f, %f, %f, %f, %d)",
					Furnitures[list][Object], Furnitures[list][Name], InHouse[playerid], Furnitures[list][Authority], hInfo[InHouse[playerid]][VirtualWorld], x, y, z, rx, ry, rz, hInfo[InHouse[playerid]][INT]);
                	mysql_query(_query);
					Furn[i][ID] = mysql_insert_id();
					printf("ID: %d", Furn[i][ID]);
					Furn[i][ObjectID] = Furnitures[list][Object];
					format(Furn[i][ObjectName], 128, Furnitures[list][Name]);
					Furn[i][Opened] = 0;
					Furn[i][Locked] = 0;
					Furn[i][HouseID] = InHouse[playerid];
					printf("House ID: %d", Furn[i][HouseID]);
					Furn[i][Authority] = Furnitures[list][Authority];
					Furn[i][VirtualWorld] = hInfo[InHouse[playerid]][VirtualWorld];
					Furn[i][fINT] = hInfo[InHouse[playerid]][INT];
					Furn[i][pos][0] = x;
					Furn[i][pos][1] = y;
					Furn[i][pos][2] = z;
					Furn[i][rot][0] = rx;
					Furn[i][rot][1] = ry;
					Furn[i][rot][2] = rz;
					if(Furn[i][Authority] == 2)
					{
						new saf = GetSafeID(Furn[i][HouseID]);
						DestroyDynamic3DTextLabel(Safe[Furn[i][HouseID]][sLabel]);
					    format(gString, sizeof(gString), "{ffffff}Safe {b5c8b6}%d\n%s", Safe[saf][ID], Safe[saf][sLocked] ? ("{c62222}Locked") : ("{39c622}Unlocked"));
					    Safe[Furn[i][HouseID]][sLabel] = CreateDynamic3DTextLabel(gString, 0x008080FF, Furn[i][pos][0], Furn[i][pos][1], Furn[i][pos][2]+0.8, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Furn[i][VirtualWorld], -1, -1, 100.0);
					}
					Furn[i][Object] = CreateDynamicObject(Furn[i][ObjectID], Furn[i][pos][0], Furn[i][pos][1], Furn[i][pos][2], Furn[i][rot][0], Furn[i][rot][1], Furn[i][rot][2], Furn[i][VirtualWorld], Furn[i][fINT], -1);
	                CPF(playerid, COLOR_GREEN, "You have bought %s for $%d!", Furnitures[list][Name], Furnitures[list][Price]);
				    EditingFurn[playerid] = false;
				    BuyingFurn[playerid] = false;
					break;
				}
				else continue;
			}
		}
		else if(response == 0)
		{
		    DestroyDynamicObject(furnObject[playerid]);
		    CPF(playerid, COLOR_RED, "You have canceled the purchase.");
		}
	}
	else if(EditingFurn[playerid])
	{
	    new param = SelectFurn[playerid];
		if(response == 1)
		{
			Furn[param][pos][0] = x;
			Furn[param][pos][1] = y;
			Furn[param][pos][2] = z;
			Furn[param][rot][0] = rx;
			Furn[param][rot][1] = ry;
			Furn[param][rot][2] = rz;
			CPF(playerid, COLOR_GREEN, "%s has been successfully moved to this position.", Furn[param][ObjectName]);
			if(Furn[param][Authority] == 2)
			{
				new saf = GetSafeID(Furn[param][HouseID]);
				DestroyDynamic3DTextLabel(Safe[Furn[param][HouseID]][sLabel]);
			    format(gString, sizeof(gString), "{ffffff}Safe {b5c8b6}%d\n%s", Safe[saf][ID], Safe[saf][sLocked] ? ("{c62222}Locked") : ("{39c622}Unlocked"));
			    Safe[Furn[param][HouseID]][sLabel] = CreateDynamic3DTextLabel(gString, 0x008080FF, Furn[param][pos][0], Furn[param][pos][1], Furn[param][pos][2]+0.8, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Furn[param][VirtualWorld], -1, -1, 100.0);
			}
		}
		else if(response == 0)
		{
		    SetDynamicObjectPos(Furn[param][Object], Furn[param][pos][0], Furn[param][pos][1], Furn[param][pos][2]);
	     	SetDynamicObjectRot(Furn[param][Object], Furn[param][rot][0], Furn[param][rot][1], Furn[param][rot][2]);
	     	CPF(playerid, COLOR_RED, "You are no longer editing %s.", Furn[param][ObjectName]);
		}
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == ArmouryCP)
	{
		format(gString, sizeof(gString), "General Patrol Gear\nHeavy\nSWAT Gear\nKevlar Vest\nAmmounation\nReturn Equipment");
		ShowPlayerDialog(playerid, DIALOG_ARMOURY, DIALOG_STYLE_LIST, "Armoury", gString, "Select", "Close");
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public CreatePlayer(playerid, name[], password[])
{
	printf("1");
    format(_query, sizeof(_query), "INSERT INTO `players`(`Name`, `Password`) VALUES ('%s', '%s')", name, password);
    mysql_query(_query);
    printf("2");
	return 1;
}

public CreateCharacter(playerid, name[], creator[], slot)
{
	format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", name);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows() <= 0)
	{
        format(_query, sizeof(_query), "INSERT INTO `characters`(`Name`, `Creator`, `Mask`, `RegisteredIP`, `Phone`) VALUES ('%s', '%s', '%d', '%s', '%d')", name, creator, random(99999)+1000, getIP(playerid), 100000+random(999999));
        mysql_query(_query);
		printf("Created Character");
		switch(slot)
		{
			case 1: {
			    format(_query, sizeof(_query), "UPDATE `players` SET `Character1`= '%s' WHERE `Name` = '%s'", name, GetName(playerid));
			    mysql_query(_query);
			    format(pInfo[playerid][pCharacter1], 25, name);
			}
			case 2: {
			    format(_query, sizeof(_query), "UPDATE `players` SET `Character2`= '%s' WHERE `Name` = '%s'", name, GetName(playerid));
			    mysql_query(_query);
			    format(pInfo[playerid][pCharacter2], 25, name);
			}
			case 3: {
			    format(_query, sizeof(_query), "UPDATE `players` SET `Character3`= '%s' WHERE `Name` = '%s'", name, GetName(playerid));
			    mysql_query(_query);
		 		format(pInfo[playerid][pCharacter3], 25, name);
			}
		}
		ShowCharacterList(playerid, GetName(playerid));
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Character %s has been created under slot %d.", name, slot);
		mysql_free_result();
	}
	else return printf("** An error has occured creating [character] %s", name), mysql_free_result();
	return 1;
}

public DeleteCharacter(playerid, name[], creator[], slot)
{
	format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", name);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
	    format(_query, sizeof(_query), "UPDATE `players` SET `Character%d`= 'None' WHERE `Name` = %s", slot, creator);
	    mysql_query(_query);
	    format(_query, sizeof(_query), "DELETE FROM `characters` WHERE `Name` = '%s'", name);
	    mysql_query(_query);
	    switch(slot)
	    {
	        case 1: format(pInfo[playerid][pCharacter1], 25, "None");
	        case 2: format(pInfo[playerid][pCharacter2], 25, "None");
	        case 3: format(pInfo[playerid][pCharacter3], 25, "None");
	    }
 	}
    else {
	    format(_query, sizeof(_query), "UPDATE `players` SET `Character%d`= 'None' WHERE `Name` = %s", slot, creator);
	    mysql_query(_query);
	    switch(slot)
	    {
	        case 1: format(pInfo[playerid][pCharacter1], 25, "None");
	        case 2: format(pInfo[playerid][pCharacter2], 25, "None");
	        case 3: format(pInfo[playerid][pCharacter3], 25, "None");
	    }
    }
    mysql_free_result();
	return 1;
}

public LoadCharacters(playerid)
{
    mysql_free_result();
	new temp[256];
	format(_query, sizeof(_query), "SELECT * FROM `players` WHERE `Name` = '%s'", GetName(playerid));
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows() > 0)
	{
		if(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), pInfo[playerid][SQLID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Name"), format(pInfo[playerid][pName], 25, temp);
	    	mysql_fetch_field_row(temp, "Password"), format(pInfo[playerid][pPassword], 130, temp);
	    	mysql_fetch_field_row(temp, "Character1"), format(pInfo[playerid][pCharacter1], 25, temp);
	    	mysql_fetch_field_row(temp, "Character2"), format(pInfo[playerid][pCharacter2], 25, temp);
	    	mysql_fetch_field_row(temp, "Character3"), format(pInfo[playerid][pCharacter3], 25, temp);
	    	mysql_fetch_field_row(temp, "Banned"), pInfo[playerid][pBanned] = strval(temp);
	    	mysql_fetch_field_row(temp, "BannedBy"), format(pInfo[playerid][pBannedBy], 25, temp);
	    	mysql_fetch_field_row(temp, "BanReason"), format(pInfo[playerid][pBanReason], 128, temp);
	    	mysql_fetch_field_row(temp, "Forumname"), format(pInfo[playerid][pForum], 128, temp);
	    	mysql_fetch_field_row(temp, "Email"), format(pInfo[playerid][pEmail], 128, temp);
	    	mysql_fetch_field_row(temp, "AdminLevel"), pInfo[playerid][AdminLevel] = strval(temp);
 			mysql_fetch_field_row(temp, "Status"), pInfo[playerid][pStatus] = strval(temp);
		}
	}
 	else
	{
	 	printf("** Error loading characters of %s", GetName(playerid));
	 	CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Cannot load characters.");
	}
	mysql_free_result();
 	return 1;
}

public LoadCharacter(playerid, name[])
{
    FadeColorForPlayer(playerid,0,0,0,0,0,0,0,255,15,0);
	new temp[256];
	getdate(year, month, day);
	format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", name);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		if(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), cInfo[playerid][SQLID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Name"), format(cInfo[playerid][cName], 25, temp);
	    	mysql_fetch_field_row(temp, "Creator"), format(cInfo[playerid][cCreator], 25, temp);
	    	mysql_fetch_field_row(temp, "Level"),cInfo[playerid][cLevel] = strval(temp);
	    	mysql_fetch_field_row(temp, "EXP"), cInfo[playerid][cEXP] = strval(temp);
	    	mysql_fetch_field_row(temp, "Money"), cInfo[playerid][cMoney] = strval(temp);
	    	mysql_fetch_field_row(temp, "Bank"), cInfo[playerid][cBank] = strval(temp);
	    	mysql_fetch_field_row(temp, "Skin"), cInfo[playerid][cSkin] = strval(temp);
	    	mysql_fetch_field_row(temp, "Job"), cInfo[playerid][cJob] = strval(temp);
	    	mysql_fetch_field_row(temp, "JobHours"), cInfo[playerid][cJobHours] = strval(temp);
	    	mysql_fetch_field_row(temp, "Faction"), cInfo[playerid][cFaction] = strval(temp);
	    	mysql_fetch_field_row(temp, "OLeader"), cInfo[playerid][cOLeader] = strval(temp);
	    	mysql_fetch_field_row(temp, "OOCGroup"), cInfo[playerid][cOOCGroup] = strval(temp);
	    	mysql_fetch_field_row(temp, "HaveRadio"), cInfo[playerid][cHaveRadio] = strval(temp);
	    	mysql_fetch_field_row(temp, "RSlot"), cInfo[playerid][cRSlot] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio1"), cInfo[playerid][cRadio][0] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio2"), cInfo[playerid][cRadio][1] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio3"), cInfo[playerid][cRadio][2] = strval(temp);
	    	mysql_fetch_field_row(temp, "Leader"), cInfo[playerid][cLeader] = strval(temp);
	    	mysql_fetch_field_row(temp, "Rank"), cInfo[playerid][cRank] = strval(temp);
	    	mysql_fetch_field_row(temp, "Jailed"), cInfo[playerid][cJailed] = strval(temp);
	    	mysql_fetch_field_row(temp, "JailTime"), cInfo[playerid][cJailTime] = strval(temp);
	    	mysql_fetch_field_row(temp, "Vehicle1"), cInfo[playerid][cVehicle1] = strval(temp);
	    	mysql_fetch_field_row(temp, "Vehicle2"), cInfo[playerid][cVehicle2] = strval(temp);
	    	mysql_fetch_field_row(temp, "Vehicle3"), cInfo[playerid][cVehicle3] = strval(temp);
	    	mysql_fetch_field_row(temp, "FirstLogin"), cInfo[playerid][cFirstLogin] = strval(temp);
	    	mysql_fetch_field_row(temp, "AdminRecordCount"), cInfo[playerid][cAdminRecordCount] = strval(temp);
	    	mysql_fetch_field_row(temp, "Lastseen"), format(cInfo[playerid][LastSeen], 64, temp);
	    	mysql_fetch_field_row(temp, "JailedBy"), format(cInfo[playerid][cJailedBy], 25, temp);
	    	mysql_fetch_field_row(temp, "JailReason"), format(cInfo[playerid][cJailReason], 128, temp);
	    	mysql_fetch_field_row(temp, "Phone"), cInfo[playerid][cPhone] = strval(temp);
	    	mysql_fetch_field_row(temp, "PhoneType"), cInfo[playerid][cPhoneType] = strval(temp);
	    	mysql_fetch_field_row(temp, "PhoneCredits"), cInfo[playerid][cPhoneCredits] = strval(temp);
	    	mysql_fetch_field_row(temp, "Minutes"), cInfo[playerid][cMinutes] = strval(temp);
	    	mysql_fetch_field_row(temp, "Savings"), cInfo[playerid][cSavings] = strval(temp);
	    	mysql_fetch_field_row(temp, "Mask"), cInfo[playerid][cMask] = strval(temp);
	    	mysql_fetch_field_row(temp, "Spawn0"), cInfo[playerid][cSpawn][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Spawn1"), cInfo[playerid][cSpawn][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Spawn2"), cInfo[playerid][cSpawn][2] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Prison"), cInfo[playerid][cPrison] = strval(temp);
	    	mysql_fetch_field_row(temp, "PrisonTime"), cInfo[playerid][cPrisonTime] = strval(temp);
	    	mysql_fetch_field_row(temp, "PrisonCell"), cInfo[playerid][cPrisonCell] = strval(temp);
	    	mysql_fetch_field_row(temp, "Renting"), cInfo[playerid][cRenting] = strval(temp);
	    	mysql_fetch_field_row(temp, "Donator"), cInfo[playerid][cDonator] = strval(temp);
	    	mysql_fetch_field_row(temp, "Numberchanges"), cInfo[playerid][cNumberchanges] = strval(temp);
	    	mysql_fetch_field_row(temp, "Namechanges"), cInfo[playerid][cNamechanges] = strval(temp);
	    	mysql_fetch_field_row(temp, "HaveNote"), cInfo[playerid][cHaveNote] = strval(temp);
	    	mysql_fetch_field_row(temp, "Note1"), format(cInfo[playerid][cNote1], 128, temp);
	    	mysql_fetch_field_row(temp, "Note2"), format(cInfo[playerid][cNote2], 128, temp);
	    	mysql_fetch_field_row(temp, "Note3"), format(cInfo[playerid][cNote3], 128, temp);
	    	mysql_fetch_field_row(temp, "Note4"), format(cInfo[playerid][cNote4], 128, temp);
	    	mysql_fetch_field_row(temp, "Note5"), format(cInfo[playerid][cNote5], 128, temp);
	    	mysql_fetch_field_row(temp, "DrivingLicense"), cInfo[playerid][cDrivingLicense] = strval(temp);
	    	mysql_fetch_field_row(temp, "WeaponLicense"), cInfo[playerid][cWeaponLicense] = strval(temp);
	    	mysql_fetch_field_row(temp, "Crashed"), cInfo[playerid][cCrashed] = strval(temp);
	    	mysql_fetch_field_row(temp, "CrashPos0"), cInfo[playerid][cCrashPos][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "CrashPos1"), cInfo[playerid][cCrashPos][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "CrashPos2"), cInfo[playerid][cCrashPos][2] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "CrashINT"), cInfo[playerid][cCrashINT] = strval(temp);
	    	mysql_fetch_field_row(temp, "CrashVW"), cInfo[playerid][cCrashVW] = strval(temp);
	    	mysql_fetch_field_row(temp, "TotalHours"), cInfo[playerid][cTotalHours] = strval(temp);
	    	mysql_fetch_field_row(temp, "Paycheck"), cInfo[playerid][cPaycheck] = strval(temp);
	    	mysql_fetch_field_row(temp, "Boombox"), cInfo[playerid][cBoombox] = strval(temp);
	    	mysql_fetch_field_row(temp, "Event"), cInfo[playerid][cEvent] = strval(temp);
	    	mysql_fetch_field_row(temp, "Gender"), cInfo[playerid][cGender] = strval(temp);
	    	mysql_fetch_field_row(temp, "Age"), cInfo[playerid][cAge] = strval(temp);
	    	mysql_fetch_field_row(temp, "HaveBag"), cInfo[playerid][cHaveBag] = strval(temp);
	    	mysql_fetch_field_row(temp, "BagMoney"), cInfo[playerid][cBagMoney] = strval(temp);
		}
	    mysql_free_result();
	    LoadPlayerBag(playerid);
		//if(pInfo[playerid][AdminLevel] <= 0 && ServerLocked == true) return CPF(playerid, COLOR_RED, "Server is currently unreachable"), CPF(playerid, COLOR_RED, "Reason: %s", ServerLockReason), KickEx(playerid);
		SetPlayerName(playerid, cInfo[playerid][cName]);
		SetPlayerColor(playerid, 0xFFFFFF00);
		ClearChat(playerid);
		Logged[playerid] = true;
		format(_query, sizeof(_query), "UPDATE `characters` SET `Online` = 1 WHERE `Name` = '%s'", name);
		mysql_query(_query);
		/*new Float:ghealth, Float:garmour;
		GetPlayerHealth(playerid, ghealth);
		GetPlayerArmour(playerid, garmour);
		SetPlayerHealth(playerid, 99);
		format(playerTag[playerid], 128, "(( %s ))\n[%02d HP] - [%02d AP]", GetPlayerNameEx(playerid), ghealth, garmour);
		playerNametag[playerid] = CreateDynamic3DTextLabel(playerTag[playerid], GetPlayerColor(playerid), 0.0, 0.0, 0.1, 15.0, playerid);
		UpdateNamelabel(playerid);*/
		if(cInfo[playerid][cFirstLogin] == 1)
		{
            SetPlayerCamera(playerid, 1890.737792, -1893.453247, 48.076305, 1885.885620, -1892.784912, 47.071220, true);
			TutorialTimer[playerid] = SetTimerEx("Tutorialism", 2500, false, "i", playerid);
		    GameTextForPlayer(playerid, "~y~You are being redirected to the server tutorial.", 2500, 4);
		    Tutorial[playerid] = 1;
		    FadeColorForPlayer(playerid,0,0,0,255,0,0,0,0,15,0);
		    StopPlayerFade(playerid);
			return 1;
		}
		SetSpawnInfo(playerid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		TogglePlayerSpectating(playerid, false);
		CPF(playerid, COLOR_GRAY, "SERVER:"COL_WHITE" %s, %s (%s)", cInfo[playerid][cFirstLogin] ? ("Welcome") : ("Welcome back"), cInfo[playerid][cCreator], cInfo[playerid][cName]);
		if(strcmp(cInfo[playerid][LastSeen], "Unknown", true)) CPF(playerid, -1, "Your last visit was on: %s", cInfo[playerid][LastSeen]);
		if(cInfo[playerid][cFaction] >= 1) fInfo[cInfo[playerid][cFaction]][OnlineMembers] += 1;
		if(!cInfo[playerid][cEvent]) SendClientMessage(playerid, COLOR_GRAY,"SERVER:"COL_WHITE" You are eligible to receive a reward! Type /claimreward!");
		//printf("%s", ReturnName(playerid));
	}
	else {
		printf("** Error loading character %s", name);
		CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Canno't load character %s.", name);
		ShowCharacterList(playerid, GetName(playerid));
	}
	mysql_free_result();
	return 1;
}

public ShowCharacterList(playerid, creator[])
{
	new X_STRING[256], Y_STRING[516];
	format(_query, sizeof(_query), "SELECT * FROM `players` WHERE `Name` = '%s'", creator);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		format(X_STRING, 128, "{33aa33}Slot\t\tName\n", pInfo[playerid][pCharacter1]);
		strcat(Y_STRING, X_STRING);
		if(strcmp(pInfo[playerid][pCharacter1], "None" ,true) == 0) format(X_STRING, 128, "1\t\t(Create)\n");
		else format(X_STRING, 128, "1\t\t%s\n", pInfo[playerid][pCharacter1]);
		strcat(Y_STRING, X_STRING);
		if(strcmp(pInfo[playerid][pCharacter2], "None" ,true) == 0) format(X_STRING, 128, "2\t\t(Create)\n");
		else format(X_STRING, 128, "2\t\t%s\n", pInfo[playerid][pCharacter2]);
		strcat(Y_STRING, X_STRING);
		if(strcmp(pInfo[playerid][pCharacter3], "None" ,true) == 0) format(X_STRING, 128, "3\t\t(Create)\n");
		else format(X_STRING, 128, "3\t\t%s\n", pInfo[playerid][pCharacter3]);
		strcat(Y_STRING, X_STRING);
		ShowPlayerDialog(playerid, DIALOG_CHARACTERS, DIALOG_STYLE_LIST, "Characters", Y_STRING, "Select", "Exit");
 	}
 	else printf("** Error showing character list of %s", creator);

 	mysql_free_result();
 	return 1;
}

public SavePlayer(playerid, name[])
{
	mysql_store_result();
	if(mysql_num_rows())
	{
		format(_query, sizeof(_query), "UPDATE `players` SET `Online` = '0' WHERE `Name` = '%s'", GetName(playerid));
		mysql_query(_query);
	    format(_query, sizeof(_query), "UPDATE `players` SET `Password`= '%s',`Character1`='%s',`Character2`='%s',`Character3`='%s',`Banned`='%d',`BannedBy`='%s',`BanReason`='%s', `Forumname`='%s', `Email`='%s', `AdminLevel` = '%d' WHERE `Name` = '%s'",
		pInfo[playerid][pPassword], pInfo[playerid][pCharacter1], pInfo[playerid][pCharacter2], pInfo[playerid][pCharacter3], pInfo[playerid][pBanned], pInfo[playerid][pBannedBy], pInfo[playerid][pBanReason], pInfo[playerid][pForum], pInfo[playerid][pEmail], pInfo[playerid][AdminLevel], name);
	    mysql_query(_query);
     	mysql_free_result();
 	}
 	else return mysql_free_result(), 0;
 	return 1;
}

public SaveCharacter(playerid, name[])
{
    SavePlayerBag(playerid);
	format(name, 25, cInfo[playerid][cName]);
	format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", name);
	mysql_query(_query);
	mysql_store_result();
	new time[3], date[3], lastseen[64];
	getdate(date[2], date[1], date[0]);
	gettime(time[0], time[1], time[2]);
	format(lastseen, 64, "%d/%d/%d %d:%d:%d", date[0], date[1], date[2], time[0], time[1], time[2]);
	if(mysql_num_rows())
	{
		format(_query, sizeof(_query), "UPDATE `characters` SET `Online` = '0' WHERE `Name` = '%s'", name);
		mysql_query(_query);
 	    format(_query, sizeof(_query), "UPDATE `characters` SET `Name` ='%s', `AdminLevel`='%d',`Level`='%d',`EXP`='%d',`Money`='%d',`Bank`='%d',`Skin`='%d',`Job`='%d', `Faction`='%d',`OLeader`='%d',`OOCGroup`='%d',`HaveRadio`='%d',`RSlot`='%d',`Radio1`='%d',`Radio2`='%d',`Radio3`='%d' WHERE `Name` = '%s'",
		GetName(playerid),
		pInfo[playerid][AdminLevel],
		cInfo[playerid][cLevel],
		cInfo[playerid][cEXP],
		cInfo[playerid][cMoney],
		cInfo[playerid][cBank],
		cInfo[playerid][cSkin],
		cInfo[playerid][cJob],
		cInfo[playerid][cFaction],
		cInfo[playerid][cOLeader],
		cInfo[playerid][cOOCGroup],
		cInfo[playerid][cHaveRadio],
		cInfo[playerid][cRSlot],
		cInfo[playerid][cRadio][0],
		cInfo[playerid][cRadio][1],
		cInfo[playerid][cRadio][2],
		name);
		mysql_query(_query);
 	    format(_query, sizeof(_query), "UPDATE `characters` SET `Leader`='%d',`Rank`='%d',`Jailed`='%d',`JailTime`='%d', `Vehicle1`='%d', `Vehicle2`='%d', `Vehicle3`='%d',`FirstLogin`='%d',`AdminRecordCount`='%d',`Lastseen`='%s', `Phone`='%d', `PhoneType`='%d', `PhoneCredits`='%d', `Minutes`='%d',`Savings`='%d' WHERE `Name` = '%s'",
		cInfo[playerid][cLeader],
		cInfo[playerid][cRank],
		cInfo[playerid][cJailed],
		cInfo[playerid][cJailTime],
		cInfo[playerid][cVehicle1],
		cInfo[playerid][cVehicle2],
		cInfo[playerid][cVehicle3],
		cInfo[playerid][cFirstLogin],
		cInfo[playerid][cAdminRecordCount],
		lastseen,
		cInfo[playerid][cPhone],
		cInfo[playerid][cPhoneType],
		cInfo[playerid][cPhoneCredits],
		cInfo[playerid][cMinutes],
		cInfo[playerid][cSavings],
		name);
		mysql_query(_query);
 	    format(_query, sizeof(_query), "UPDATE `characters` SET `Mask`=%d,`Spawn0`=%f, `Spawn1`=%f, `Spawn2`=%f, `Prison`=%d, `PrisonTime`=%d, `PrisonCell`=%d, `JobHours` = %d WHERE `Name` = '%s'",
		cInfo[playerid][cMask],
		cInfo[playerid][cSpawn][0],
		cInfo[playerid][cSpawn][1],
		cInfo[playerid][cSpawn][2],
		cInfo[playerid][cPrison],
		cInfo[playerid][cPrisonTime],
		cInfo[playerid][cPrisonCell],
		cInfo[playerid][cRenting],
		cInfo[playerid][cJobHours],
		name);
		mysql_query(_query);
 	    format(_query, sizeof(_query), "UPDATE `characters` SET `Donator` = %d, `Namechanges` = %d, `Numberchanges` = %d, `DrivingLicense` = %d, `WeaponLicense` = %d, `BagMoney` = %d WHERE `Name` = '%s'",
		cInfo[playerid][cDonator],
		cInfo[playerid][cNamechanges],
		cInfo[playerid][cNumberchanges],
		cInfo[playerid][cDrivingLicense],
		cInfo[playerid][cWeaponLicense],
		cInfo[playerid][cBagMoney],
		name);
		mysql_query(_query);
 	    format(_query, sizeof(_query), "UPDATE `characters` SET `TotalHours` = %d, `Boombox`= %d, `Paycheck` = %d, `Crashed` = %d, `CrashPos0` = %f, `CrashPos1` = %f, `CrashPos2` = %f, `CrashINT` = %d, `CrashVW` = %d, `Event` = %d, `LastIP` = '%s', `Gender`=%d, `Age`=%d, `HaveBag` = %d WHERE `Name` = '%s'",
        cInfo[playerid][cTotalHours],
        cInfo[playerid][cBoombox],
        cInfo[playerid][cPaycheck],
		cInfo[playerid][cCrashed],
		cInfo[playerid][cCrashPos][0],
		cInfo[playerid][cCrashPos][1],
		cInfo[playerid][cCrashPos][2],
		cInfo[playerid][cCrashINT],
		cInfo[playerid][cCrashVW],
		cInfo[playerid][cEvent],
		cInfo[playerid][cGender],
		cInfo[playerid][cAge],
		cInfo[playerid][cHaveBag],
		getIP(playerid),
		name);
		mysql_query(_query);
   	  	SetPlayerName(playerid, cInfo[playerid][cCreator]);
   	  	if(cInfo[playerid][cFaction] >= 1) fInfo[cInfo[playerid][cFaction]][OnlineMembers] -= 1;
  	}
 	mysql_free_result();
 	return 1;
}

public BanPlayer(targetid, reason[], admin[])
{
	pInfo[targetid][pBanned] = 1;
	new id = GetPlayerIdFromName(admin);
	format(pInfo[targetid][pBannedBy], 64, "%s (%s)", admin, cInfo[id][cCreator]);
	format(pInfo[targetid][pBanReason], 128, reason);
	format(gString, sizeof gString, "ADMIN: %s has been banned by Administrator %s. Reason: %s", GetName(targetid), admin, reason);
	SendClientMessageToAll(COLOR_RED, gString);
	SavePlayer(targetid, pInfo[targetid][pName]);
	KickEx(targetid);
	return 1;
}

// ------------------------------------------------------
// Stocks, Functions and Misc Publics

/*forward WeatherTime();
public WeatherTime()
{ // Dynamiclly Weather and Time system by Frenzy
	new sec1, min1, hour1, weather;
	gettime(hour1, min1, sec1);
	SetWorldTime(hour1);
	ServerTime = hour1;
	switch(ServerTime)
	{
	    case 6..17:
		{
		    weather = RandomEx(0,7);
	 		format(gString, sizeof gString, "weather %d", weather);
	 		SendRconCommand(gString);
		}
	    default:
		{
		    weather = RandomEx(0,9);
	 		format(gString, sizeof gString, "weather %d", weather);
	 		SendRconCommand(gString);
		}
	}
	return 1;
}*/

GetName(playerid)
{ // GetName function by Frenzy
	new str[MAX_PLAYER_NAME+1];
	GetPlayerName(playerid, str, sizeof(str));
	return str;
}

GetPlayerNameEx(playerid)
{
    new string[25];
    GetPlayerName(playerid,string,25);
    new str[25];
    strmid(str,string,0,strlen(string),2425);
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if (str[i] == '_') str[i] = ' ';
    }
    return str;
}

ClearChat(playerid)
{
    for(new i = 0,j = 100; i < j; i++) SendClientMessage(playerid, -1, "");
	return true;
}

stock SendModeratorMessage(color, astring[])
{
    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(!AdminChat[i]) continue;
	    if(pInfo[i][AdminLevel] == 1)
	    {
	        SendClientMessage(i, color, astring);
	    }
	    else continue;
	}
	return 1;
}

SendAdminMessage(color, astring[])
{
    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(!AdminChat[i]) continue;
	    if(pInfo[i][AdminLevel] >= 2)
	    {
	        SendClientMessage(i, color, astring);
	    }
	    else continue;
	}
	return 1;
}

SendHelpMessage(color, astring[])
{
    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(!AdminChat[i]) continue;
	    if(pInfo[i][AdminLevel] >= 1)
	    {
	        SendClientMessage(i, color, astring);
	    }
	    else continue;
	}
	return 1;
}

SendShowPM(color, astring[])
{
    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(!AdminChat[i]) continue;
	    if(!ShowPM[i]) continue;
	    if(pInfo[i][AdminLevel] >= 2)
	    {
	        SendClientMessage(i, color, astring);
	    }
	    else continue;
	}
	return 1;
}

public OnPlayerEnterPizzaCheckpoint(playerid)
{
	new Float:MYPOS[3];
	GetPlayerPos(playerid, MYPOS[0], MYPOS[1], MYPOS[2]);
	if(IsPlayerInRangeOfPoint(playerid, 3.0, PizzaMission[playerid][CPPOS][0],PizzaMission[playerid][CPPOS][1],PizzaMission[playerid][CPPOS][2]))
	{
	   	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Please leave the vehicle before delivering pizzas!");
	    if(!PizzaMission[playerid][CarryingPizza]) return GameTextForPlayer(playerid, "~w~You're not carrying a pizza! (/takepizza)", 2500, 4);
	    new pizzamoney=50;
	    CPF(playerid, 0x008000FF, "You've earned $50 base price for the pizza!");
    	PizzaMission[playerid][CarryingPizza] = false;
    	RemovePlayerAttachedObject(playerid, 9);
    	SetPlayerSpecialAction(playerid, 0);
    	CPF(playerid,0xA9A9A9FF, "Bonuses:");
    	pizzamoney += floatround((PizzaMission[playerid][PizzaWarmth]*0.3));
    	CPF(playerid, 0xA9A9A9FF, "- $%d bonus for pizza warmth!", floatround(PizzaMission[playerid][PizzaWarmth]*0.3));
		if(PizzaMission[playerid][PizzaSeconds] < 90)
		{
		    CPF(playerid, 0xA9A9A9FF, "- $15 bonus for extra fast delivery (under 90 seconds)!");
		    pizzamoney+=15;
		}
		new tip = RandomEx(20,35);
		CPF(playerid, 0xA9A9A9FF, "- $%d bonus from tip!", tip);
		pizzamoney+=tip;
		CPF(playerid, -1, "Total money earned: $%d. It was added to paycheck.", pizzamoney);
		PizzaMission[playerid][SessionEarning] += pizzamoney;
		cInfo[playerid][cPaycheck] += pizzamoney;
		DisablePlayerCheckpoint(playerid);
		if(PizzaLeft[PizzaMission[playerid][MissionBike]] > 0)
		{
			new hid = GetRandomHouseWithRange(playerid);
			PizzaMission[playerid][CPPOS][0] = hInfo[hid][X_OUT];
			PizzaMission[playerid][CPPOS][1]  =  hInfo[hid][Y_OUT];
			PizzaMission[playerid][CPPOS][2]  =  hInfo[hid][Z_OUT];
			PizzaMission[playerid][TotalSeconds] += PizzaMission[playerid][PizzaSeconds];
			PizzaMission[playerid][PizzaSeconds] = 0;
			SetPlayerCheckpoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2], 2.0);
			new sumstring[256];
			new ss[32];
			GetPlayer2DZone(playerid, ss, 32);
			new sd[32];
			Get2DZone(PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], sd, 32);
			format(sumstring, 256, "             "COL_YELLOW"New Delivery Acquired!\n"COL_WHITE"Current Location: %s\nDelivery Address: %s\nDistance: %.2fm\n"COL_YELLOW"Pizzas left: %d.", ss, hInfo[hid][Address], GetPlayerDistanceFromPoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2]), PizzaLeft[PizzaMission[playerid][MissionBike]]);
			ShowPlayerDialog(playerid, 1336, DIALOG_STYLE_MSGBOX, "Delivery Status", sumstring, "Confirm", "");
			PlayerPlaySound(playerid, 1057, 0, 0, 0);
		}
		else
		{
		    PizzaMission[playerid][TotalSeconds] += PizzaMission[playerid][PizzaSeconds];
		    new ministring[256];
		    format(ministring, 256, ""COL_YELLOW"Delivery Mission Complete!\n"COL_WHITE"Session stats:\nTotal earned: %d$\nSession length: %d seconds", PizzaMission[playerid][SessionEarning], PizzaMission[playerid][TotalSeconds]);
		    ShowPlayerDialog(playerid, 1336, DIALOG_STYLE_MSGBOX, "Statistics:", ministring, "Confirm", "");
        	PizzaMission[playerid][PizzaSeconds] = 0;
			PizzaMission[playerid][CarryingPizza] = false;
			RemovePlayerAttachedObject(playerid, 9);
			PizzaMission[playerid][PizzaWarmth] = 100;
			PizzaMission[playerid][OnMission] = false;
			PizzaMission[playerid][TotalSeconds] = 0;
			SetTimerEx("RespawnPizza", 60000, 0, "i", PizzaMission[playerid][MissionBike]);
			SendClientMessage(playerid, COLOR_RED, "Pizza bike will be respawned in 60 seconds.");
			PizzaMission[playerid][MissionBike] = -1;
			PizzaMission[playerid][SessionEarning] = 0;
			KillTimer(PizzaMission[playerid][PizzaTimer]);
			PlayerTextDrawHide(playerid, PizzaDraw);
		}
	}
	return 1;
}


stock CPF(playerid, color, fstring[], {Float, _}:...)
{
    static const
        STATIC_ARGS = 3;
    new
        n = (numargs() - STATIC_ARGS) * BYTES_PER_CELL;
    if (n)
    {
        new
            message[128],
            arg_start,
            arg_end;
        #emit CONST.alt        fstring
        #emit LCTRL          5
        #emit ADD
        #emit STOR.S.pri        arg_start
        #emit LOAD.S.alt        n
        #emit ADD
        #emit STOR.S.pri        arg_end
        do
        {
            #emit LOAD.I
            #emit PUSH.pri
            arg_end -= BYTES_PER_CELL;
            #emit LOAD.S.pri      arg_end
        }
        while (arg_end > arg_start);
        #emit PUSH.S          fstring
        #emit PUSH.C          128
        #emit PUSH.ADR         message
        n += BYTES_PER_CELL * 3;
        #emit PUSH.S          n
        #emit SYSREQ.C         format
        n += BYTES_PER_CELL;
        #emit LCTRL          4
        #emit LOAD.S.alt        n
        #emit ADD
        #emit SCTRL          4

        return SendClientMessage(playerid, color, message);
    }
    else
    {
        return SendClientMessage(playerid, color, fstring);
    }
}

stock SendWrappedMessageToPlayer2(playerid, colour, const msg[], maxlength=120, const prefix[]="..")
{
        new length = strlen(msg);
        if(length <= maxlength) {
        SendClientMessage(playerid, colour, msg);
        return 1;
}
        new string[156], idx;
        for(new i, space, plen, bool:useprefix; i < length; i++) {
        if(i - idx + plen >= maxlength) {
        if(idx == space || i - space >= 25) {
        strmid(string, msg, idx, i);
        idx = i;
}
        else
{
        strmid(string, msg, idx, space);
        idx = space + 1;
}
        if(useprefix)
        {
                strins(string, prefix, 0);
        }
        else
        {
                plen = strlen(prefix);
                useprefix = true;
        }
        SendClientMessage(playerid, colour, string);
        }
        else if(msg[i] == ' ')
        {
                space = i;
        }
}
        if(idx < length) {
        strmid(string, msg, idx, length);
        strins(string, prefix, 0);
        SendClientMessage(playerid, colour, string);
        }
        return 1;
}

forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		new VW = GetPlayerVirtualWorld(playerid);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && GetPlayerVirtualWorld(i) == VW)
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendWrappedMessageToPlayer(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendWrappedMessageToPlayer(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendWrappedMessageToPlayer(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendWrappedMessageToPlayer(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendWrappedMessageToPlayer(i, col5, string);
				}
			}
		}
	}
	return 1;
}


forward PreventACSpam(playerid);
public PreventACSpam(playerid)
{
	AnticheatSpam[playerid] = false;
	return 1;
}

forward PreventVSpam(playerid);
public PreventVSpam(playerid)
{
	VehicleSpam[playerid] = false;
	return 1;
}

forward RemoveReport(playerid);
public RemoveReport(playerid) return SentReport[playerid] = false;

forward RemoveHelpme(playerid);
public RemoveHelpme(playerid) return SentHelpmea[playerid] = false;

forward StopTalk(playerid);
public StopTalk(playerid)
{
	ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	return 1;
}

stock SendWrappedMessageToAll(colour, const msg[], maxlength=120, const prefix[]="..")
{
        new length = strlen(msg);
        if(length <= maxlength) {
                SendClientMessageToAll(colour, msg);
                return;
        }
        new string[156], idx;
        for(new i, space, plen, bool:useprefix; i < length; i++) {
                if(i - idx + plen >= maxlength) {
                        if(idx == space || i - space >= 25) {
                                strmid(string, msg, idx, i);
                                idx = i;
                        } else {
                                strmid(string, msg, idx, space);
                                idx = space + 1;
                        }
                        if(useprefix) {
                                strins(string, prefix, 0);
                        } else {
                                plen = strlen(prefix);
                                useprefix = true;
                        }
                        SendClientMessageToAll(colour, string);
                } else if(msg[i] == ' ') {
                        space = i;
                }
        }
        if(idx < length) {
                strmid(string, msg, idx, length);
                strins(string, prefix, 0);
                switch(gType)
                {
                    case 8: format(string, sizeof(string), "{DEEEFF}[OOC] %s: %s", GetName(gUser), string);
                    case 9: format(string, sizeof(string), "{089CBD}[Admin OOC] %s: %s", GetName(gUser), string);
                }
                SendClientMessageToAll(colour, string);
        }
        return;
}

stock SendWrappedMessageToPlayer(playerid, colour, const msg[], maxlength=120, const prefix[]="..")
{
        new length = strlen(msg);
        if(length <= maxlength)
		{
        SendClientMessage(playerid, colour, msg);
        return 1;
}
        new string[156], idx;
        for(new i, space, plen, bool:useprefix; i < length; i++) {
        if(i - idx + plen >= maxlength) {
        if(idx == space || i - space >= 25) {
        strmid(string, msg, idx, i);
        idx = i;
}
        else
{
        strmid(string, msg, idx, space);
        idx = space + 1;
}
        if(useprefix)
        {
                strins(string, prefix, 0);
        }
        else
        {
                plen = strlen(prefix);
                useprefix = true;
        }
		SendClientMessage(playerid, colour, string);
        }
        else if(msg[i] == ' ')
        {
                space = i;
        }
}
        if(idx < length) {
        strmid(string, msg, idx, length);
        strins(string, prefix, 0);
		switch(gType)
		{
		    case 1: format(string, sizeof(string), "%s says: %s", GetPlayerNameEx(gUser), string);
		    case 2: format(string, sizeof(string), "%s says [low]: %s", GetPlayerNameEx(gUser), string);
		    case 3: format(string, sizeof(string), "%s shouts: %s", GetPlayerNameEx(gUser), string);
		    case 4: format(string, sizeof(string), "* %s (( %s ))", string, GetPlayerNameEx(gUser));
		    case 5: format(string, sizeof(string), "* %s", string);
		    case 6: format(string, sizeof(string), ""COL_YELLOW"%s whispers: %s", GetPlayerNameEx(gUser), string);
		    /*case 7:
			{
				if(ModeratorDuty[gUser] && pInfo[gUser][AdminLevel] == 1)
				{
					format(string, sizeof(string), "[%d] {A52A2A}%s"COL_FADE": %s", gUser, GetPlayerNameEx(gUser), string);
				}
				else if(AdminDuty[gUser] && pInfo[gUser][AdminLevel] > 1)
				{
					format(string, sizeof(string), "[%d] {33AA33}%s"COL_FADE": %s", gUser, cInfo[gUser][cCreator], string);
				}
				else
				{
				    if(cInfo[gUser][cDonator] > 0)
				    {
						format(string, sizeof(string), "[%d] {E89F38}%s"COL_FADE": %s", gUser, GetPlayerNameEx(gUser), string);
				    }
				    else
				    {
						format(string, sizeof(string), "[%d] %s: %s", gUser, GetPlayerNameEx(gUser), string);
					}
				}
			}*/
		}
        SendClientMessage(playerid, colour, string);
        }
        gType = 0;
        gUser = -1;
        return 1;
}

stock GetVehicleSpeed(vehicleid)
{
    new Float:V[3];
    GetVehicleVelocity(vehicleid, V[0], V[1], V[2]);
    return floatround(floatsqroot(V[0] * V[0] + V[1] * V[1] + V[2] * V[2]) * 180.00);
}

forward KickPublic(playerid);
public KickPublic(playerid)
	Kick(playerid);

stock GetPlayerIdFromName(playername[])
{
  for(new i = 0; i <= MAX_PLAYERS; i++)
  {
    if(IsPlayerConnected(i))
    {
      new playername2[MAX_PLAYER_NAME];
      GetPlayerName(i, playername2, sizeof(playername2));
      if(strcmp(playername2, playername, true, strlen(playername)) == 0)
      {
        return i;
      }
    }
  }
  return INVALID_PLAYER_ID;
}

stock RandomEx(min, max)
{
    return random(max - min) + min;
}

GetVehicleModelIDFromName(vname[])
{
	for(new i = 0; i < 211; i++)
	{
		if(strfind(VehicleNames[i], vname, true) != -1)
		return i + 400;
	}
	return -1;
}

/*GetPlayerRank(playerid)
{
	new facID = cInfo[playerid][cFaction];
	new rankID = cInfo[playerid][cRank];
	if(cInfo[playerid][cFaction] > 0)
	{
		for(new i = 0; i <= sizeof(fInfo); i++)
		{
		    if(i == facID)
		    {
				new rank[32];
				format(rank, sizeof rank, fInfo[i][Rank][rankID]);
				return rank;
			}
		}
	}
	else return rank = "Unemployed";
}*/

static const gSAZones[][SAZONE_MAIN] = {  // Majority of names and area coordinates adopted from Mabako's 'Zones Script' v0.2
        //      NAME                            AREA (Xmin,Ymin,Zmin,Xmax,Ymax,Zmax)
        {"The Big Ear",                 {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
        {"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
        {"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
        {"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
        {"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
        {"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
        {"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
        {"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
        {"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
        {"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
        {"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
        {"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
        {"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
        {"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
        {"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
        {"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
        {"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
        {"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
        {"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
        {"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
        {"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
        {"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
        {"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
        {"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
        {"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
        {"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
        {"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
        {"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
        {"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
        {"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
        {"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
        {"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
        {"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
        {"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
        {"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
        {"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
        {"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
        {"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
        {"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
        {"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
        {"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
        {"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
        {"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
        {"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
        {"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
        {"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
        {"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
        {"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
        {"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
        {"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
        {"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
        {"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
        {"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
        {"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
        {"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
        {"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
        {"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
        {"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
        {"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
        {"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
        {"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
        {"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
        {"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
        {"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
        {"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
        {"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
        {"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
        {"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
        {"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
        {"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
        {"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
        {"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
        {"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
        {"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
        {"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
        {"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
        {"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
        {"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
        {"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
        {"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
        {"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
        {"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
        {"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
        {"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
        {"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
        {"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
        {"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
        {"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
        {"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
        {"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
        {"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
        {"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
        {"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
        {"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
        {"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
        {"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
        {"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
        {"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
        {"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
        {"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
        {"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
        {"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
        {"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
        {"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
        {"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
        {"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
        {"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
        {"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
        {"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
        {"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
        {"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
        {"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
        {"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
        {"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
        {"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
        {"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
        {"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
        {"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
        {"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
        {"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
        {"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
        {"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
        {"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
        {"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
        {"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
        {"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
        {"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
        {"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
        {"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
        {"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
        {"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
        {"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
        {"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
        {"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
        {"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
        {"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
        {"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
        {"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
        {"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
        {"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
        {"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
        {"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
        {"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
        {"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
        {"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
        {"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
        {"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
        {"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
        {"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
        {"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
        {"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
        {"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
        {"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
        {"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
        {"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
        {"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
        {"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
        {"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
        {"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
        {"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
        {"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
        {"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
        {"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
        {"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
        {"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
        {"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
        {"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
        {"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
        {"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
        {"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
        {"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
        {"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
        {"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
        {"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
        {"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
        {"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
        {"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
        {"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
        {"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
        {"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
        {"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
        {"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
        {"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
        {"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
        {"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
        {"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
        {"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
        {"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
        {"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
        {"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
        {"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
        {"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
        {"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
        {"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
        {"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
        {"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
        {"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
        {"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
        {"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
        {"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
        {"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
        {"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
        {"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
        {"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
        {"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
        {"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
        {"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
        {"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
        {"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
        {"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
        {"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
        {"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
        {"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
        {"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
        {"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
        {"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
        {"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
        {"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
        {"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
        {"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
        {"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
        {"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
        {"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
        {"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
        {"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
        {"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
        {"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
        {"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
        {"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
        {"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
        {"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
        {"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
        {"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
        {"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
        {"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
        {"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
        {"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
        {"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
        {"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
        {"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
        {"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
        {"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
        {"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
        {"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
        {"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
        {"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
        {"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
        {"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
        {"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
        {"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
        {"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
        {"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
        {"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
        {"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
        {"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
        {"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
        {"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
        {"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
        {"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
        {"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
        {"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
        {"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
        {"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
        {"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
        {"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
        {"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
        {"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
        {"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
        {"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
        {"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
        {"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
        {"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
        {"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
        {"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
        {"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
        {"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
        {"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
        {"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
        {"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
        {"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
        {"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
        {"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
        {"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
        {"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
        {"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
        {"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
        {"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
        {"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
        {"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
        {"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
        {"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
        {"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
        {"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
        {"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
        {"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
        {"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
        {"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
        {"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
        {"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
        {"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
        {"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
        {"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
        {"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
        {"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
        {"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
        {"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
        {"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
        {"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
        {"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
        {"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
        {"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
        {"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
        {"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
        {"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
        {"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
        {"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
        {"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
        {"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
        {"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
        {"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
        {"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
        {"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
        {"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
        {"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
        {"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
        {"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
        {"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
        {"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
        {"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
        {"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
        {"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
        {"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
        {"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
        {"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
        {"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
        {"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
        {"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
        {"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
        {"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
        {"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
        {"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
        {"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
        {"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
        {"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
        {"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
        {"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
        {"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
        {"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
        {"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
        {"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
        {"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
        {"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
        {"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
        {"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
        {"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
        {"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
        // Main Zones
        {"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
        {"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
        {"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
        {"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
        {"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
        {"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
        {"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
        {"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
        {"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};

stock Get2DZone(Float:xx, Float:yy, zone[], len)
{
        new Float:x, Float:y;
		x = xx;
		y = yy;
        for(new i = 0; i != sizeof(gSAZones); i++ )
        {
                if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4])
                {
                    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
                }
        }
        return 0;
}

stock GetPlayer2DZone(playerid, zone[], len) //Credits to Cueball, Betamaster, Mabako, and Simon (for finetuning).
{
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        for(new i = 0; i != sizeof(gSAZones); i++ )
        {
                if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4])
                {
                    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
                }
        }
        return 0;
}

BuyVehicle(playerid, vehicleid, color1, color2)
{
	if(!IsBuyableVeh(vehicleid)) return SendClientMessage(playerid, COLOR_GRAY, "Given vehicle is not for sale."), 0;
	if(vehicleid == 509 || vehicleid == 510 || vehicleid == 481)
	{
	    if(cInfo[playerid][cDonator] < 1)
	        return CPF(playerid, COLOR_GRAY, "This vehicle is available to purchase for Bronze Donator and above.");
	}
	if(vehicleid == 471 || vehicleid == 468)
	{
	    if(cInfo[playerid][cDonator] < 2)
	        return CPF(playerid, COLOR_GRAY, "This vehicle is available to purchase for Silver Donator and above.");
	}
	if(vehicleid == 541 || vehicleid == 521)
	{
	    if(cInfo[playerid][cDonator] < 3)
	        return CPF(playerid, COLOR_GRAY, "This vehicle is available to purchase for Gold Donator and above.");
	}
	if(cInfo[playerid][cVehicle1] != 0 && cInfo[playerid][cVehicle2] != 0 && cInfo[playerid][cVehicle3] != 0) return SendClientMessage(playerid, COLOR_GRAY, "You already have 3 vehicles."), 0;
	if(cInfo[playerid][cMoney] < GetVehiclePrice(vehicleid)) return CPF(playerid, COLOR_GRAY, "You don't have enough money."), 0;
	if(color1 > 255 || color1 < 0 || color2 > 255 || color2 < 0) return CPF(playerid, COLOR_GRAY, "Selected vehicle colors are invalid (0-255)"), 0;
    new Float:SpawnLoc[4];
	for(new i = 0; i < sizeof(CarsPrices); i++)
	{
	    if(CarsPrices[i][VEHID] != vehicleid) continue;
	    else
		{
		    if(CarsPrices[i][TYPE] == 1)
			{
		        new Random = random(sizeof(CarDealershipSpawn));
		        SpawnLoc[0] = CarDealershipSpawn[Random][0];
		        SpawnLoc[1] = CarDealershipSpawn[Random][1];
		        SpawnLoc[2] = CarDealershipSpawn[Random][2];
		        SpawnLoc[3] = CarDealershipSpawn[Random][3];
			}
			else if(CarsPrices[i][TYPE] == 2)
			{
		        new Random = random(sizeof(BoatDealershipSpawn));
		        SpawnLoc[0] = BoatDealershipSpawn[Random][0];
		        SpawnLoc[1] = BoatDealershipSpawn[Random][1];
		        SpawnLoc[2] = BoatDealershipSpawn[Random][2];
		        SpawnLoc[3] = BoatDealershipSpawn[Random][3];
			}
			else if(CarsPrices[i][TYPE] == 3)
			{
		        new Random = random(sizeof(AirplaneDealershipSpawn));
		        SpawnLoc[0] = AirplaneDealershipSpawn[Random][0];
		        SpawnLoc[1] = AirplaneDealershipSpawn[Random][1];
		        SpawnLoc[2] = AirplaneDealershipSpawn[Random][2];
		        SpawnLoc[3] = AirplaneDealershipSpawn[Random][3];
			}
			break;
		}
	}
	new plate[64], randnumb = 1000 + random(8999);
	format(plate, 64,"LS-%d", randnumb);
	format(_query, sizeof(_query), "INSERT INTO `vehicles`(`Model`, `Owner`,`Color1`, `Color2`, `Plate`, `X`, `Y`, `Z`, `A`) VALUES ('%d', '%d', '%d', '%d', '%s', '%f', '%f', '%f', '%f')",
	vehicleid, cInfo[playerid][SQLID], color1, color2, plate, SpawnLoc[0], SpawnLoc[1], SpawnLoc[2], SpawnLoc[3]);
	mysql_query(_query);
	if(cInfo[playerid][cVehicle1] == 0) cInfo[playerid][cVehicle1] = mysql_insert_id();
	else if(cInfo[playerid][cVehicle2] == 0) cInfo[playerid][cVehicle2] = mysql_insert_id();
	else if(cInfo[playerid][cVehicle3] == 0) cInfo[playerid][cVehicle3] = mysql_insert_id();
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" You have bought a %s for $%d.", VehicleNames[vehicleid-400], GetVehiclePrice(vehicleid));
	cInfo[playerid][cMoney] -= GetVehiclePrice(vehicleid);
	GivePlayerMoneyEx(playerid, -GetVehiclePrice(vehicleid));
	return 1;
}

/*stock LoadFurnitures() // OLD OLD OLD --- DO NOT USE
{
    new result[512], rshim, sqlarray[MAX_FURNITURES], counter=0;
    for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
    {
		format(_query, sizeof(_query), "SELECT * FROM `furnitures` WHERE `ID` = '%d'", i);
		mysql_query(_query);
	    mysql_store_result();
	    while(mysql_fetch_row_format(result, "|"))
	    {
	        sscanf(result, "p<|>d", rshim);
	        sqlarray[counter] = rshim;
	        counter++;
	    }
	    mysql_free_result();
	}
    for(new i=0; i < counter; i++)
    {
        LoadFurniture(sqlarray[i]);
    }
    return 1;
}*/

/*stock LoadServerVehicles() // OLD OLD OLD DO NOT USE !! USE LOADALLVEHICLES
{
    new result[512], rshim, sqlarray[516], counter=0;
    mysql_query("SELECT `id` FROM `vehicles` WHERE `Server` = 1");
    mysql_store_result();
    while(mysql_fetch_row_format(result, "|"))
    {
        sscanf(result, "p<|>d", rshim);
        sqlarray[counter] = rshim;
        counter++;
    }
    mysql_free_result();
    for(new i=0; i < counter; i++)
    {
        LoadVehicle(sqlarray[i]);
    }
    return 1;
}*/

LoadAllVehicles()
{
	mysql_query("SELECT * FROM `vehicles` WHERE `Server` = 1");
	mysql_store_result();
	new temp[128], Float:vpos[4], Info[20], plate[64];
	while(mysql_retrieve_row())
	{
	    mysql_fetch_field_row(temp, "ID"), Info[0] = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), Info[1] = strval(temp);
	    mysql_fetch_field_row(temp, "Owner"), Info[2] = strval(temp);
	    mysql_fetch_field_row(temp, "Locked"), Info[3] = strval(temp);
	    mysql_fetch_field_row(temp, "Faction"), Info[4] = strval(temp);
	    mysql_fetch_field_row(temp, "Job"), Info[5] = strval(temp);
	    mysql_fetch_field_row(temp, "Server"), Info[6] = strval(temp);
	    mysql_fetch_field_row(temp, "Color1"), Info[7] = strval(temp);
	    mysql_fetch_field_row(temp, "Color2"), Info[8] = strval(temp);
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), temp);
	    mysql_fetch_field_row(temp, "Rentable"), Info[10] = strval(temp);
	    mysql_fetch_field_row(temp, "RentPrice"), Info[11] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1"), Info[12] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1Ammo"), Info[13] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2"), Info[14] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2Ammo"), Info[15] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3"), Info[16] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3Ammo"), Info[17] = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), Info[18] = strval(temp);
	    mysql_fetch_field_row(temp, "Fuel"), Info[19] = strval(temp);
		mysql_fetch_field_row(temp, "X"), vpos[0] = floatstr(temp);
		mysql_fetch_field_row(temp, "Y"), vpos[1] = floatstr(temp);
		mysql_fetch_field_row(temp, "Z"), vpos[2] = floatstr(temp);
		mysql_fetch_field_row(temp, "A"), vpos[3] = floatstr(temp);
		new spawnedcar = CreateVehicle(Info[1], vpos[0], vpos[1], vpos[2], vpos[3], Info[7], Info[8], -1);
		vInfo[spawnedcar][ID] = Info[0];
		vInfo[spawnedcar][Model] = Info[1];
		vInfo[spawnedcar][Owner] = Info[2];
		vInfo[spawnedcar][Locked] = 0;
		vInfo[spawnedcar][Faction] = Info[4];
		vInfo[spawnedcar][Job] = Info[5];
		vInfo[spawnedcar][Server] = Info[6];
		vInfo[spawnedcar][Color1] = Info[7];
		vInfo[spawnedcar][Color2] = Info[8];
		format(vInfo[spawnedcar][Plate], 64, plate);
		vInfo[spawnedcar][Rentable] = Info[10];
		vInfo[spawnedcar][RentPrice] = Info[11];
		vInfo[spawnedcar][Wep][0] = Info[12];
		vInfo[spawnedcar][WepAmmo][0] = Info[13];
		vInfo[spawnedcar][Wep][1] = Info[14];
		vInfo[spawnedcar][WepAmmo][1] = Info[15];
		vInfo[spawnedcar][Wep][2] = Info[16];
		vInfo[spawnedcar][WepAmmo][2] =Info[17];
        vInfo[spawnedcar][Insurances] = Info[18];
        vInfo[spawnedcar][Fuel] = Info[19];
        vInfo[spawnedcar][X] = vpos[0];
        vInfo[spawnedcar][Y] = vpos[1];
        vInfo[spawnedcar][Z] = vpos[2];
        vInfo[spawnedcar][A] = vpos[3];
        siren[spawnedcar] = false;
        vInfo[spawnedcar][Locked] = 1; // set vehicle to locked
		SetVehicleZAngle(spawnedcar, vInfo[spawnedcar][A]);
		VehicleSpawned[spawnedcar] = true;
		SetVehicleParamsEx(spawnedcar, 0, 0, 0, 0, 0, 0, 0);
		SetVehicleNumberPlate(spawnedcar, vInfo[spawnedcar][Plate]);
		//printf("Loaded vehicle id %d", Info[0]);
	}
	mysql_free_result();
	return 1;
}


LoadVehicle(vehicleid)
{
	format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = '%d'", vehicleid);
	mysql_query(_query);
	mysql_store_result();
	new temp[128], Float:vpos[4], Info[20], plate[64];
	if(mysql_retrieve_row())
	{
	    mysql_fetch_field_row(temp, "ID"), Info[0] = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), Info[1] = strval(temp);
	    mysql_fetch_field_row(temp, "Owner"), Info[2] = strval(temp);
	    mysql_fetch_field_row(temp, "Locked"), Info[3] = strval(temp);
	    mysql_fetch_field_row(temp, "Faction"), Info[4] = strval(temp);
	    mysql_fetch_field_row(temp, "Job"), Info[5] = strval(temp);
	    mysql_fetch_field_row(temp, "Server"), Info[6] = strval(temp);
	    mysql_fetch_field_row(temp, "Color1"), Info[7] = strval(temp);
	    mysql_fetch_field_row(temp, "Color2"), Info[8] = strval(temp);
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), temp);
	    mysql_fetch_field_row(temp, "Rentable"), Info[10] = strval(temp);
	    mysql_fetch_field_row(temp, "RentPrice"), Info[11] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1"), Info[12] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1Ammo"), Info[13] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2"), Info[14] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2Ammo"), Info[15] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3"), Info[16] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3Ammo"), Info[17] = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), Info[18] = strval(temp);
	    mysql_fetch_field_row(temp, "Fuel"), Info[19] = strval(temp);
		mysql_fetch_field_row(temp, "X"), vpos[0] = floatstr(temp);
		mysql_fetch_field_row(temp, "Y"), vpos[1] = floatstr(temp);
		mysql_fetch_field_row(temp, "Z"), vpos[2] = floatstr(temp);
		mysql_fetch_field_row(temp, "A"), vpos[3] = floatstr(temp);
	}
	if(mysql_num_rows())
	{
	    new spawnedcar = CreateVehicle(Info[1], vpos[0], vpos[1], vpos[2], vpos[3], Info[7], Info[8], -1);
		vInfo[spawnedcar][ID] = Info[0];
		vInfo[spawnedcar][Model] = Info[1];
		vInfo[spawnedcar][Owner] = Info[2];
		vInfo[spawnedcar][Locked] = 0;
		vInfo[spawnedcar][Faction] = Info[4];
		vInfo[spawnedcar][Job] = Info[5];
		vInfo[spawnedcar][Server] = Info[6];
		vInfo[spawnedcar][Color1] = Info[7];
		vInfo[spawnedcar][Color2] = Info[8];
		format(vInfo[spawnedcar][Plate], 64, plate);
		vInfo[spawnedcar][Rentable] = Info[10];
		vInfo[spawnedcar][RentPrice] = Info[11];
		vInfo[spawnedcar][Wep][0] = Info[12];
		vInfo[spawnedcar][WepAmmo][0] = Info[13];
		vInfo[spawnedcar][Wep][1] = Info[14];
		vInfo[spawnedcar][WepAmmo][1] = Info[15];
		vInfo[spawnedcar][Wep][2] = Info[16];
		vInfo[spawnedcar][WepAmmo][2] =Info[17];
        vInfo[spawnedcar][Insurances] = Info[18];
        vInfo[spawnedcar][Fuel] = Info[19];
        vInfo[spawnedcar][X] = vpos[0];
        vInfo[spawnedcar][Y] = vpos[1];
        vInfo[spawnedcar][Z] = vpos[2];
        vInfo[spawnedcar][A] = vpos[3];
        siren[spawnedcar] = false;
        vInfo[spawnedcar][Locked] = 1; // set vehicle to locked
		SetVehicleZAngle(spawnedcar, vInfo[spawnedcar][A]);
		VehicleSpawned[spawnedcar] = true;
		SetVehicleParamsEx(spawnedcar, 0, 0, 0, 0, 0, 0, 0);
		SetVehicleNumberPlate(spawnedcar, vInfo[spawnedcar][Plate]);
	}
	mysql_free_result();
	return 1;
}

SpawnVehicle(playerid, slot)
{
	if(slot > 3 || slot < 1)
		return CPF(playerid, COLOR_GRAY, "Invalid slot ID.");

	if(slot == 1 && cInfo[playerid][cVehicle1] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You don't have a vehicle in slot 1.");

	if(slot == 2 && cInfo[playerid][cVehicle2] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You don't have a vehicle in slot 2.");

	if(slot == 3 && cInfo[playerid][cVehicle3] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You don't have a vehicle in slot 3.");

	switch(slot)
	{
	    case 1: format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = %d", cInfo[playerid][cVehicle1]);
	    case 2: format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = %d", cInfo[playerid][cVehicle2]);
	    case 3: format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = %d", cInfo[playerid][cVehicle3]);
	}
	mysql_query(_query);
	mysql_store_result();
	new temp[128], Float:vpos[4], Info[20], plate[64];
	if(mysql_retrieve_row()) {

	    mysql_fetch_field_row(temp, "ID"), Info[0] = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), Info[1] = strval(temp);
	    mysql_fetch_field_row(temp, "Owner"), Info[2] = strval(temp);
	    mysql_fetch_field_row(temp, "Locked"), Info[3] = strval(temp);
	    mysql_fetch_field_row(temp, "Faction"), Info[4] = strval(temp);
	    mysql_fetch_field_row(temp, "Job"), Info[5] = strval(temp);
	    mysql_fetch_field_row(temp, "Server"), Info[6] = strval(temp);
	    mysql_fetch_field_row(temp, "Color1"), Info[7] = strval(temp);
	    mysql_fetch_field_row(temp, "Color2"), Info[8] = strval(temp);
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), temp);
	    mysql_fetch_field_row(temp, "Rentable"), Info[10] = strval(temp);
	    mysql_fetch_field_row(temp, "RentPrice"), Info[11] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1"), Info[12] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon1Ammo"), Info[13] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2"), Info[14] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon2Ammo"), Info[15] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3"), Info[16] = strval(temp);
	    mysql_fetch_field_row(temp, "Weapon3Ammo"), Info[17] = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), Info[18] = strval(temp);
	    mysql_fetch_field_row(temp, "Fuel"), Info[19] = strval(temp);
		mysql_fetch_field_row(temp, "X"), vpos[0] = floatstr(temp);
		mysql_fetch_field_row(temp, "Y"), vpos[1] = floatstr(temp);
		mysql_fetch_field_row(temp, "Z"), vpos[2] = floatstr(temp);
		mysql_fetch_field_row(temp, "A"), vpos[3] = floatstr(temp);
	}
	new Float:vehPos[3], count = 0;
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
	    if(!IsValidVehicle(i)) continue;
		GetVehiclePos(i, vehPos[0], vehPos[1], vehPos[2]);
		if(IsPointInRangeOfPoint(vehPos[0], vehPos[1], vehPos[2], vpos[0], vpos[1], vpos[2], 4.0))
		{
		    count++;
		    CPF(playerid, COLOR_RED, "Something is blocking the spawning path of your vehicle, please try again later!");
		    return 1;
		}
	}
	if(mysql_num_rows())
	{
	    new spawnedcar = CreateVehicle(Info[1], vpos[0], vpos[1], vpos[2], vpos[3], Info[7], Info[8], -1);
		vInfo[spawnedcar][ID] = Info[0];
		vInfo[spawnedcar][Model] = Info[1];
		vInfo[spawnedcar][Owner] = Info[2];
		vInfo[spawnedcar][Locked] = 0;
		vInfo[spawnedcar][Faction] = Info[4];
		vInfo[spawnedcar][Job] = Info[5];
		vInfo[spawnedcar][Server] = Info[6];
		vInfo[spawnedcar][Color1] = Info[7];
		vInfo[spawnedcar][Color2] = Info[8];
		format(vInfo[spawnedcar][Plate], 64, plate);
		vInfo[spawnedcar][Rentable] = Info[10];
		vInfo[spawnedcar][RentPrice] = Info[11];
		vInfo[spawnedcar][Wep][0] = Info[12];
		vInfo[spawnedcar][WepAmmo][0] = Info[13];
		vInfo[spawnedcar][Wep][1] = Info[14];
		vInfo[spawnedcar][WepAmmo][1] = Info[15];
		vInfo[spawnedcar][Wep][2] = Info[16];
		vInfo[spawnedcar][WepAmmo][2] =Info[17];
        vInfo[spawnedcar][Insurances] = Info[18];
        vInfo[spawnedcar][Fuel] = Info[19];
        vInfo[spawnedcar][X] = vpos[0];
        vInfo[spawnedcar][Y] = vpos[1];
        vInfo[spawnedcar][Z] = vpos[2];
        vInfo[spawnedcar][A] = vpos[3];
		Engine[spawnedcar] = false;
        siren[spawnedcar] = false;
		SetVehicleZAngle(spawnedcar, vInfo[spawnedcar][A]);
		VehicleSpawned[spawnedcar] = true;
		SetVehicleParamsEx(spawnedcar, 0, 0, 0, 0, 0, 0, 0);
		SetVehicleNumberPlate(spawnedcar, vInfo[spawnedcar][Plate]);
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Vehicle %d (%s) has been spawned and marked on the map.", slot, VehicleNames[vInfo[spawnedcar][Model]-400]);
		SetPlayerCheckpoint(playerid, vInfo[spawnedcar][X], vInfo[spawnedcar][Y], vInfo[spawnedcar][Z], 5.0);
		ShowCP[playerid] = true;
	}
	else
	{
	    switch(slot)
	    {
	        case 1: CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Could not spawn vehicle (SQLID: %02d), Contact an Administrator.", cInfo[playerid][cVehicle1]);
	        case 2: CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Could not spawn vehicle (SQLID: %02d), Contact an Administrator.", cInfo[playerid][cVehicle2]);
	        case 3: CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Could not spawn vehicle (SQLID: %02d), Contact an Administrator.", cInfo[playerid][cVehicle3]);
	    }
	}
	mysql_free_result();
	return 1;
}

ShowVehicleList(playerid)
{
	new temp[128], plate[64], model, id, insurances;
    format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = '%d' AND `Owner` = '%d'", cInfo[playerid][cVehicle1], cInfo[playerid][SQLID]);
    mysql_query(_query);
    mysql_store_result();
    if(mysql_retrieve_row()) {
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), "%s", temp);
	    mysql_fetch_field_row(temp, "ID"), id = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), model = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), insurances = strval(temp);
	}
    if(cInfo[playerid][cVehicle1] != 0) {
		CPF(playerid, COLOR_FADE1 , "1. ID[%02d], Model: [%s][%d], Plate: [%s], Insurances: [%d], Spawned: [%s]", id, VehicleNames[model - 400], model, plate, insurances , IsVehicleSpawned(cInfo[playerid][cVehicle1]) ? ("Yes") : ("No"));
	}
	else CPF(playerid, COLOR_FADE1, "1. Empty");
	mysql_free_result();
    format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = '%d' AND `Owner` = '%d'", cInfo[playerid][cVehicle2], cInfo[playerid][SQLID]);
    mysql_query(_query);
    mysql_store_result();
    if(mysql_retrieve_row()) {
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), "%s", temp);
	    mysql_fetch_field_row(temp, "ID"), id = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), model = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), insurances = strval(temp);
    }
    if(cInfo[playerid][cVehicle2] != 0) {
		CPF(playerid, COLOR_FADE1 , "2. ID[%02d], Model: [%s][%d], Plate: [%s], Insurances: [%d], Spawned: [%s]", id, VehicleNames[model - 400], model, plate, insurances , IsVehicleSpawned(cInfo[playerid][cVehicle2]) ? ("Yes") : ("No"));
	}
	else CPF(playerid, COLOR_FADE1, "2. Empty");
	mysql_free_result();
    format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = '%d' AND `Owner` = '%d'", cInfo[playerid][cVehicle3], cInfo[playerid][SQLID]);
    mysql_query(_query);
    mysql_store_result();
    if(mysql_retrieve_row()) {
	    mysql_fetch_field_row(temp, "Plate"), format(plate, sizeof(plate), "%s", temp);
	    mysql_fetch_field_row(temp, "ID"), id = strval(temp);
	    mysql_fetch_field_row(temp, "Model"), model = strval(temp);
	    mysql_fetch_field_row(temp, "Insurances"), insurances = strval(temp);
    }
    if(cInfo[playerid][cVehicle3] != 0) {
		CPF(playerid, COLOR_FADE1 , "3. ID[%02d], Model: [%s][%d], Plate: [%s], Insurances: [%d], Spawned: [%s]", id, VehicleNames[model - 400], model, plate, insurances , IsVehicleSpawned(cInfo[playerid][cVehicle3]) ? ("Yes") : ("No"));
	}
	else CPF(playerid, COLOR_FADE1, "3. Empty");
	mysql_free_result();
	return 1;
}

IsVehicleSpawned(vehid)
{
    for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
    {
        if(!IsValidVehicle(i)) continue;
        if(vInfo[i][ID] != vehid) continue;
        else
            return true;
    }
	return false;
}

ClearVehStats(vehid)
{
	vInfo[vehid][ID] = 0;
	vInfo[vehid][Owner] = 0;
	vInfo[vehid][Locked] = 0;
	vInfo[vehid][Faction] = 0;
	vInfo[vehid][Job] = 0;
	vInfo[vehid][Server] =0;
	vInfo[vehid][Rentable] = 0;
	vInfo[vehid][RentPrice] = 0;
	vInfo[vehid][Color1] = 0;
	vInfo[vehid][Color2] = 0;
	format(vInfo[vehid][Plate], 12, "None");
	vInfo[vehid][Wep][0] = 0;
	vInfo[vehid][WepAmmo][0] = 0;
	vInfo[vehid][Wep][1] = 0;
	vInfo[vehid][WepAmmo][1] = 0;
	vInfo[vehid][Wep][2] = 0;
	vInfo[vehid][WepAmmo][2] = 0;
	vInfo[vehid][Insurances] = 0;
	vInfo[vehid][Fuel] = 0;
	VehicleSpawned[vehid] = false;
	KillTimer(EngineTimer[vehid]);
	return 1;
}

stock SaveVehicle(vehid)
{
	format(_query, sizeof(_query), "UPDATE `vehicles` SET `Owner`=%d,`Locked`=%d,`Faction`=%d,`Job`=%d,`Server`=%d,`Color1`=%d,`Color2`=%d,`Rentable`=%d,`RentPrice`=%d,`Weapon1`=%d,`Weapon1Ammo`=%d WHERE `ID` = %d",
	vInfo[vehid][Owner],
	vInfo[vehid][Locked],
	vInfo[vehid][Faction],
	vInfo[vehid][Job],
	vInfo[vehid][Server],
	vInfo[vehid][Color1],
	vInfo[vehid][Color2],
	vInfo[vehid][Rentable],
	vInfo[vehid][RentPrice],
	vInfo[vehid][Wep][0],
	vInfo[vehid][WepAmmo][0],
	vInfo[vehid][ID]);
	mysql_query(_query);
	format(_query, sizeof(_query), "UPDATE `vehicles` SET `Weapon2`=%d,`Weapon2Ammo`=%d,`Weapon3`=%d,`Weapon3Ammo`=%d,`Insurances`=%d,`Fuel`=%d, `X` = %f, `Y` = %f, `Z` = %f, `A` = %f WHERE `ID` = %d",
	vInfo[vehid][Wep][1],
	vInfo[vehid][WepAmmo][1],
	vInfo[vehid][Wep][2],
    vInfo[vehid][WepAmmo][2],
    vInfo[vehid][Insurances],
    vInfo[vehid][Fuel],
	vInfo[vehid][X],
	vInfo[vehid][Y],
	vInfo[vehid][Z],
	vInfo[vehid][A],
	vInfo[vehid][ID]);
	mysql_query(_query);
	return 1;
}

CreateFaction(playerid, name[], type)
{
	format(_query, sizeof _query, "SELECT * FROM `factions`");
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows() > 20) return CPF(playerid, COLOR_GRAY, "You have crossed through the limit of 20 factions.");
	format(_query, sizeof(_query), "INSERT INTO `factions`(`Name`, `Type`) VALUES ('%s', '%d')", name, type);
	mysql_query(_query);
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Faction \"%s\" (Type: %d) has been created and listed under ID %d.", name, type, mysql_insert_id());
	new id = mysql_insert_id();
	fInfo[id][ID] = id;
	format(fInfo[id][Name], 128, name);
	fInfo[id][Chat] = 1;
	fInfo[id][JoinRank] = 1;
	fInfo[id][Type] = type;
	fInfo[id][OnlineMembers] = 0;
	fInfo[id][TotalMembers] = 0;
	format(fInfo[id][Rank1], 128, "None");
	format(fInfo[id][Rank2], 128, "None");
	format(fInfo[id][Rank3], 128, "None");
	format(fInfo[id][Rank4], 128, "None");
	format(fInfo[id][Rank5], 128, "None");
	format(fInfo[id][Rank6], 128, "None");
	format(fInfo[id][Rank7], 128, "None");
	format(fInfo[id][Rank8], 128, "None");
	format(fInfo[id][Rank9], 128, "None");
	format(fInfo[id][Rank10], 128, "None");
	format(fInfo[id][Rank11], 128, "None");
	format(fInfo[id][Rank12], 128, "None");
	format(fInfo[id][Rank13], 128, "None");
	format(fInfo[id][Rank14], 128, "None");
	format(fInfo[id][Rank15], 128, "None");
	mysql_free_result();
	return 1;
}

SaveFactions()
{
    new count;
    for(new i = 1;i < MAX_FACTIONS;i++)
    {
        if(fInfo[i][ID] <= 0) continue;
        format(_query, sizeof(_query), "SELECT * FROM `factions` WHERE `ID` = '%d'", i);
        mysql_query(_query);
        mysql_store_result();
        if(mysql_num_rows())
        {
            format(_query, sizeof(_query), "UPDATE `factions` SET `Name`='%s',`Chat`='%d',`JoinRank`='%d', `Type`='%d',`OnlineMembers`='0',`TotalMembers`='%d' WHERE `ID` = '%d'",
            fInfo[i][Name], fInfo[i][Chat], fInfo[i][JoinRank], fInfo[i][Type], fInfo[i][TotalMembers], i);
            mysql_query(_query);
            format(_query, sizeof(_query), "UPDATE `factions` SET `Rank1`='%s',`Rank2`='%s',`Rank3`='%s',`Rank4`='%s',`Rank5`='%s',`Rank6`='%s',`Rank7`='%s',`Rank8`='%s',`Rank9`='%s',`Rank10`='%s',`Rank11`='%s',`Rank12`='%s',`Rank13`='%s',`Rank14`='%s',`Rank15`='%s' WHERE `ID` = '%d'",
            fInfo[i][Rank1], fInfo[i][Rank2], fInfo[i][Rank3], fInfo[i][Rank4], fInfo[i][Rank5], fInfo[i][Rank6], fInfo[i][Rank7], fInfo[i][Rank8], fInfo[i][Rank9], fInfo[i][Rank10],
            fInfo[i][Rank11], fInfo[i][Rank12], fInfo[i][Rank13], fInfo[i][Rank14], fInfo[i][Rank15], i);
            mysql_query(_query);
            count++;
        }
        mysql_free_result();
    }
    return 1;
}

SaveInteriors()
{
    new count;
    for(new i = 1;i < MAX_INTERIORS;i++)
    {
		if(iInfo[i][ID] <= 0) continue;
		format(_query, sizeof(_query), "SELECT * FROM `interiors` WHERE `ID` = '%d'", i);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
		    format(_query, sizeof(_query), "UPDATE `interiors` SET `outX`  = '%f', `outY`  = '%f', `outZ`  = '%f', `inX`  = '%f', `inY`  = '%f', `inZ`  = '%f' WHERE `ID` = '%d'", iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ], iInfo[i][inX], iInfo[i][inY], iInfo[i][inZ], i);
		    mysql_query(_query);
		    format(_query, sizeof(_query), "UPDATE `interiors` SET `InteriorID`='%d',`outsideText`='%s',`Locked`='%d' WHERE `ID` = '%d'", iInfo[i][InteriorID], iInfo[i][outsideText], iInfo[i][Locked], i);
		    mysql_query(_query);
			count++;
		}
		mysql_free_result();
    }
    return 1;
}

LoadFactions()
{
	new temp[128], i;
	format(_query, sizeof(_query), "SELECT * FROM `factions`");
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
			mysql_fetch_field_row(temp, "ID");
			i = strval(temp);
		 	fInfo[i][ID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Name"), format(fInfo[i][Name], 128, temp);
	    	mysql_fetch_field_row(temp, "Chat"), fInfo[i][Chat] = strval(temp);
	    	mysql_fetch_field_row(temp, "JoinRank"), fInfo[i][JoinRank] = strval(temp);
	    	mysql_fetch_field_row(temp, "Type"), fInfo[i][Type] = strval(temp);
	    	mysql_fetch_field_row(temp, "OnlineMembers"), fInfo[i][OnlineMembers] = strval(temp);
	    	mysql_fetch_field_row(temp, "TotalMembers"), fInfo[i][TotalMembers] = strval(temp);
	    	mysql_fetch_field_row(temp, "Rank1"), format(fInfo[i][Rank1], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank2"), format(fInfo[i][Rank2], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank3"), format(fInfo[i][Rank3], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank4"), format(fInfo[i][Rank4], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank5"), format(fInfo[i][Rank5], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank6"), format(fInfo[i][Rank6], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank7"), format(fInfo[i][Rank7], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank8"), format(fInfo[i][Rank8], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank9"), format(fInfo[i][Rank9], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank10"), format(fInfo[i][Rank10], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank11"), format(fInfo[i][Rank11], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank12"), format(fInfo[i][Rank12], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank13"), format(fInfo[i][Rank13], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank14"), format(fInfo[i][Rank14], 128, temp);
	    	mysql_fetch_field_row(temp, "Rank15"), format(fInfo[i][Rank15], 128, temp);
		}
	}
	mysql_free_result();
	return 1;
}

LoadGroups()
{
	new temp[128], i;
	format(_query, sizeof(_query), "SELECT * FROM `oocgroups`");
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
			mysql_fetch_field_row(temp, "ID");
			i = strval(temp);
		 	gInfo[i][ID] = strval(temp);
		    mysql_fetch_field_row(temp, "CreateDate"), format(gInfo[i][CreationDate], 64, temp);
		    mysql_fetch_field_row(temp, "Taken"), gInfo[i][Taken] = strval(temp);
  			mysql_fetch_field_row(temp, "Chat"), gInfo[i][Chat] = strval(temp);
		}
	}
	mysql_free_result();
	return 1;
}

CreateHouse(playerid, interiorid, price)
{
	new Float:x, Float:y, Float:z, address[MAX_ZONE_NAME], address2[128];
	GetPlayerPos(playerid, x, y, z);
	GetPlayer2DZone(playerid, address, MAX_ZONE_NAME);
	format(_query, sizeof(_query), "INSERT INTO `houses`(`Xin`, `Yin`, `Zin`, `Xout`, `Yout`, `Zout`, `Interior`) VALUES ('%f', '%f', '%f', '%f', '%f', '%f', '%d')",
	Interior[interiorid][INT_POS][0], Interior[interiorid][INT_POS][1], Interior[interiorid][INT_POS][2], x, y, z, Interior[interiorid][INT_ID]);
	mysql_query(_query);
	new id = mysql_insert_id();
	format(address2, 128, "%s %d", address, id+100);
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Houses %d created with the price of $%d (%s)",  id, price, Interior[interiorid][INT_NAME]);
	format(_query, sizeof(_query), "UPDATE `houses` SET `Price`='%d', `VirtualWorld`='%d',`Address`='%s' WHERE `ID` = '%d' ", price, id, address2, id);
	mysql_query(_query);
	LoadHouse(id);
	UpdateHouse(id);
	return 1;
}

CreateBizz(playerid, _interiorid, _price, _type)
{
	new Float:x, Float:y, Float:z, address[MAX_ZONE_NAME], address2[128];
	GetPlayerPos(playerid, x, y, z);
	GetPlayer2DZone(playerid, address, MAX_ZONE_NAME);
	format(_query, sizeof(_query), "INSERT INTO `bizzes`(`Xin`, `Yin`, `Zin`, `Xout`, `Yout`, `Zout`, `Interior`) VALUES ('%f', '%f', '%f', '%f', '%f', '%f', '%d')",
	bInterior[_interiorid][INT_POS][0], bInterior[_interiorid][INT_POS][1], bInterior[_interiorid][INT_POS][2], x, y, z, bInterior[_interiorid][INT_ID]);
	mysql_query(_query);
	new id = mysql_insert_id();
	format(address2, 128, "%s %d", address, id+100);
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Business %d created with the price of $%d (%s) (%s)",  id, _price, bInterior[_interiorid][INT_NAME], GetBizName(_type));
	format(_query, sizeof(_query), "UPDATE `bizzes` SET `Price`='%d', `VirtualWorld`='%d', `Address` = '%s', `Type` = '%d' WHERE `ID` = '%d' ", _price, id, address2, _type, id);
	mysql_query(_query);
	LoadBizz(id);
	UpdateBizz(id);
	return 1;
}

LoadAllBizz()
{
	new temp[256], str[516];
	mysql_query("SELECT * FROM `bizzes`");
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), bInfo[strval(temp)][ID] = strval(temp);
	    	new bizz_num = strval(temp);
	    	mysql_fetch_field_row(temp, "Owner"), bInfo[bizz_num][Owner] = strval(temp);
	    	mysql_fetch_field_row(temp, "Name"), format(bInfo[bizz_num][Name], 128, temp);
	    	mysql_fetch_field_row(temp, "Address"), format(bInfo[bizz_num][Address], 64, temp);
	    	mysql_fetch_field_row(temp, "Xin"), bInfo[bizz_num][X_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yin"), bInfo[bizz_num][Y_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zin"), bInfo[bizz_num][Z_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Xout"), bInfo[bizz_num][X_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yout"), bInfo[bizz_num][Y_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zout"), bInfo[bizz_num][Z_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Interior"), bInfo[bizz_num][INT] = strval(temp);
	    	mysql_fetch_field_row(temp, "Price"), bInfo[bizz_num][Price] = strval(temp);
	    	mysql_fetch_field_row(temp, "Type"), bInfo[bizz_num][Type] = strval(temp);
	    	mysql_fetch_field_row(temp, "Bank"), bInfo[bizz_num][Bank] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), bInfo[bizz_num][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio"), bInfo[bizz_num][Radio] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "Products"), bInfo[bizz_num][Products] = strval(temp);
	    	mysql_fetch_field_row(temp, "Locked"), bInfo[bizz_num][Locked] = strval(temp);
	    	mysql_fetch_field_row(temp, "Fee"), bInfo[bizz_num][Fee] = strval(temp);
	    	format(str, sizeof(str), "{FFFFFF}[{0072ff}Business"COL_WHITE"]");
	    	//printf("Loaded bizz ID %d", bizz_num);
	    	bInfo[bizz_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
			if(bInfo[bizz_num][Owner] == 0)
			{
	   			bInfo[bizz_num][Pickup] = CreateDynamicPickup(1272, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 5.0);
			}
			else
			{
				bInfo[bizz_num][Pickup] = CreateDynamicPickup(1318, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 5.0);
			}
		}
	}
	mysql_free_result();
	return 1;
}

LoadBizz(bizz_num)
{
	new temp[256], str[516], name[25];
	format(_query, sizeof(_query), "SELECT * FROM `bizzes` WHERE `ID` = '%d' ", bizz_num);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		if(mysql_retrieve_row()) {
	    	mysql_fetch_field_row(temp, "ID"), bInfo[bizz_num][ID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Owner"), bInfo[bizz_num][Owner] = strval(temp);
	    	mysql_fetch_field_row(temp, "Name"), format(bInfo[bizz_num][Name], 128, temp);
	    	mysql_fetch_field_row(temp, "Address"), format(bInfo[bizz_num][Address], 64, temp);
	    	mysql_fetch_field_row(temp, "Xin"), bInfo[bizz_num][X_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yin"), bInfo[bizz_num][Y_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zin"), bInfo[bizz_num][Z_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Xout"), bInfo[bizz_num][X_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yout"), bInfo[bizz_num][Y_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zout"), bInfo[bizz_num][Z_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Interior"), bInfo[bizz_num][INT] = strval(temp);
	    	mysql_fetch_field_row(temp, "Price"), bInfo[bizz_num][Price] = strval(temp);
	    	mysql_fetch_field_row(temp, "Type"), bInfo[bizz_num][Type] = strval(temp);
	    	mysql_fetch_field_row(temp, "Bank"), bInfo[bizz_num][Bank] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), bInfo[bizz_num][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio"), bInfo[bizz_num][Radio] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "Products"), bInfo[bizz_num][Products] = strval(temp);
	    	mysql_fetch_field_row(temp, "Locked"), bInfo[bizz_num][Locked] = strval(temp);
	    	mysql_fetch_field_row(temp, "Fee"), bInfo[bizz_num][Fee] = strval(temp);
		}
		format(str, sizeof(str), "{FFFFFF}[{0072ff}Business"COL_WHITE"]");
    	bInfo[bizz_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", bInfo[bizz_num][Owner]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
			if(mysql_retrieve_row())
			{
		    	mysql_fetch_field_row(temp, "Name"), format(bInfo[bizz_num][OwnerName], 25, temp);
			}
		}
		if(bInfo[bizz_num][Owner] == 0)
		{
   			bInfo[bizz_num][Pickup] = CreateDynamicPickup(1272, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 5.0);
		}
		else
		{
			format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", bInfo[bizz_num][Owner]);
			mysql_query(_query);
			mysql_store_result();
			if(mysql_num_rows())
			{
				if(mysql_retrieve_row()) {
			    	mysql_fetch_field_row(temp, "Name"), format(name, 25, temp);
				}
			}
			bInfo[bizz_num][Pickup] = CreateDynamicPickup(1318, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 5.0);
		}
	}
	mysql_free_result();
	return 1;
}

public OnQueryError(errorid, error[], resultid, extraid, callback[], query[], connectionHandle)
{
	printf("MYSQL WARNING OCCURED: [%d] %s", errorid, error);
	printf("[Query] %s", query);
	return 1;
}

LoadAllSafes()
{
	new temp[256];
	mysql_query("SELECT * FROM `safes`");
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), Safe[strval(temp)][ID] = strval(temp);
	    	new id = strval(temp);
	    	mysql_fetch_field_row(temp, "HouseID"), Safe[id][HouseID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Money"), Safe[id][sMoney] = strval(temp);
	    	mysql_fetch_field_row(temp, "Code"), Safe[id][Code] = strval(temp);
	    	Safe[id][sLocked] = true;
		}
	}
	mysql_free_result();
	return 1;
}

LoadPlayerBag(playerid)
{
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        Bag[playerid][bagItemID][i] = 0;
        Bag[playerid][bagItem][i] = 0;
        Bag[playerid][bagItemAmount][i] = 0;
        Bag[playerid][bagItemLoaded][i] = 0;
        Bag[playerid][bagItemLoadAmount][i] = 0;
        Bag[playerid][bagItemServer][i] = 0;
    }
	new temp[256], id = 0;
	format(_query, sizeof(_query), "SELECT * FROM `bagitems` WHERE `Owner` = %d", cInfo[playerid][SQLID]);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
		    mysql_fetch_field_row(temp, "ID"), Bag[playerid][bagItemID][id] = strval(temp);
	    	mysql_fetch_field_row(temp, "Item"), Bag[playerid][bagItem][id] = strval(temp);
	    	mysql_fetch_field_row(temp, "ItemAmount"), Bag[playerid][bagItemAmount][id] = strval(temp);
	    	mysql_fetch_field_row(temp, "ItemLoaded"), Bag[playerid][bagItemLoaded][id] = strval(temp);
	    	mysql_fetch_field_row(temp, "ItemLoadAmount"), Bag[playerid][bagItemLoadAmount][id] = strval(temp);
	    	mysql_fetch_field_row(temp, "ItemServer"), Bag[playerid][bagItemServer][id] = strval(temp);
			id ++;
		}
	}
	mysql_free_result();
	return 1;
}

LoadAllFurniture()
{
	new temp[256];
	mysql_query("SELECT * FROM `furnitures`");
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), Furn[strval(temp)][ID] = strval(temp);
	    	new id = strval(temp);
	    	mysql_fetch_field_row(temp, "ObjectID"), Furn[id][ObjectID] = strval(temp);
	    	mysql_fetch_field_row(temp, "ObjectName"), format(Furn[id][ObjectName], 128, temp);
	    	mysql_fetch_field_row(temp, "HouseID"), Furn[id][HouseID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Authority"), Furn[id][Authority] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), Furn[id][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Interior"), Furn[id][fINT] = strval(temp);
	    	mysql_fetch_field_row(temp, "fX"), Furn[id][pos][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fY"), Furn[id][pos][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fZ"), Furn[id][pos][2] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotX"), Furn[id][rot][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotY"), Furn[id][rot][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotZ"), Furn[id][rot][2] = floatstr(temp);
	    	Furn[id][Locked] = 0;
	    	Furn[id][Opened] = 0;
			Furn[id][Object] = CreateDynamicObject(Furn[id][ObjectID], Furn[id][pos][0], Furn[id][pos][1], Furn[id][pos][2], Furn[id][rot][0], Furn[id][rot][1], Furn[id][rot][2], Furn[id][VirtualWorld], Furn[id][fINT], -1);
			if(Furn[id][Authority] == 2)
			{
			    new param = id;
				new saf = GetSafeID(Furn[param][HouseID]);
				DestroyDynamic3DTextLabel(Safe[Furn[param][HouseID]][sLabel]);
			    format(gString, sizeof(gString), "{ffffff}Safe {b5c8b6}%d\n%s", Safe[saf][ID], Safe[saf][sLocked] ? ("{c62222}Locked") : ("{39c622}Unlocked"));
			    Safe[Furn[param][HouseID]][sLabel] = CreateDynamic3DTextLabel(gString, 0x008080FF, Furn[param][pos][0], Furn[param][pos][1], Furn[param][pos][2]+0.8, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, Furn[param][VirtualWorld], -1, -1, 100.0);
			}
			//printf("Furn Object: %d | %d", Furn[id][Object], Furn[id][Authority]);
		}
	}
	mysql_free_result();
	return 1;
}

/*LoadFurniture(id)
{
	new temp[256];
	format(_query, sizeof(_query), "SELECT * FROM `furnitures` WHERE `ID` = '%d'", id);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		if(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), Furn[id][ID] = strval(temp);
	    	mysql_fetch_field_row(temp, "ObjectID"), Furn[id][ObjectID] = strval(temp);
	    	mysql_fetch_field_row(temp, "ObjectName"), format(Furn[id][ObjectName], 128, temp);
	    	mysql_fetch_field_row(temp, "HouseID"), Furn[id][HouseID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Authority"), Furn[id][Authority] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), Furn[id][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Interior"), Furn[id][fINT] = strval(temp);
	    	mysql_fetch_field_row(temp, "fX"), Furn[id][pos][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fY"), Furn[id][pos][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fZ"), Furn[id][pos][2] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotX"), Furn[id][rot][0] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotY"), Furn[id][rot][1] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "fRotZ"), Furn[id][rot][2] = floatstr(temp);
		}
    	Furn[id][Locked] = 0;
    	Furn[id][Opened] = 0;
		Furn[id][Object] = CreateDynamicObject(Furn[id][ObjectID], Furn[id][pos][0], Furn[id][pos][1], Furn[id][pos][2], Furn[id][rot][0], Furn[id][rot][1], Furn[id][rot][2], Furn[id][VirtualWorld], Furn[id][fINT], -1);
		printf("Furn Object: %d | %d", Furn[id][Object], Furn[id][Authority]);
	}
	mysql_free_result();
	return 1;
}*/

LoadAllHouses()
{
	new count, temp[128], str[256];
	mysql_query("SELECT * FROM `houses`");
	mysql_store_result();
	if(mysql_num_rows())
	{
		while(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), hInfo[strval(temp)][ID] = strval(temp);
	    	new house_num = strval(temp);
	    	mysql_fetch_field_row(temp, "Owner"), hInfo[house_num][Owner] = strval(temp);
	    	mysql_fetch_field_row(temp, "Address"), format(hInfo[house_num][Address], 128, temp);
	    	mysql_fetch_field_row(temp, "Xin"), hInfo[house_num][X_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yin"), hInfo[house_num][Y_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zin"), hInfo[house_num][Z_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Xout"), hInfo[house_num][X_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yout"), hInfo[house_num][Y_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zout"), hInfo[house_num][Z_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Interior"), hInfo[house_num][INT] = strval(temp);
	    	mysql_fetch_field_row(temp, "Price"), hInfo[house_num][Price] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), hInfo[house_num][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Rentable"), hInfo[house_num][Rentable] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "RentPrice"), hInfo[house_num][RentPrice] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio"), hInfo[house_num][Radio] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "Locked"), hInfo[house_num][Locked] = strval(temp);
	    	HouseLights[house_num] = false;
	    	//printf("Loaded house ID %d", house_num);
   			count ++;
			format(str, sizeof str, "{FFFFFF}[{07aa0b}Property{FFFFFF}]");
			hInfo[house_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
			if(hInfo[house_num][Owner] <= 0)
			{
				hInfo[house_num][Pickup] = CreateDynamicPickup(1273, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
			}
			else
			{
				hInfo[house_num][Pickup] = CreateDynamicPickup(1318, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
			}
		}
	}
	mysql_free_result();
	return 1;
}

LoadHouse(house_num)
{
	new count, temp[128], str[256], name[25];
	format(_query, sizeof(_query), "SELECT * FROM `houses` WHERE `ID` = '%d' ", house_num);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
		if(mysql_retrieve_row())
		{
	    	mysql_fetch_field_row(temp, "ID"), hInfo[house_num][ID] = strval(temp);
	    	mysql_fetch_field_row(temp, "Owner"), hInfo[house_num][Owner] = strval(temp);
	    	mysql_fetch_field_row(temp, "Address"), format(hInfo[house_num][Address], 128, temp);
	    	mysql_fetch_field_row(temp, "Xin"), hInfo[house_num][X_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yin"), hInfo[house_num][Y_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zin"), hInfo[house_num][Z_IN] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Xout"), hInfo[house_num][X_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Yout"), hInfo[house_num][Y_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Zout"), hInfo[house_num][Z_OUT] = floatstr(temp);
	    	mysql_fetch_field_row(temp, "Interior"), hInfo[house_num][INT] = strval(temp);
	    	mysql_fetch_field_row(temp, "Price"), hInfo[house_num][Price] = strval(temp);
	    	mysql_fetch_field_row(temp, "VirtualWorld"), hInfo[house_num][VirtualWorld] = strval(temp);
	    	mysql_fetch_field_row(temp, "Rentable"), hInfo[house_num][Rentable] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "RentPrice"), hInfo[house_num][RentPrice] = strval(temp);
	    	mysql_fetch_field_row(temp, "Radio"), hInfo[house_num][Radio] = strval(temp) ? 1 : 0;
	    	mysql_fetch_field_row(temp, "Locked"), hInfo[house_num][Locked] = strval(temp);
		}
		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", hInfo[house_num][Owner]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
			if(mysql_retrieve_row())
			{
		    	mysql_fetch_field_row(temp, "Name"), format(hInfo[house_num][OwnerName], 25, temp);
			}
		}
		count ++;
		format(str, sizeof str, "{FFFFFF}[{07aa0b}Property{FFFFFF}]");
		hInfo[house_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
		if(hInfo[house_num][Owner] <= 0)
		{
			hInfo[house_num][Pickup] = CreateDynamicPickup(1273, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
		}
		else
		{
			format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", hInfo[house_num][Owner]);
			mysql_query(_query);
			mysql_store_result();
			if(mysql_num_rows())
			{
				if(mysql_retrieve_row()) {
			    	mysql_fetch_field_row(temp, "Name"), format(name, 25, temp);
				}
			}
			hInfo[house_num][Pickup] = CreateDynamicPickup(1318, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
		}
	}
	mysql_free_result();
	return 1;
}

UpdateHouse(house_num)
{
	new str[256], temp[128];
	DestroyDynamicPickup(hInfo[house_num][Pickup]);
	DestroyDynamic3DTextLabel(hInfo[house_num][Label]);
	format(str, sizeof str, "{FFFFFF}[{07aa0b}Property{FFFFFF}]");
	hInfo[house_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
	if(hInfo[house_num][Owner] == 0)
	{
		hInfo[house_num][Pickup] = CreateDynamicPickup(1273, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
	}
	else
	{
		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", hInfo[house_num][Owner]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
			if(mysql_retrieve_row())
			{
		    	mysql_fetch_field_row(temp, "Name"), format(hInfo[house_num][OwnerName], 25, temp);
			}
		}
        hInfo[house_num][Pickup] = CreateDynamicPickup(1318, 1, hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], 0, -1, -1, 7.0);
	}
	return 1;
}

UpdateBizz(bizz_num)
{
	new str[516], temp[128];
	DestroyDynamicPickup(bInfo[bizz_num][Pickup]);
	DestroyDynamic3DTextLabel(bInfo[bizz_num][Label]);
	format(str, sizeof(str), "{FFFFFF}[{0072ff}Business"COL_WHITE"]");
    bInfo[bizz_num][Label] = CreateDynamic3DTextLabel(str, 0x008080FF, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT]+0.5, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 5.0);
	if(bInfo[bizz_num][Owner] == 0)
	{
		bInfo[bizz_num][Pickup] = CreateDynamicPickup(1272, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 7.0);
	}
	else
	{
		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", bInfo[bizz_num][Owner]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
			if(mysql_retrieve_row()) {
		    	mysql_fetch_field_row(temp, "Name"), format(bInfo[bizz_num][OwnerName], 25, temp);
			}
		}
		bInfo[bizz_num][Pickup] = CreateDynamicPickup(1318, 1, bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], 0, -1, -1, 7.0);
	}
	return 1;
}

SaveSafe(id)
{
    if(mysql_num_rows())
    {
		format(_query, sizeof(_query), "UPDATE `safes` SET `Money` = %d, `Code` = %d WHERE `ID` = %d",
		Safe[id][sMoney], Safe[id][Code], id);
		mysql_query(_query);
	}
	return 1;
}

SaveFurniture(id)
{
    if(mysql_num_rows())
    {
		format(_query, sizeof(_query), "UPDATE `furnitures` SET `fX` = %f, `fY` = %f, `fZ` = %f, `fRotX` = %f, `fRotY` = %f, `fRotZ` = %f WHERE `ID` = %d",
		Furn[id][pos][0], Furn[id][pos][1], Furn[id][pos][2], Furn[id][rot][0], Furn[id][rot][1], Furn[id][rot][2], id);
		mysql_query(_query);
	}
	return 1;
}

SaveHouse(house_num)
{
    if(mysql_num_rows())
    {
		format(_query, sizeof(_query), "UPDATE `houses` SET `Owner`='%d',`Address`='%s',`Xin`='%f', `Yin`='%f',`Zin`='%f',`Xout`='%f',`Yout`='%f',`Zout`='%f' WHERE `ID` = '%d' ",
		hInfo[house_num][Owner], hInfo[house_num][Address], hInfo[house_num][X_IN], hInfo[house_num][Y_IN], hInfo[house_num][Z_IN], hInfo[house_num][X_OUT], hInfo[house_num][Y_OUT], hInfo[house_num][Z_OUT], house_num);
		mysql_query(_query);
		format(_query, sizeof(_query), "UPDATE `houses` SET `Price` = '%d', `Interior`='%d',`Rentable`='%d',`RentPrice`='%d',`Radio`='%d',`Locked`='%d' WHERE `ID` = '%d' ",
		hInfo[house_num][Price], hInfo[house_num][INT], hInfo[house_num][Rentable], hInfo[house_num][RentPrice], hInfo[house_num][Radio], hInfo[house_num][Locked], house_num);
		mysql_query(_query);
	}
	return 1;
}

SaveBizz(bizz_num)
{
	format(_query, sizeof(_query), "UPDATE `bizzes` SET `Owner`='%d',`Address`='%s',`Xin`='%f', `Yin`='%f',`Zin`='%f',`Xout`='%f',`Yout`='%f',`Zout`='%f' WHERE `ID` = '%d' ",
	bInfo[bizz_num][Owner], bInfo[bizz_num][Address], bInfo[bizz_num][X_IN], bInfo[bizz_num][Y_IN], bInfo[bizz_num][Z_IN], bInfo[bizz_num][X_OUT], bInfo[bizz_num][Y_OUT], bInfo[bizz_num][Z_OUT], bizz_num);
	mysql_query(_query);

	format(_query, sizeof(_query), "UPDATE `bizzes` SET `Price`='%d', `Interior`='%d',`Radio`='%d',`Name`='%s',`Type`='%d',`Products`='%d',`Locked`='%d',`Fee`='%d' WHERE `ID` = '%d' ",
	bInfo[bizz_num][Price], bInfo[bizz_num][INT], bInfo[bizz_num][Radio], bInfo[bizz_num][Name], bInfo[bizz_num][Type], bInfo[bizz_num][Products],  bInfo[bizz_num][Locked], bInfo[bizz_num][Fee], bizz_num);
	mysql_query(_query);
	return 1;
}

DeleteBizz(playerid, bizz_num)
{
    format(_query, sizeof(_query), "SELECT * FROM `bizzes` WHERE `ID`='%d'  ", bizz_num);
    mysql_query(_query), mysql_store_result();
    if(mysql_num_rows())
    {
	    format(_query, sizeof(_query), "DELETE * FROM `bizzes` WHERE `ID` = '%d'  ", bizz_num);
	    mysql_query(_query);
	    DestroyDynamicPickup(bInfo[bizz_num][Pickup]);
	    DestroyDynamicCP(bInfo[bizz_num][Checkpoint]);
	    DestroyDynamic3DTextLabel(bInfo[bizz_num][Label]);
	    bInfo[bizz_num][X_IN] = 0.0;
	    bInfo[bizz_num][Y_IN] = 0.0;
	    bInfo[bizz_num][Z_IN] = 0.0;
	    bInfo[bizz_num][X_OUT] = 0.0;
	    bInfo[bizz_num][Y_OUT] = 0.0;
	    bInfo[bizz_num][Z_OUT] = 0.0;
	    bInfo[bizz_num][Type] = 0;
	    bInfo[bizz_num][Owner] = 0;
		format(bInfo[bizz_num][Address], 128, "None");
		format(bInfo[bizz_num][Name], 128, "None");
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Business ID %d was deleted from database", bizz_num);
	}
}

DeleteHouse(playerid, house_num)
{
    format(_query, sizeof(_query), "SELECT * FROM `houses` WHERE `ID`='%d'  ", house_num);
    mysql_query(_query), mysql_store_result();
    if(mysql_num_rows())
    {
	    format(_query, sizeof(_query), "DELETE * FROM `houses` WHERE `ID` = '%d'  ", house_num);
	    mysql_query(_query);
	    DestroyDynamicPickup(hInfo[house_num][Pickup]);
	    DestroyDynamicCP(hInfo[house_num][Checkpoint]);
	    DestroyDynamic3DTextLabel(hInfo[house_num][Label]);
	    hInfo[house_num][X_IN] = 0.0;
	    hInfo[house_num][Y_IN] = 0.0;
	    hInfo[house_num][Z_IN] = 0.0;
	    hInfo[house_num][X_OUT] = 0.0;
	    hInfo[house_num][Y_OUT] = 0.0;
	    hInfo[house_num][Z_OUT] = 0.0;
	    hInfo[house_num][Owner] = 0;
		format(hInfo[house_num][Address], 128, "None");
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" House ID %d was deleted from database", house_num);
	}
}

public UpdatePizzaTextdraw(playerid, sec)
{
	new myPizzaString[128];
	PizzaMission[playerid][PizzaSeconds]++;
	if(PizzaMission[playerid][PizzaSeconds]%15 == 0 && PizzaMission[playerid][PizzaWarmth] > 0) PizzaMission[playerid][PizzaWarmth]--;
	SetPlayerCheckpoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2], 2.0);
	format(myPizzaString, 128, "~g~Timer: ~w~%d seconds~n~~g~Pizza Warmth: ~r~%d%", PizzaMission[playerid][PizzaSeconds], PizzaMission[playerid][PizzaWarmth]);
	PlayerTextDrawSetString(playerid, PizzaDraw, myPizzaString);
	return 1;
}

public GetRandomHouseWithRange(playerid)
{
	new
		Iterator:_generateH<MAX_HOUSES>,
		myid,
		x=0,
		tries=0;

 	for(new i = 0; i < MAX_HOUSES; i++)
 	{
 		if(hInfo[i][ID] <= 0)
  			continue;
    	else
    		Iter_Add(_generateH, i);
	}
	while(!x)
	{
    myid = Iter_Random(_generateH);
    if(hInfo[myid][X_OUT] == 0.0 || hInfo[myid][Y_OUT] == 0.0 || hInfo[myid][Z_OUT] == 0.0) continue;
    if(IsPlayerInRangeOfPoint(playerid, 500.0, hInfo[myid][X_OUT],hInfo[myid][Y_OUT],hInfo[myid][Z_OUT]) && tries < 4)
    {
        tries++;
        continue;
    }
    else x=1;
    }
    printf("%d", myid);
    return myid;
}

stock CarryPizza(playerid, num)
{
	new v = GetClosestVehicleForPlayer(playerid);
	//printf("%d",v);
 	if(v == INVALID_VEHICLE_ID || GetVehicleModel(v) != 448 || vInfo[v][Job] != PIZZA_JOB)
  	{
 		SendClientMessage(playerid, -1, "You are not near a vehicle or the vehicle is not a pizza bike!");
	 	return 1;
   	}

	if(num == 1)
	{
 		if(PizzaLeft[v] < 1) return SendClientMessage(playerid, -1, "There are no pizzas left in this bike.");
 		if(PizzaMission[playerid][CarryingPizza]) return SendClientMessage(playerid, -1, "You are already carrying a pizza. Type /storepizza to put it back.");
 		PizzaLeft[v]--;
 		PizzaMission[playerid][CarryingPizza] = true;
 		SetPlayerAttachedObject(playerid, 9, 1582, 1, 0.0, 0.520760, 0.0, 5.000000, 84.217391, 0.000000, 1.000000, 1.000000, 1.000000);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
		SendClientMessage(playerid, -1, "You are now carrying a pizza.");

	}
	else
	{
	    if(!PizzaMission[playerid][CarryingPizza]) return SendClientMessage(playerid, -1, "You are not carrying a pizza.");
	    if(PizzaLeft[v] >= 5) return SendClientMessage(playerid, -1, "There is not enough room to store a pizza in this bike.");
	    PizzaLeft[v]++;
	    PizzaMission[playerid][CarryingPizza] = false;
	    RemovePlayerAttachedObject(playerid, 9);
	    SetPlayerSpecialAction(playerid, 0);
		GameTextForPlayer(playerid, "~g~Pizza Stored!", 1500, 4);
	}
	return 1;
}

Stats(playerid, issuerid)
{
	new
	    jobtext[32], nxtlevel = cInfo[playerid][cLevel]+1, expamount = nxtlevel*4, factiontext[64], ranktext[32];

	switch(cInfo[playerid][cJob])
	{
	    case DELIVERY_MAN_JOB: jobtext = "Delivery Man";
	    case PIZZA_JOB: jobtext = "Pizza Boy";
	    case GARBAGE_MAN_JOB: jobtext = "Garbage Man";
	    case FISHER_MAN_JOB: jobtext = "Fisherman";
	    case TAXI_DRIVER_JOB: jobtext = "Taxi Driver";
	    default: jobtext = "Unemployed";
	}
	new donorname[22];
	switch(cInfo[playerid][cDonator])
	{
	    case 1: donorname = "Bronze Donator";
	    case 2: donorname = "Silver Donator";
	    case 3: donorname = "Gold Donator";
	    default: donorname = "Regular Member";
	}
	switch(cInfo[playerid][cFaction])
	{
		case 1..20: format(factiontext, sizeof factiontext, fInfo[cInfo[playerid][cFaction]][Name]);
		default: factiontext = "None";
	}
	switch(cInfo[playerid][cRank])
	{
		case 1..15: format(ranktext, sizeof ranktext, GetPlayerRank(playerid));
		default: ranktext = "None";
	}
	new phonetype[12];
	switch(cInfo[playerid][cPhoneType])
	{
	    case 1: phonetype = "White";
	    case 2: phonetype = "Red";
	    case 3: phonetype = "Green";
	    case 4: phonetype = "Blue";
   		case 5: phonetype = "Yellow";
   		case 6: phonetype = "Purple";
	    default: phonetype = "None";
	}
	new gender[22];
	switch(cInfo[playerid][cGender])
	{
		case 1: gender = "Male";
		case 2: gender = "Female";
	}
    CPF(issuerid, -1, "{33aa33}______________________________________________");
	CPF(issuerid, -1, "{33aa33}            Statistics for %s:         ", GetPlayerNameEx(playerid));
	CPF(issuerid, COLOR_FADE1, "Level: %d, Hours: %d/%d, Money: $%d, Bank: $%d, Savings: $%d, Paycheck: $%d", cInfo[playerid][cLevel], cInfo[playerid][cEXP], expamount, cInfo[playerid][cMoney], cInfo[playerid][cBank], cInfo[playerid][cSavings], cInfo[playerid][cPaycheck]);
    CPF(issuerid, COLOR_FADE2, "Total hours: %d, Gender: %s, Age: %d, Donation: %s", cInfo[playerid][cTotalHours], gender, cInfo[playerid][cAge], donorname);
	CPF(issuerid, COLOR_FADE1, "Faction: %s (%d), Rank: %s (%d), Job: %s (%d)", factiontext, cInfo[playerid][cFaction], ranktext, cInfo[playerid][cRank], jobtext, cInfo[playerid][cJobHours]);
	CPF(issuerid, COLOR_FADE2, "Phone number: %d, Phone credits: %d, Phone type: %d (%s)", cInfo[playerid][cPhone], cInfo[playerid][cPhoneCredits], cInfo[playerid][cPhoneType], phonetype);
	if(cInfo[playerid][cJob] == 4) CPF(issuerid, COLOR_FADE2, "Fisherman: Fish: %d/%d, LBS Capacity: %d", Fishes[playerid], MAX_FISH, FishLBS[playerid]);
	CPF(issuerid, -1, "{33aa33}______________________________________________");
 	return 1;
}

stock IsRPName(name[])
{
    // First character (Firstname) is not uppercase, invalid.
    if (0x5A < name[0] || name[0] < 0x41)
        return 0;


    new
        index = 0, // Loop will start from index 1, we already checked index 0 above.
        underscoreCount,
        lastNamePos = -1;


    // Check for underscores.
    while (name[++index])
    {
        if (name[index] == '_')
        {
            underscoreCount++;
            if (lastNamePos == -1)
                lastNamePos = index + 1;

            // More than one underscore, invalid.
            if (underscoreCount > 1)
                return 0;
        }
        // Not a lowercase character.
        else if (index != lastNamePos && (0x7A < name[index] || name[index] < 0x61))
            return 0;
    }


    // No underscore, invalid.
    if (!underscoreCount)
         return 0;

    // Lastname first character is not uppercase, invalid.
    if (0x5A < name[lastNamePos] || name[lastNamePos] < 0x41)
        return 0;


    return 1;
}

stock AddAdminLog(name[], log[])
{
	new
		entry[156];

	format(entry, sizeof entry, "%s\r\n", log);
	format(gString, sizeof gString, "playerLogs/%s.admin.log", name);
	new File:hFile = fopen(gString, io_append);
	fwrite(hFile, entry), fclose(hFile);
}

stock AddCrime(name[], crime[])
{
	new
		entry[156];

	format(entry, sizeof entry, "%s\n", log);
	format(gString, sizeof gString, "playerCrimes/%s.crime.log", name);
	new File:hFile = fopen(gString, io_append);
	fwrite(hFile, entry), fclose(hFile);
}

public JailTimer()
{
	foreach(Player,i)
	{
		if(!IsPlayerConnected(i)) continue;
		if(Logged[i] == false) continue;
		if(cInfo[i][cJailed] == 0) continue;
		if(cInfo[i][cJailTime] < 0)
		{
		    cInfo[i][cJailed] = 0;
		    cInfo[i][cJailTime] = 0;
			SetSpawnInfo(i, 0, 0, 1217.5569,-142.4109,104.3689, 0.0, 0, 0, 0, 0, 0, 0 );
			SpawnPlayer(i);
			GameTextForPlayer(i, "~n~~n~~n~~n~~n~~g~Released from admin jail!", 1000, 5);
			SetPlayerVirtualWorld(i, 0);
		}
		else
		{
		    cInfo[i][cJailTime] = cInfo[i][cJailTime] - 1;
		    format(gString, sizeof gString, "~n~~n~~n~~n~~n~~r~Seconds left: %d", cInfo[i][cJailTime]);
		    GameTextForPlayer(i, gString, 999, 5);
		    if(!IsPlayerInRangeOfPoint(i, 15.0, 2524.3831,-1673.9191,14.8585))
		    {
				format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] is far away from admin jail.", GetName(i),i);
	            if(AnticheatSpam[i] == false) SendAdminMessage(-1, gString);
	            AnticheatSpam[i] = true;
	            SetTimerEx("PreventACSpam", 7500, false, "i", i);
			}
		}
	}
	return 1;
}

public PrisonTimer()
{
	foreach(Player,i)
	{
		if(!IsPlayerConnected(i) || !Logged[i]) continue;
		if(cInfo[i][cPrison] == 0 && cInfo[i][cJailed] == 1) continue;
		if(cInfo[i][cPrison] == 1 && cInfo[i][cJailed] == 1) continue;
		if(cInfo[i][cPrison] == 0 && cInfo[i][cJailed] == 0) continue;
		if(cInfo[i][cPrisonTime] < 0)
		{
		    cInfo[i][cPrison] = 0;
		    cInfo[i][cPrisonTime] = 0;
		    cInfo[i][cPrisonCell] = 0;
			SetPlayerPos(i, 1543.7792,-1675.5090,13.5571);
			SetPlayerInterior(i, 0);
			SetPlayerFacingAngle(i, 0);
			SetCameraBehindPlayer(i);
			GameTextForPlayer(i, "~n~~n~~n~~n~~n~~g~Released from jail!~n~~w~Try to be a better citizen", 1000, 5);
			SetPlayerVirtualWorld(i, 0);
		}
		else
		{
		    cInfo[i][cPrisonTime] = cInfo[i][cPrisonTime] - 1;
		    format(gString, sizeof gString, "~n~~n~~n~~n~~n~~r~Seconds left: %d", cInfo[i][cPrisonTime]);
		    GameTextForPlayer(i, gString, 999, 5);
		    if(!IsPlayerInRangeOfPoint(i, 17.0, 227.4574,114.0844,999.0156))
		    {
				format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] is far away from police jail.", GetName(i), i);
	            if(AnticheatSpam[i] == false) SendAdminMessage(-1, gString);
	            AnticheatSpam[i] = true;
	            SetTimerEx("PreventACSpam", 7500, false, "i", i);
			}
		}
	}
	return 1;
}

stock NoAdmin(playerid)
{
	return SendClientMessage(playerid, COLOR_RED, "You don't have permissions to use this command.");
}

stock Disconnected(playerid)
{
	return SendClientMessage(playerid, COLOR_FADE3, "Given player ID could not be found.");
}

stock SetPos(playerid,Float:PositionX,Float:PositionY,Float:PositionZ)
{
   if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return SetVehiclePos(GetPlayerVehicleID(playerid), PositionX, PositionY, PositionZ);
   else return SetPlayerPos(playerid, PositionX, PositionY, PositionZ);
}

stock PPath(playerid)
{
    format(gString,sizeof(gString), "players/%s.ini", GetName(playerid));
    return gString;
}

stock CPath(playerid)
{
    format(gString,sizeof(gString), "characters/%s.ini", GetName(playerid));
    return gString;
}

stock SendFactionMessage(factiontype, color, string[])
{
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(fInfo[cInfo[i][cFaction]][Type] == factiontype)
	    {
	        SendClientMessage(i, color, string);
	    }
	}
}

stock SendTaxiMessage(color, string[])
{
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i) || !Logged[i]) continue;
	    if(cInfo[i][cJob] == TAXI_DRIVER_JOB)
	    {
     		SendClientMessage(i, color, string);
     	}
	}
}

public SendFMessage(family, color, string[])
{
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(!IsPlayerConnected(i) || !Logged[i]) continue;
		if(!FactionChat[i]) continue;
  		if(cInfo[i][cFaction] == family)
    	{
			SendClientMessage(i, color, string);
		}
	}
}

public SendGroupMessage(group, color, string[])
{
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(!IsPlayerConnected(i)) continue;
  		if(cInfo[i][cOOCGroup] == group)
    	{
			SendClientMessage(i, color, string);
		}
	}
}

public SendRadioMessage(playerid, channel, color, string[])
{
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(i == playerid) continue;
  		if(cInfo[i][cRadio][0] == channel)
    	{
    	    format(gString, sizeof gString, "{FFE96E}[C: %d, S: 1] %s: %s", channel, GetPlayerNameEx(playerid), string);
			SendClientMessage(i, color, gString);
		}
		else if(cInfo[i][cRadio][1] == channel)
    	{
    	    format(gString, sizeof gString, "{FFE96E}[C: %d, S: 2] %s: %s", channel, GetPlayerNameEx(playerid), string);
			SendClientMessage(i, color, gString);
		}
		else if(cInfo[i][cRadio][2] == channel)
    	{
    	    format(gString, sizeof gString, "{FFE96E}[C: %d, S: 3] %s: %s", channel, GetPlayerNameEx(playerid), string);
			SendClientMessage(i, color, gString);
		}
	}
}


LoadInteriors()
{
	new count, temp[128], i;
 	format(_query, sizeof(_query), "SELECT * FROM `interiors`");
  	mysql_query(_query);
   	mysql_store_result();
    if(mysql_num_rows())
    {
		while(mysql_retrieve_row())
		{
  			mysql_fetch_field_row(temp, "ID");
			i = strval(temp);
		 	iInfo[i][ID] = strval(temp);
		    mysql_fetch_field_row(temp, "outX"), iInfo[i][outX] = floatstr(temp);
		    mysql_fetch_field_row(temp, "outY"), iInfo[i][outY] = floatstr(temp);
		    mysql_fetch_field_row(temp, "outZ"), iInfo[i][outZ] = floatstr(temp);
		    mysql_fetch_field_row(temp, "inX"), iInfo[i][inX] = floatstr(temp);
		    mysql_fetch_field_row(temp, "inY"), iInfo[i][inY] = floatstr(temp);
		    mysql_fetch_field_row(temp, "inZ"), iInfo[i][inZ] = floatstr(temp);
      		mysql_fetch_field_row(temp, "InteriorID"), iInfo[i][InteriorID] = strval(temp);
      		mysql_fetch_field_row(temp, "outsideText"), format(iInfo[i][outsideText], 256, temp);
      		mysql_fetch_field_row(temp, "Locked"), iInfo[i][Locked] = strval(temp);
			count++;
			iInfo[i][Pickup] = CreateDynamicPickup(1239, 1, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ], -1, -1, -1, 100);
			format(gString, sizeof gString, ""COL_WHITE"[%s"COL_WHITE"]", iInfo[i][outsideText]);
            iInfo[i][Label] = CreateDynamic3DTextLabel(gString, -1, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ]+0.4, 12.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 100.0);
		}
	}
 	mysql_free_result();
	return 1;
}

stock GetPlayerRank(playerid)
{
	new string[128];
	string = "None";
	if(cInfo[playerid][cFaction] >= 1)
	{
	    new fac = cInfo[playerid][cFaction];
	    new rank = cInfo[playerid][cRank];
		if(FactionExists(fac))
		{
			switch(rank)
			{
			    case 1: format(string, 128, fInfo[fac][Rank1]);
			    case 2: format(string, 128, fInfo[fac][Rank2]);
			    case 3: format(string, 128, fInfo[fac][Rank3]);
			    case 4: format(string, 128, fInfo[fac][Rank4]);
			    case 5: format(string, 128, fInfo[fac][Rank5]);
			    case 6: format(string, 128, fInfo[fac][Rank6]);
			    case 7: format(string, 128, fInfo[fac][Rank7]);
			    case 8: format(string, 128, fInfo[fac][Rank8]);
			    case 9: format(string, 128, fInfo[fac][Rank9]);
			    case 10: format(string, 128, fInfo[fac][Rank10]);
			    case 11: format(string, 128, fInfo[fac][Rank11]);
			    case 12: format(string, 128, fInfo[fac][Rank12]);
			    case 13: format(string, 128, fInfo[fac][Rank13]);
			    case 14: format(string, 128, fInfo[fac][Rank14]);
			    case 15: format(string, 128, fInfo[fac][Rank15]);
			}
		}
	}
	return string;
}

stock IsBuyableVeh(vehid)
{
	for(new i = 0; i < sizeof(CarsPrices); i++)
 	{
	    if(CarsPrices[i][VEHID] == vehid)
	        return 1;
	}
	return 0;
}

stock GetVehiclePrice(vehid)
{
	new aviv;
	for(new i = 0; i < 73; i++)
 	{
	    if(CarsPrices[i][VEHID] == vehid) {
	        aviv = i;
	        break;
	    }
	}
	return CarsPrices[aviv][PRICE];
}

stock GetVehicleName(vehid)
{
	new str[64], aviv;
	for(new i = 0; i < 73; i++) {
 		if(CarsPrices[i][VEHID] == vehid) {
 		    aviv = i;
			break;
		}
	}
	format(str, 64, CarsPrices[aviv][NAME]);
	return str;
}

stock IsABike(vid)
{
    new modelid = GetVehicleModel(vid);
    if(modelid == 509||modelid ==510||modelid ==481) return 1;
    else return 0;
}

stock IsACop(playerid)
{
	new fac = cInfo[playerid][cFaction];
    if(fInfo[fac][Type] == 1) return 1;
    else return 0;
}

stock IsAMedic(playerid)
{
	new fac = cInfo[playerid][cFaction];
    if(fInfo[fac][Type] == 2) return 1;
    else return 0;
}

stock GetPlayerID(name[]) {
	new gPlayername[MAX_PLAYER_NAME+1];
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++) {
	    GetPlayerName(i, gPlayerName, sizeof gPlayername);
	    if(!strcmp(gPlayername, name, true)) {
	        return i;
	    }
	    else
	        return 0;
	}
}

stock retFirstLeters(name[MAX_PLAYER_NAME])
{
    new strpos = strfind(name, "_", true),
        string[4];

    format(string, sizeof(string), "%c%c", name[0], name[strpos+1]);
    return string;
}

forward ProxDetectorV(Float:radi, playerid, vehicleid);
public ProxDetectorV(Float:radi, playerid, vehicleid)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetVehiclePos(vehicleid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("bugsChecker: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

stock GetClosestVehicleForPlayer(playerid)
{
	new Float:x, Float:y, Float:z;
	new Float:dist, Float:closedist=9999, closeveh;
	for(new i=1; i < MAX_VEHICLES; i++)
	{
		if(GetVehiclePos(i, x, y, z))
		{
			dist = GetPlayerDistanceFromPoint(playerid, x, y, z);
			if(dist < closedist)
			{
				closedist = dist;
				closeveh = i;
			}
		}
	}
	return closeveh;
}

forward ConnectToMYSQL();
public ConnectToMYSQL()
{
    if(mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS)) {
        mysql_debug(1);
            printf("Connected to MySQL database `%s`", SQL_DB);
    }
    else {
            printf("Could not connect to MySQL database `%s`", SQL_DB);
    }
}

FactionExists(factionid)
{
	format(_query, sizeof(_query), "SELECT * FROM `factions` WHERE `ID` = '%d'", factionid);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows()) {
	    return mysql_free_result(), true;
	}
	else {
	    return mysql_free_result(), false;
	}
}

GroupExists(factionid)
{
	format(_query, sizeof(_query), "SELECT * FROM `oocgroups` WHERE `ID` = '%d'", factionid);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows()) {
	    return mysql_free_result(), true;
	}
	else {
	    return mysql_free_result(), false;
	}
}

stock IsValidEmailEx(const string[])
{
    static
        RegEx:rEmail
    ;

    if ( !rEmail )
    {
        rEmail = regex_build("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    }

    return regex_match_exid(string, rEmail);
}

stock GetPlayerPacketloss(playerid,&Float:packetloss)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new nstats[400+1], nstats_loss[20], start, end;
    GetPlayerNetworkStats(playerid, nstats, sizeof(nstats));

    start = strfind(nstats,"packetloss",true);
    end = strfind(nstats,"%",true,start);

    strmid(nstats_loss, nstats, start+12, end, sizeof(nstats_loss));
    packetloss = floatstr(nstats_loss);
    return 1;
}

stock GetLoggedCount()
{
	new count = 0;
	for(new i; i < GetMaxPlayers(); i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    if(!Logged[i]) continue;
	    count++;
	}
	return count;
}

stock GetBizCommands(_type)
{
	new _Name[32];
	switch(_type)
	{
	    case 1: format(_Name, 32, "/buy items");
	    case 2: format(_Name, 32, "/buy weapons");
	    case 4: format(_Name, 32, "/buy tools");
	    case 6: format(_Name, 32, "/buy food");
	    case 7: format(_Name, 32, "/buy drink");
	    case 8: format(_Name, 32, "/bank");
	    case 11: format(_Name, 32, "/buy drink");
	    case 12: format(_Name, 32, "/buy phone");
	    case 13: format(_Name, 32, "/buy clothes");
	    default: format(_Name, 32, "None");
	}
	return _Name;
}

stock GetBizName(_type)
{
	new _Name[32];
	switch(_type)
	{
	    case 1: format(_Name, 32, "24/7");
	    case 2: format(_Name, 32, "Ammounation");
	    case 3: format(_Name, 32, "Gas Station");
	    case 4: format(_Name, 32, "Tool Shop");
	    case 5: format(_Name, 32, "GYM");
	    case 6: format(_Name, 32, "Fastfood");
	    case 7: format(_Name, 32, "Club");
	    case 8: format(_Name, 32, "Bank");
	    case 9: format(_Name, 32, "Pay'N'Spray");
	    case 10: format(_Name, 32, "Advertisement");
	    case 11: format(_Name, 32, "Liquor Bar");
	    case 12: format(_Name, 32, "Cellphones");
	    case 13: format(_Name, 32, "Clothing");
	    default: format(_Name, 32, "Unknown");
	}
	return _Name;
}

stock Show247Dialog(playerid)
{
    new Aviv12[516];
	strcat(Aviv12, "{33aa33}Product\t\tPrice\n");
	strcat(Aviv12, ""COL_WHITE"Dice\t\t\t$50\n");
	strcat(Aviv12, ""COL_WHITE"Baseball Bat\t\t$150\n");
	strcat(Aviv12, ""COL_WHITE"Spraycan\t\t$150\n");
	strcat(Aviv12, ""COL_WHITE"Gascan\t\t\t$250\n");
	strcat(Aviv12, ""COL_WHITE"Radio Device\t\t$2000\n");
	strcat(Aviv12, ""COL_WHITE"Mask\t\t\t$3500\n");
	strcat(Aviv12, ""COL_WHITE"Boombox\t\t$1500\n");
	//strcat(Aviv12, ""COL_WHITE"Note\t\t\t$50\n");
	return ShowPlayerDialog(playerid, DIALOG_247, DIALOG_STYLE_LIST, "24/7 Menu", Aviv12, "Buy", "Close");
}

stock FoodDialog(playerid)
{
    new Aviv12[516];
	strcat(Aviv12, "{33aa33}Product\t\tPrice\n");
	strcat(Aviv12, ""COL_WHITE"Small Meal\t\t$50\n");
	strcat(Aviv12, ""COL_WHITE"Medium Meal\t\t$100\n");
	strcat(Aviv12, ""COL_WHITE"Large Meal\t\t$150\n");
	return ShowPlayerDialog(playerid, DIALOG_FOOD, DIALOG_STYLE_LIST, "Food Menu", Aviv12, "Buy", "Close");
}

stock PhoneDialog(playerid)
{
    new Aviv12[516];
	strcat(Aviv12, "{33aa33}Product\t\t\tPrice\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (White)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (Red)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (Green)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (Blue)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (Yellow)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"Cellphone (Purple)\t\t$500\n");
	strcat(Aviv12, ""COL_WHITE"1000 Credits\t\t\t$1000\n");
	strcat(Aviv12, ""COL_WHITE"10000 Credits\t\t\t$10000\n");
	return ShowPlayerDialog(playerid, DIALOG_PHONE, DIALOG_STYLE_LIST, "Phone Store Menu", Aviv12, "Buy", "Close");
}

public PhoneRing(playerid)
{
	if(CallOffer[playerid] < 0)
	    return KillTimer(CallTimer[playerid]), 1;

	format(gString, sizeof(gString), "* %s phone rings.", GetPlayerNameEx(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    return 1;
}

public ReducePhoneCredits(playerid)
{
	if(InCall[playerid] >= 0)
	{
	    if(cInfo[playerid][cPhoneCredits] > 0)
	        cInfo[playerid][cPhoneCredits] = cInfo[playerid][cPhoneCredits] - 1;

		else
		{
		    CPF(playerid, COLOR_RED, "The phone line has been terminated due to due to lack in phone credits.");
		    CPF(InCall[playerid], COLOR_GRAY, "The phone line has been disconnected.");
		    InCall[InCall[playerid]] = -1;
		    CallOffer[InCall[playerid]] = -1;
			InCall[playerid] = -1;
			CallOffer[playerid] = -1;
		}
	}

	else
	    KillTimer(ReduceCredits[playerid]);
    return 1;
}

stock IsPlayerInRangeOfPlayer(playerid, targetid, Float:range)
{
	if(!IsPlayerConnected(targetid) || targetid == playerid)
	    return false;

	new Float:Pos[3];
	GetPlayerPos(targetid, Pos[0], Pos[1], Pos[2]);
	if(IsPlayerInRangeOfPoint(playerid, range, Pos[0], Pos[1], Pos[2]))
	    return true;

	else
	    return false;
}

forward RealSpawn(playerid);
public RealSpawn(playerid)
{
    Spawned[playerid]=true;
    CallRemoteFunction("PrintHud","i",playerid);
    return true;
}

stock GivePlayerWeaponEx(playerid,weaponid,ammo)
{
    PlayerWeapons[playerid][weaponid]=true; // Player Has the weapon.
    GivePlayerWeapon(playerid,weaponid,ammo); // To realy give him the weapon.
}

stock GetPlayerSpeed(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
    return floatround(ST[3]);
}

stock IsAtGasStation(playerid)
{
 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
 	{
 	    format(_query, sizeof(_query), "SELECT * FROM `bizzes` WHERE `ID`='%d'", i);
 	    mysql_query(_query);
 	    mysql_store_result();
 	    if(!mysql_num_rows()) continue;
        else
		{
		    if(bInfo[i][Type] != 3) continue;
	        if(IsPlayerInRangeOfPoint(playerid, 10.0, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
	            return true;
        }
 	    mysql_free_result();
 	}
 	return false;
}

forward FillVehicle(playerid);
public FillVehicle(playerid)
{
	new vid = GetPlayerVehicleID(playerid);
	if(IsAtGasStation(playerid))
	{
		vInfo[vid][Fuel] = 100;
	}
	else if(HaveGasCan[playerid])
	{
		if(vInfo[vid][Fuel] <= 75)
		    vInfo[vid][Fuel] += 25;

		else
		    vInfo[vid][Fuel] = 100;
	}
}

public CountdownFuel(playerid)
{
	CountDown[playerid]--;
	if(CountDown[playerid] == 0)
	{
	    TogglePlayerControllable(playerid, 1);
	    GameTextForPlayer(playerid, "~g~Vehicle filled up!", 999, 3);
        KillTimer(CountDownTimer[playerid]);
	}
    else
    {
		format(gString, 128, "~g~Filling up vehicle.. ~w~%d", CountDown[playerid]);
		GameTextForPlayer(playerid, gString, 2500, 3);
    }
    return 1;
}

forward CountdownDown(playerid);
public CountdownDown(playerid)
{
	CountDown[playerid]--;
	if(CountDown[playerid] == 0)
	{
	    TogglePlayerControllable(playerid, 1);
	    GameTextForPlayer(playerid, "~g~You now feel better!", 2500, 3);
        KillTimer(CountDownTimer[playerid]);
        ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	}
    else
    {
        new animlib[32];
        new animname[32];
		format(gString, 128, "~r~You are knocked down!~n~~w~Wait %d seconds", CountDown[playerid]);
		GameTextForPlayer(playerid, gString, 1000, 3);
        GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
        if(strcmp(animname, "KO_skid_front", true))
		{
		    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
		    ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
        }
		format(gString, sizeof(gString), "* %s is knocked down.", GetPlayerNameEx(playerid));
		SetPlayerChatBubble(playerid, gString, COLOR_PURPLE, 15.0, 1000);
    }
    return 1;
}

GetVehicleID(vehicleid)
{
    for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
    {
        if(IsValidVehicle(i) && vInfo[i][ID] == vehicleid)
        {
			return i;
        }
    }
    return 0;
}

public ReduceFuel(vehicleid)
{
	if(!AdminVehicle[vehicleid] && vInfo[vehicleid][Server] <= 0 && Engine[vehicleid] == true)
	{
		if(vInfo[vehicleid][Fuel] >= 1)
		    vInfo[vehicleid][Fuel] -= 1;

		else
		{
			Engine[vehicleid] = false;
			GetVehicleParamsEx(vehicleid,vEngine,vLights,vAlarm,vDoors,vBonnet,vBoot,vObjective);
			SetVehicleParamsEx(vehicleid,0,0,vAlarm,vDoors,vBonnet,vBoot,vObjective);
			KillTimer(EngineTimer[vehicleid]);
			for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
			{
			    if(!IsPlayerConnected(i) || !Logged[i]) continue;
			    if(GetPlayerVehicleID(i) != vehicleid) continue;
			    GameTextForPlayer(i, "~r~Vehicle has ran out of fuel!", 3500, 4);
			    break;
			}
		}
 	}
	return 1;
}

forward FixVehicle(playerid);
public FixVehicle(playerid)
{
	SetPos(playerid, bInfo[InBiz[playerid]][X_OUT]+2.0, bInfo[InBiz[playerid]][Y_OUT], bInfo[InBiz[playerid]][Z_OUT]);
	RepairVehicle(GetPlayerVehicleID(playerid));
	SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	InBiz[playerid] = 0;
	TogglePlayerControllable(playerid, true);
	ChangeVehicleColor(GetPlayerVehicleID(playerid), payColor1[playerid], payColor2[playerid]);
	return 1;
}

stock IsValidSkin(skinid)
{
	switch(skinid)
	{
		case 1..162: return 1;
		case 167..263: return 1;
		case 269..273: return 1;
		case 289..299: return 1;
		default: return 0;
	}
	return 1;
}

forward Advert();
public Advert()
{
	Advertable = true;
	KillTimer(AdvertTimer);
}

stock GetHouseID(playerid)
{
	new biznum = 0;
	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
	    if(hInfo[i][ID] <= 0) continue;
  		if(!IsPlayerInRangeOfPoint(playerid, 2.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT])) continue;
		biznum = hInfo[i][ID];
		break;
	}
	return biznum;
}

stock GetBizID(playerid)
{
	new biznum = 0;
	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
 	{
		if(bInfo[i][ID] <= 0) continue;
  		if(!IsPlayerInRangeOfPoint(playerid, 2.5, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT])) continue;
		biznum = bInfo[i][ID];
		break;
	}
	return biznum;
}

stock IsBizExists(bizid)
{
    format(_query, sizeof(_query), "SELECT * FROM `bizzes` WHERE `ID`='%d'", bizid);
    mysql_query(_query);
    mysql_store_result();
    if(!mysql_num_rows())
	{
	    mysql_free_result();
	    return 0;
 	}
    else
    {
        mysql_free_result();
        return 1;
    }
}

stock RemovePlayerWeapon(playerid, weaponid)
{
	new plyWeapons[12];
	new plyAmmo[12];

	for(new slot = 0; slot != 12; slot++)
	{
		new wep, ammo;
		GetPlayerWeaponData(playerid, slot, wep, ammo);

		if(wep != weaponid)
		{
			GetPlayerWeaponData(playerid, slot, plyWeapons[slot], plyAmmo[slot]);
		}
	}

	ResetPlayerWeapons(playerid);
	for(new slot = 0; slot != 12; slot++)
	{
		GivePlayerWeaponEx(playerid, plyWeapons[slot], plyAmmo[slot]);
	}
}


stock Call_Payday(playerid)
{
	new rentprice = hInfo[cInfo[playerid][cRenting]][RentPrice];
	new Float:calculateSavings = cInfo[playerid][cSavings]*1.005;
	new calculatedSavings = floatround(calculateSavings, floatround_round);
	new Float:calculateBank = cInfo[playerid][cBank]*1.002;
	new calculatedBank = floatround(calculateBank, floatround_round);
	new calculatePaycheck;
	if(cInfo[playerid][cFaction] > 0) calculatePaycheck = (cInfo[playerid][cRank] * 250) + RandomEx(1500, 1750);
	else calculatePaycheck = RandomEx(1000, 1100) + cInfo[playerid][cPaycheck];
	CPF(playerid, 0x33AA33FF, "_________ PAYDAY INCOME _________");
	CPF(playerid, COLOR_FADE1, "Interest Gained: 0.2");
	if(cInfo[playerid][cSavings] > 0) CPF(playerid, COLOR_FADE1, "Savings Gained: 0.5");
	CPF(playerid, COLOR_FADE1, "Paycheck: $%d", calculatePaycheck);
	if(cInfo[playerid][cRenting] > 0 && cInfo[playerid][cBank] >= rentprice) CPF(playerid, COLOR_RED, "Rent: -$%d", rentprice);
	else if(cInfo[playerid][cRenting] > 0 && cInfo[playerid][cBank] < rentprice) cInfo[playerid][cRenting] = 0, CPF(playerid, COLOR_RED, "You have been evicted from your rented house due to lack of payment.");
	CPF(playerid, COLOR_FADE1, "------------------------");
	CPF(playerid, COLOR_FADE1, "Old Balance: $%d", cInfo[playerid][cBank]);
	CPF(playerid, COLOR_FADE1, "New Balance: $%d", calculatedBank + calculatePaycheck);
	CPF(playerid, COLOR_FADE1, "------------------------");
	if(cInfo[playerid][cSavings] > 0)
	{
		CPF(playerid, COLOR_FADE1, "Old Savings Balance: $%d", cInfo[playerid][cSavings]);
		CPF(playerid, COLOR_FADE1, "New Savings Balance: $%d", calculatedSavings);
	}
	format(gString, sizeof(gString), "~w~Paycheck~n~~g~+$%d", calculatePaycheck);
	GameTextForPlayer(playerid, gString, 3200, 1);
	if(cInfo[playerid][cRenting] > 0 && cInfo[playerid][cBank] >= rentprice) cInfo[playerid][cBank] = calculatedBank + calculatePaycheck - rentprice;
	else cInfo[playerid][cBank] = calculatedBank + calculatePaycheck;
	if(cInfo[playerid][cSavings] >= 20000000) cInfo[playerid][cSavings] = 20000000;
	else if(cInfo[playerid][cSavings] > 0) cInfo[playerid][cSavings] = calculatedSavings;
	new nxtlevel = cInfo[playerid][cLevel]+1;
	new expamount = nxtlevel*4;
	cInfo[playerid][cEXP] += 1;
	if(cInfo[playerid][cEXP] >= expamount)
	{
	    cInfo[playerid][cLevel] += 1;
	    cInfo[playerid][cEXP] = 0;
	    CPF(playerid, -1, "Level up! You are now level %d.", cInfo[playerid][cLevel]);
	}
	if(cInfo[playerid][cJob] > 0)
	    cInfo[playerid][cJobHours] += 1;

	cInfo[playerid][cTotalHours] += 1;
	cInfo[playerid][cPaycheck] = 0;
	return 1;
}

stock GetRandomBusiness()
{
    new
        Iterator:_generateRBIZ<MAX_BIZZES>;
    for(new i = 0; i < MAX_BIZZES; i++)
    {
        if(bInfo[i][ID] <= 0) continue;
        Iter_Add(_generateRBIZ, i);
    }
    return Iter_Random(_generateRBIZ);
}

public LoadMission(playerid)
{
    new
            vehicleid = GetPlayerVehicleID(playerid),
            bizid = GetRandomBusiness();

    SetPVarInt(playerid, "MissionBizID", bizid);
    //Mission_CP[playerid] = CreateDynamicCP(bInfo[bizid][X_OUT], bInfo[bizid][Y_OUT], bInfo[bizid][Z_OUT], 2.0, 0, 0, playerid, 50.0);
	SetPlayerCheckpoint(playerid, bInfo[bizid][X_OUT], bInfo[bizid][Y_OUT], bInfo[bizid][Z_OUT], 4.0);
	JobPos[playerid][0] = bInfo[bizid][X_OUT];
	JobPos[playerid][1] = bInfo[bizid][Y_OUT];
	JobPos[playerid][2] = bInfo[bizid][Z_OUT];
    //SetPlayerMapIcon( playerid, 1, bInfo[bizid][X_OUT], bInfo[bizid][Y_OUT], bInfo[bizid][Z_OUT], 51, 0, MAPICON_GLOBAL);
    GameTextForPlayer(playerid, "~r~Destination has been set!", 3000, 6);
    Mission[playerid] = true;
    format(szMessage, sizeof(szMessage), "~y~Business Name: ~w~%s", bInfo[bizid][Name]);
    PlayerTextDrawSetString(playerid, PlayerText:TD_BIZ_NAME[playerid], szMessage);
    format(szMessage, sizeof(szMessage), "~y~Business Address: ~w~%s", bInfo[bizid][Address]);
    PlayerTextDrawSetString(playerid, PlayerText:TD_BIZ_ADRESS[playerid], szMessage);
    format(szMessage, sizeof(szMessage), "~y~Crates: ~w~%d/%d", vCrates[vehicleid], MAX_VEHICLE_CRATES);
    PlayerTextDrawSetString(playerid, PlayerText:TD_CRATES[playerid], szMessage);
    PlayerTextDrawShow(playerid, TD_BIZ_NAME[playerid]);
    PlayerTextDrawShow(playerid, TD_BIZ_ADRESS[playerid]);
    PlayerTextDrawShow(playerid, TD_CRATES[playerid]);
    return 1;
}

stock IsTaxiAvailable(vehicleid)
{
    foreach(Player,i)
    {
        if(IsPlayerInAnyVehicle(i))
        {
            if(GetPlayerVehicleID(i) == vehicleid && cInfo[i][cJob] != TAXI_DRIVER_JOB && !TaxiDuty[i] && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
            {
                return 1;
            }
        }
    }
    return 0;
}

stock IsVehicleOccupied(vehicleid) // Returns 1 if there is anyone in the vehicle
{
    foreach(Player,i)
    {
        if(IsPlayerInAnyVehicle(i))
        {
            if(GetPlayerVehicleID(i)==vehicleid)
            {
                return 1;
            }
        }
    }
    return 0;
}

public LoadGarbageMission(playerid)
{
    new
        vehicleid = GetPlayerVehicleID(playerid),
        bagid = GetRandomBag();

    Mission[playerid] = true;
	SetPlayerCheckpoint(playerid, Garbage_BAGS[bagid][0], Garbage_BAGS[bagid][1], Garbage_BAGS[bagid][2], 4.0);
	JobPos[playerid][0] = Garbage_BAGS[bagid][0];
	JobPos[playerid][1] = Garbage_BAGS[bagid][1];
	JobPos[playerid][2] = Garbage_BAGS[bagid][2];

    GameTextForPlayer(playerid, "~g~New destination has been set!", 3000, 6);
    CPF(playerid, -1, "NOTE: Your destination has been set, drive to the marked checkpoint on the map.");
    format(szMessage, sizeof(szMessage), "Garbage Bags: %d", vBags[vehicleid]);
    PlayerTextDrawSetString(playerid, PlayerText:TD_GARBAGE_BAGS[playerid], szMessage);
    PlayerTextDrawShow(playerid, PlayerText:TD_GARBAGE_BAGS[playerid]);
    return 1;
}

public StopGarbageMission(playerid)
{
    Mission[playerid] = false;
    DisablePlayerCheckpoint(playerid);
	JobPos[playerid][0] = 0.0;
	JobPos[playerid][1] = 0.0;
	JobPos[playerid][2] = 0.0;
    SendClientMessage(playerid, -1, "You have stopped working.");
    PlayerTextDrawHide(playerid, PlayerText:TD_GARBAGE_BAGS[playerid]);
    return 1;
}

public BagRecreation(bagid, Float:yX, Float:yY, Float:yZ)
{
    BagCreated[bagid] = true;
    Bag_Objects[bagid] = CreateDynamicObject(1264, yX, yY, yZ, 0.0, 0.0, 0.0, 0, 0, -1, 100);
    return 1;
}

public GetRandomBag()
{
    new
            Iterator:_generateRBAG<MAX_SERVER_BAGS>;
    for(new i = 0; i < MAX_SERVER_BAGS; i++)
    {
            if(BagCreated[i] == false)
                    continue;
            else
                    Iter_Add(_generateRBAG, i);
    }
    return Iter_Random(_generateRBAG);
}

stock GetClosestBag(playerid)
{
    new id;
    for(new i = 0; i < MAX_SERVER_BAGS; i++)
    {
            new Float:Distance = GetPlayerDistanceFromPoint(playerid, Garbage_BAGS[i][0], Garbage_BAGS[i][1], Garbage_BAGS[i][2]);
            if(Distance > 3.0)
                    continue;
            else
                    id = i;
    }
    return id;
}

forward Fishing(playerid);
public Fishing(playerid)
{
	return IsFishing[playerid] = false;
}

stock AddDListItem(playerid, ItemStr[1600], gItemID = -1, ItemParam = -1)
{
    DLDPlayerListItems[playerid][DLDLastIS] = gItemID;
    DLDPlayerListParam[playerid][DLDLastIS] = ItemParam;
    if( !DLDLastIS ){DLDString = ""; format(DLDString, sizeof(DLDString), "%s", ItemStr);}
    else format(DLDString, sizeof(DLDString), "%s\r\n%s", DLDString, ItemStr);
    DLDLastIS++;
    return DLDLastIS -1;
}

stock ShowPlayerDList(playerid, DialogID, Caption[], Button1[], Button2[])
{
    DLDLastIS = 0;
    ShowPlayerDialog(playerid, DialogID, DIALOG_STYLE_LIST, Caption, DLDString, Button1, Button2);
	DLDString = "";
	return true;
}
stock Clear_DList(playerid)
{
	for( new i; i < DLD_MAX_LIST_ITEMS; i++ )
	{
	    DLDPlayerListItems[playerid][i] = 0;
	    DLDPlayerListParam[playerid][i] = 0;
	}
	return true;
}

forward Tazed(playerid);
public Tazed(playerid)
{
      pTazed[playerid] = 0;
      TogglePlayerControllable(playerid, true);
      ClearAnimations(playerid);
      return 1;
}

stock IsPointInRangeOfPoint(Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2, Float:range)
{
    x2 -= x;
    y2 -= y;
    z2 -= z;
    return ((x2 * x2) + (y2 * y2) + (z2 * z2)) < (range * range);
}

forward DrivingTimer(playerid);
public DrivingTimer(playerid)
{
	if(DLic[playerid][Step] == 1)
	{
	    SendWrappedMessageToPlayer(playerid, COLOR_GRAY, "Driving Instructor: We are ready to go! Good luck on your test.");
		SetPlayerCheckpoint(playerid, DLic[playerid][licPos][0], DLic[playerid][licPos][1], DLic[playerid][licPos][2], 5.0);
		TogglePlayerControllable(playerid, 1);
		DLic[playerid][Step] = 2;
		DLic[playerid][dTimer] = SetTimerEx("DrivingTimer", 3000, true, "i", playerid);
	}
	else if(DLic[playerid][Step] == 2)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			CPF(playerid, COLOR_RED, "You have failed the driving test due to exit the vehicle.");
			DLic[playerid][Step] = 0;
			DLic[playerid][TookTest] = false;
			KillTimer(DLic[playerid][dTimer]);
		}
		else
		{
		    new vid = GetPlayerVehicleID(playerid), Float:vHealth;
		    GetVehicleHealth(vid, vHealth);
			if(GetVehicleSpeed(vid) >= 95)
			{
			    if(DLic[playerid][Warns] > 3)
			    {
					CPF(playerid, COLOR_RED, "You have the failed the driving test due to exceeding the allowed speed limit.");
					DLic[playerid][Step] = 0;
					DLic[playerid][TookTest] = false;
					KillTimer(DLic[playerid][dTimer]);
					SetVehicleToRespawn(vid);
					Engine[vid] = false;
			    }
			    DLic[playerid][Warns] ++;
			    switch(DLic[playerid][Warns])
			    {
			        case 1: CPF(playerid, COLOR_GRAY, "Driving Instructor: Please slow down! You are exceeding the speed limit. This is the first warning.");
			        case 2: CPF(playerid, COLOR_GRAY, "Driving Instructor: Please slow down! You are exceeding the speed limit. This is the second warning.");
			        case 3: CPF(playerid, COLOR_GRAY, "Driving Instructor: Please slow down! You are exceeding the speed limit. This is the third warning.");
			    }
			}
			else if(vHealth < 900)
			{
				CPF(playerid, COLOR_RED, "You have the failed the driving test due to damaging the vehicle. You were charged $200.");
				DLic[playerid][Step] = 0;
				DLic[playerid][TookTest] = false;
				KillTimer(DLic[playerid][dTimer]);
				new Float:getPos[3];
				GetPlayerPos(playerid, getPos[0], getPos[1], getPos[2]);
				SetVehicleToRespawn(vid);
				Engine[vid] = false;
				cInfo[playerid][cMoney] -= 200;
			}
		}
	}
	return 1;
}

stock PreloadAnimLib(playerid, animlib[])
{
    ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);
}
stock PreloadAllAnimLibs(playerid)
{
    PreloadAnimLib(playerid,"BEACH");
    PreloadAnimLib(playerid,"FAT");
    PreloadAnimLib(playerid,"PED");
    PreloadAnimLib(playerid,"PARACHUTE");
    PreloadAnimLib(playerid,"SWEET");
    PreloadAnimLib(playerid,"PYTHON");
    PreloadAnimLib(playerid,"CRACK");
    PreloadAnimLib(playerid,"MEDIC");
    PreloadAnimLib(playerid,"BASEBALL");
    PreloadAnimLib(playerid,"RAPPING");
    PreloadAnimLib(playerid,"SUNBATHE");
    PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"FOOD");
	PreloadAnimLib(playerid,"DEALER");
	PreloadAnimLib(playerid,"MISC");
	PreloadAnimLib(playerid,"PARK");
	PreloadAnimLib(playerid,"COP_AMBIENT");
	PreloadAnimLib(playerid,"GRAFFITI");
	PreloadAnimLib(playerid,"ON_LOOKERS");
	PreloadAnimLib(playerid,"RIOT");
	PreloadAnimLib(playerid,"GYMNASIUM");
	PreloadAnimLib(playerid,"PAULNMAC");
	PreloadAnimLib(playerid,"GHANDS");
	PreloadAnimLib(playerid,"CAR");
	PreloadAnimLib(playerid,"GANGS");
	PreloadAnimLib(playerid,"WUZI");
	PreloadAnimLib(playerid,"CLOTHES");
	PreloadAnimLib(playerid,"INT_OFFICE");
	PreloadAnimLib(playerid,"GRAVEYARD");
	PreloadAnimLib(playerid,"BAR");
	PreloadAnimLib(playerid,"SHOP");
}

stock RespawnVeh(vehicleid)
{
	SetVehiclePos(vehicleid, vInfo[vehicleid][X], vInfo[vehicleid][Y], vInfo[vehicleid][Z]);
	SetVehicleZAngle(vehicleid, vInfo[vehicleid][A]);
	SetVehicleHealth(vehicleid, 1000.0);
	RepairVehicle(vehicleid);
	ChangeVehicleColor(vehicleid, vInfo[vehicleid][Color1], vInfo[vehicleid][Color2]);
	Engine[vehicleid] = false;
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, false, lights, alarm, doors, bonnet, boot, objective);
	return true;
}

forward RespawnPizza(vehicleid);
public RespawnPizza(vehicleid)
{
	SetVehiclePos(vehicleid, vInfo[vehicleid][X], vInfo[vehicleid][Y], vInfo[vehicleid][Z]);
	SetVehicleZAngle(vehicleid, vInfo[vehicleid][A]);
	SetVehicleHealth(vehicleid, 1000.0);
	RepairVehicle(vehicleid);
	ChangeVehicleColor(vehicleid, vInfo[vehicleid][Color1], vInfo[vehicleid][Color2]);
	Engine[vehicleid] = false;
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, false, lights, alarm, doors, bonnet, boot, objective);
	return true;
}


// MDC
stock PlayerLicense(const playerid)
{
        new szMsg[16];
        if(cInfo[playerid][cDrivingLicense] > 0)
                szMsg = "Acquired";
        else
                szMsg = "None";
        return szMsg;
}

stock PlayerHouse(const playerid)
{
        format(g_szMessage, sizeof(g_szMessage), "Domestic adress:");
        for(new i = 0; i < MAX_HOUSES; i++)
        {
                if(hInfo[i][Owner] != cInfo[playerid][SQLID])
                        continue;
                else
                {
                        format(g_szMessage, sizeof(g_szMessage), "Domestic address: %s", hInfo[i][Address]);
                        break;
                }
        }
        if(strlen(g_szMessage) <= 17)
                format(g_szMessage, sizeof(g_szMessage), "Domestic adress: None");
        return g_szMessage;
}

stock PlayerVehicle(const playerid)
{
        if(IsVehicleSpawned(cInfo[playerid][cVehicle1]))
                format(g_szMessage, sizeof(g_szMessage), "\n\nREGISTERED VEHICLE:\nModel: %s\nPlate: %s", GetVehicleName(cInfo[playerid][cVehicle1]), vInfo[cInfo[playerid][cVehicle1]][Plate]);
        else if(IsVehicleSpawned(cInfo[playerid][cVehicle2]))
                format(g_szMessage, sizeof(g_szMessage), "\n\nREGISTERED VEHICLE:\nModel: %s\nPlate: %s", GetVehicleName(cInfo[playerid][cVehicle2]), vInfo[cInfo[playerid][cVehicle2]][Plate]);
        else if(IsVehicleSpawned(cInfo[playerid][cVehicle3]))
                format(g_szMessage, sizeof(g_szMessage), "\n\nREGISTERED VEHICLE:\nModel: %s\nPlate: %s", GetVehicleName(cInfo[playerid][cVehicle3]), vInfo[cInfo[playerid][cVehicle3]][Plate]);
        else
                format(g_szMessage, sizeof(g_szMessage), "");
        return g_szMessage;
}

stock PlayerPhone(const playerid)
{
        new
                Phone[16];
        if(strlen(cInfo[playerid][cPhone]) > 2)
        		format(Phone, sizeof(Phone), "%d", cInfo[playerid][cPhone]);
        else
                format(Phone, sizeof(Phone), "None");
        return Phone;
}

stock PlayerCharges(const playerid)
{
        format(g_szMessage, sizeof(g_szMessage), "SELECT `charge` FROM `charges` WHERE `id` = '%d' AND `outstanding` = '1'", playerid);
        mysql_query(g_szMessage);
        mysql_store_result();
        new
                charge[128];
        format(szMessage, sizeof(szMessage), "OUTSTANDING CHARGES:");
        while(mysql_retrieve_row())
        {
                mysql_fetch_field_row(charge, "charge");
                format(szMessage, sizeof(szMessage), "%s\n* %s", szMessage, charge);
        }
        if(strlen(szMessage) <= 21)
                format(szMessage, sizeof(szMessage), "");
        mysql_free_result();
        return szMessage;
}

stock GetVehicleFromPlate(const plate[])
{
        new
                vehid = 0;
        for(new i = 0; i <= MAX_VEHICLES; i++)
        {
                if(vInfo[i][ID] != 0)
                {
                        if(!strcmp(vInfo[i][Plate], plate))
                        {
                                vehid = i;
                                break;
                        }
                }
        }
        return vehid;
}

stock GetFreeAPB()
{
        new
                id = -1;
        for(new i = 1; i < MAX_SERVER_APB; i++)
        {
                if(_APB[i][ID] != 0)
                        continue;
                else
                        id = i;
                break;
        }
        return id;
}

stock GetDate()
{
    new dY, dM, dD, seconds, minutes, hours, str[25];
    gettime(hours, minutes, seconds);
    getdate(dY, dM, dD);
    format(str, sizeof(str), "%d/%d/%d %d:%d:%d", dD, dM, dY, hours, minutes, seconds);
    return str;
}

stock IsNumeric(const string[])
{
        for (new i = 0, j = strlen(string); i < j; i++)
        {
                if (string[i] > '9' || string[i] < '0')
                        return 0;
        }
        return 1;
}

forward Unfreeze(playerid);
public Unfreeze(playerid)
{
	return TogglePlayerControllable(playerid, true);
}

stock UpdateNamelabel(playerid)
{
    if(!IsValidDynamic3DTextLabel(playerNametag[playerid]))
	{
		format(playerTag[playerid], 128, "(( [%d] %s ))\n[9999 HP] - [9999 AP]", playerid, GetPlayerNameEx(playerid));
		playerNametag[playerid] = CreateDynamic3DTextLabel(playerTag[playerid], GetPlayerColor(playerid), 0.0, 0.0, 0.1, 15.0, playerid);
	}
	/*new donorname[22];
	switch(cInfo[playerid][cDonator])
	{
	    case 1: donorname = "[BRONZE]";
	    case 2: donorname = "[SILVER]";
	    case 3: donorname = "[GOLD]";
	    default: donorname = "";
	}*/
	if(AdminDuty[playerid])
	{
	    format(playerTag[playerid], 128, "(( [%d] %s ))\n(Admin Duty)", playerid, pInfo[playerid][pName]);
	}
	else if(!AdminDuty[playerid] && !DevMode[playerid])
	{
		if(GetHealth(playerid) > 0)
		{
			if(MaskOn[playerid])
		    	format(playerTag[playerid], 128, "(( Masked_%d ))", cInfo[playerid][cMask]);

			else
			    format(playerTag[playerid], 128, "(( [%d] %s ))", playerid, ReturnName(playerid));
		}
		else if(GetArmour(playerid) > 0)
		{
			if(MaskOn[playerid])
		    	format(playerTag[playerid], 128, "(( Masked_%d ))", cInfo[playerid][cMask]);

			else
			    format(playerTag[playerid], 128, "(( [%d] %s ))", playerid, ReturnName(playerid));
		}
	}

	if(!OnDuty[playerid] && !AdminDuty[playerid] && !ModeratorDuty[playerid] && cInfo[playerid][cDonator] > 0)
	    UpdateDynamic3DTextLabelText(playerNametag[playerid], 0xE89F38DD, playerTag[playerid]);

	else if(AdminDuty[playerid])
 		UpdateDynamic3DTextLabelText(playerNametag[playerid], 0x33AA33DD, playerTag[playerid]);

	else if(ModeratorDuty[playerid])
	    UpdateDynamic3DTextLabelText(playerNametag[playerid], 0xA52A2ADD, playerTag[playerid]);

	else if(OnDuty[playerid])
	{
		switch(cInfo[playerid][cFaction])
		{
		    case 1: UpdateDynamic3DTextLabelText(playerNametag[playerid], 0x8D8DFFDD, playerTag[playerid]);
		    case 2: UpdateDynamic3DTextLabelText(playerNametag[playerid], 0xFFFFFFDD, playerTag[playerid]);
		}
	}

	else if(!ModeratorDuty[playerid] && !AdminDuty[playerid] && !OnDuty[playerid])
	    UpdateDynamic3DTextLabelText(playerNametag[playerid], 0xFFFFFFDD, playerTag[playerid]);
	else
	{
	    UpdateDynamic3DTextLabelText(playerNametag[playerid], 0xFFFFFFDD, playerTag[playerid]);
	}
	return 1;
}

forward CargoTimer(playerid);
public CargoTimer(playerid)
        return LoadingCargo[playerid] = 0;

stock SetPlayerToFacePlayer(playerid, targetid)
{
    new Float: pX, Float: pY, Float: pZ, Float: dX, Float: dY, Float: dZ, Float: ang;

    if(!IsPlayerConnected(playerid) || !IsPlayerConnected(targetid)) return 0;

    GetPlayerPos(targetid, dX, dY, dZ);
    GetPlayerPos(playerid, pX, pY, pZ);

    if( dY > pY ) ang = (-acos((dX - pX) / floatsqroot((dX - pX)*(dX - pX) + (dY - pY)*(dY - pY))) - 90.0);
    else if( dY < pY && dX < pX ) ang = (acos((dX - pX) / floatsqroot((dX - pX)*(dX - pX) + (dY - pY)*(dY - pY))) - 450.0);
    else if( dY < pY ) ang = (acos((dX - pX) / floatsqroot((dX - pX)*(dX - pX) + (dY - pY)*(dY - pY))) - 90.0);

    if(dX > pX) ang = (floatabs(floatabs(ang) + 180.0));
    else ang = (floatabs(ang) - 180.0);

    SetPlayerFacingAngle(playerid, ang);
    return 1;
}

forward DownEnd(playerid);
public DownEnd(playerid)
{
    KillTimer(DownTimer[playerid]);
    SetPlayerHealth(playerid, 26.0);
    SetPlayerDrunkLevel (playerid, 0);
    CPF(playerid, COLOR_GREEN, "You have been recovered and feeling better now.");
    TogglePlayerControllable(playerid, true);
    cmd_stopanim(playerid, "");
    Downed[playerid] = false;
	return 1;
}

stock GetHealth(playerid)
{
	new Float:gHealth;
	GetPlayerHealth(playerid, gHealth);
	new newHealth = floatround(gHealth, floatround_round);
	return newHealth;
}

stock GetArmour(playerid)
{
	new Float:gArmour;
	GetPlayerArmour(playerid, gArmour);
	new newArmour = floatround(gArmour, floatround_round);
	return newArmour;
}

forward TaxiCheck(playerid);
public TaxiCheck(playerid)
{
	if(!IsPlayerInAnyVehicle(TaxiTarget[playerid]) || !IsTaxiAvailable(GetPlayerVehicleID(playerid)))
	{
		KillTimer(TaxiTimer[playerid]);
		new player = TaxiTarget[playerid];
		if(TaxiCount[player] > 0)
		{
		    format(gString, sizeof(gString), "~g~$%d", TaxiCount[player]);
		    GameTextForPlayer(playerid, gString, 4500, 4);
		    GameTextForPlayer(player, gString, 4500, 4);
		    cInfo[playerid][cPaycheck] += TaxiCount[player];
		    CPF(playerid, COLOR_GREEN, "$%d were added to your paycheck.", TaxiCount[player]);
		    cInfo[player][cMoney] -= TaxiCount[player];
		    TaxiCount[player] = 0;
		}
		TaxiTarget[playerid] = -1;
	}
	else
	{
	    new player = TaxiTarget[playerid];
	    if(TaxiCount[player] > cInfo[player][cMoney])
		{
		    KillTimer(TaxiTimer[playerid]);
		    CPF(playerid, COLOR_GRAY, "%s does not have enough money to pay for the current fare, therefore he got kicked out of the cab.", GetPlayerNameEx(player));
		    CPF(player, COLOR_GRAY, "You were kicked out from the cab because you didn't have enough money to pay for current fare.");
		    format(gString, sizeof(gString), "~g~$%d", TaxiCount[player]);
		    GameTextForPlayer(playerid, gString, 4500, 4);
		    GameTextForPlayer(player, gString, 4500, 4);
		    cInfo[playerid][cPaycheck] += TaxiCount[player];
		    CPF(playerid, COLOR_GREEN, "$%d were added to your paycheck.", TaxiCount[player]);
		    cInfo[player][cMoney] -= TaxiCount[player];
		    TaxiCount[player] = 0;
		    TaxiTarget[playerid] = -1;
		}
		else
		{
		    TaxiCount[player] += TaxiFare[playerid];
		    format(gString, sizeof(gString), "~w~Fare ~g~$%d", TaxiCount[player]);
		    GameTextForPlayer(playerid, gString, 1000, 4);
		    GameTextForPlayer(player, gString, 1000, 4);
		}
	}
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
    if(!IsPlayerInAnyVehicle(playerid))
    {
                for(new i = 0; i < MAX_BOOMBOX; i++)
                {
                    if(areaid == Boombox[i][Bareaid])
                    {
                                StopAudioStreamForPlayer(playerid);
                        if(!isnull(Boombox[i][Bstationurl]))PlayAudioStreamForPlayer(playerid, Boombox[i][Bstationurl], Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2], Boombox[i][Bvolume] * 2.5, 1);
                                return 1;
                    }
                }
        }
        return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    if(!IsPlayerInAnyVehicle(playerid))StopAudioStreamForPlayer(playerid);
        return 1;
}

/*public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
        if(response == EDIT_RESPONSE_FINAL)
        {
                new boomboxID = BoomboxID[playerid];
            for(new j = 0; j < MAX_BOOMBOX; j++)
                {
                        if(!isnull(Boombox[j][Bowner]) && boomboxID != j && IsPointInRangeOfPoint(50, x, y, z, Boombox[j][Bpos][0], Boombox[j][Bpos][1], Boombox[j][Bpos][2]))
                        {
                                SetDynamicObjectPos(objectid, Boombox[boomboxID][Bpos][0], Boombox[boomboxID][Bpos][1], Boombox[boomboxID][Bpos][2]);
                                SetDynamicObjectRot(objectid, Boombox[boomboxID][Brotation][0], Boombox[boomboxID][Brotation][1], Boombox[boomboxID][Brotation][2]);
                        BoomboxID[playerid] = -1;
                                return SendClientMessage(playerid, COLOR_GRAY, "You can't place a boombox too close to other boombox.");
                        }
                }

            Boombox[boomboxID][Bpos][0] = x;
            Boombox[boomboxID][Bpos][1] = y;
            Boombox[boomboxID][Bpos][2] = z;
            Boombox[boomboxID][Brotation][0] = rx;
            Boombox[boomboxID][Brotation][1] = ry;
            Boombox[boomboxID][Brotation][2] = rz;
                SetDynamicObjectPos(objectid, Boombox[boomboxID][Bpos][0], Boombox[boomboxID][Bpos][1], Boombox[boomboxID][Bpos][2]);
                SetDynamicObjectRot(objectid, Boombox[boomboxID][Brotation][0], Boombox[boomboxID][Brotation][1], Boombox[boomboxID][Brotation][2]);

                DestroyDynamicArea(Boombox[boomboxID][Bareaid]);
                Boombox[boomboxID][Bareaid] = CreateDynamicSphere(Boombox[boomboxID][Bpos][0], Boombox[boomboxID][Bpos][1], Boombox[boomboxID][Bpos][2], Boombox[boomboxID][Bvolume] * 2.5 + 1, -1, -1);

        BoomboxID[playerid] = -1;

                ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Crouch_In", 4.0, 0, 0, 0, 0, 0, 1);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Crouch_In", 4.0, 0, 0, 0, 0, 0, 1);
        }
        else if(response == EDIT_RESPONSE_CANCEL)
        {
            new boomboxID = BoomboxID[playerid];
                SetDynamicObjectPos(objectid, Boombox[boomboxID][Bpos][0], Boombox[boomboxID][Bpos][1], Boombox[boomboxID][Bpos][2]);
                SetDynamicObjectRot(objectid, Boombox[boomboxID][Brotation][0], Boombox[boomboxID][Brotation][1], Boombox[boomboxID][Brotation][2]);
        BoomboxID[playerid] = -1;
        }
        return 1;
}*/

stock SetBoomboxStation(playerid, boomboxid, stationurl[264])
{
        if(isnull(Boombox[boomboxid][Bowner]))return 0;

        format(Boombox[boomboxid][Bstationurl], 264, stationurl);
        DestroyDynamicArea(Boombox[boomboxid][Bareaid]);
        Boombox[boomboxid][Bareaid] = CreateDynamicSphere(Boombox[boomboxid][Bpos][0], Boombox[boomboxid][Bpos][1], Boombox[boomboxid][Bpos][2], Boombox[boomboxid][Bvolume] * 2.5 + 1, -1, -1);

        BoomboxID[playerid] = -1;
        return 1;
}

stock GiveBoombox(playerid, model = 1)
{
	if(cInfo[playerid][cBoombox] == 1)
	{
    	if(model == 1)
	    {
	            SetPlayerAttachedObject(playerid, 9, 2226, 6, 0.4, 0, 0, 0, 270, 180);
	            BoomboxModel[playerid] = 2226;
	    }
	    else if(model == 2)
	    {
	            SetPlayerAttachedObject(playerid, 9, 2103, 6, 0.54, 0, 0, 0, 270, 180);
	            BoomboxModel[playerid] = 2103;
	    }
    }
    else CPF(playerid, COLOR_GRAY, "You don't have a Boombox.");
}

stock getIP(playerid)
{
	new varIP[22];
	GetPlayerIp(playerid, varIP, sizeof(varIP));
	return varIP;
}

forward refreshMySQL();
public refreshMySQL()
{
	mysql_ping();
	return 1;
}

stock GetHouseCount(playerid)
{
	new count = 0;
	if(!Logged[playerid]) return 0;
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
 	    if(hInfo[i][ID] <= 0) continue;
 	    if(hInfo[i][Owner] != cInfo[i][SQLID]) continue;
 	    count++;
 	}
	return count;
}

stock GetBizzCount(playerid)
{
	new count = 0;
	if(!Logged[playerid]) return 0;
 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
 	{
 	    if(bInfo[i][ID] <= 0) continue;
 	    if(bInfo[i][Owner] != cInfo[i][SQLID]) continue;
 	    count++;
 	}
	return count;
}

stock CountHouseFurnitures(house_id)
{
	new count = 0;
 	for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
 	{
		if(Furn[i][ID] <= 0) continue;
		if(Furn[i][HouseID] != house_id) continue;
		count++;
	}
	return count;
}

stock GetSafeID(house_id)
{
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
		if(Safe[i][ID] <= 0) continue;
		if(Safe[i][HouseID] != house_id) continue;
		return i;
	}
	return 0;
}

stock IsHouseHaveSafe(house_id)
{
	new count = 0;
 	for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
 	{
		if(Furn[i][ID] <= 0) continue;
		if(Furn[i][HouseID] != house_id) continue;
		if(Furn[i][Authority] != 2) continue;
		count++;
	}
	return count;
}

stock ClearItems(playerid)
{
    for(new i = 0,j = MAX_LIST_ITEMS; i < j; i ++)
    {
		pList[playerid][i] = -1;
    }
    return 1;
}

stock ReturnName(playerid)
{
	new str[25] = "None", tmp[2][128], name[25];
	format(name, 25, GetName(playerid));
    new strpos = strfind(name, "_", true);
    split(GetName(playerid), tmp, '_');
 	format(str, 25, "%s %c.", tmp[0], name[strpos+1]);
	return str;
}

forward Tutorialism(playerid);
public Tutorialism(playerid)
{
	switch(Tutorial[playerid])
	{
	    case 1:
	    {
	        KillTimer(TutorialTimer[playerid]);
	        ClearChat(playerid);
	        CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Hello and welcome to Project Reality Roleplay, we are glad to have you here.");
	        CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Please choose your gender.");
			ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_LIST, "Gender", "Male\nFemale", "Next", "Exit");
	    }
	    case 3:
	    {
	        new gstr[516];
	        format(gstr, 516, "Members of the staff team ensure that no rules are broken and that everyone is treated fairly, equally & with the respect & professionalism that they deserve.\nThere are no exceptions and favoritism when it comes to rule breaking, everyone is treated on the same basis. Unlike any other server,\nwe are trying to be unique by thinking of new styles and systems on a regular basis in order to ensure authenticity and an enjoyable atmosphere for every player.");
	        ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Project Reality Roleplay", gstr, "...", "");
	        Tutorial[playerid] = 4;
	        TutorialTimer[playerid] = SetTimerEx("Tutorialism", 15000, false, "i", playerid);
	    }
	    case 4:
	    {
	        new gstr[516];
	        format(gstr, 516, "Some factions and organisations in the server may always exist by default that are required to be a part of your roleplaying experience.\nA few of these include government organisations such as the Los Santos Police Department and the Los Santos Fire Department.\nAll of these organisations are actively seeking new members and membership will be subject to applications, interviews\nand training depending on the agency you wish to join.");
            ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Project Reality Roleplay", gstr, "...", "");
			Tutorial[playerid] = 5;
	        TutorialTimer[playerid] = SetTimerEx("Tutorialism", 15000, false, "i", playerid);
			InterpolatePlayerCamera(playerid, 1890.737792, -1893.453247, 48.076305, 1885.885620, -1892.784912, 47.071220, 1475.892089, -1641.092651, 31.456617, 1480.412597, -1643.059326, 30.621744, 8000);
		}
	    case 5:
	    {
	        Tutorial[playerid] = 6;
	        TutorialTimer[playerid] = SetTimerEx("Tutorialism", 15000, false, "i", playerid);
	        InterpolatePlayerCamera(playerid, 1475.892089, -1641.092651, 31.456617, 1480.412597, -1643.059326, 30.621744, 1259.456787, -1364.897094, 37.500770, 1254.978393, -1362.931152, 36.461784, 8000);
	    }
	    case 6:
		{
		    KillTimer(TutorialTimer[playerid]);
		    Tutorial[playerid] = 0;
	        cInfo[playerid][cFirstLogin] = 0;
			SetSpawnInfo(playerid, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			TogglePlayerSpectating(playerid, false);
			SpawnPlayer(playerid);
			StopAudioStreamForPlayer(playerid);
			ClearChat(playerid);
			new star[516];
			format(star, 516, ""COL_WHITE"Welcome, "COL_GREEN"%s"COL_WHITE" to Project Reality Roleplay!\nAfter you passed the tutorial and you got the basis of our server, you are more\nthan welcome to start playing and begin your life within Project Reality Roleplay.\nIf you have any concerns or requests, feel free to ask administrators and moderators.", cInfo[playerid][cCreator]);
			ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Welcome!", star, "Okay", "");
			CPF(playerid, 0xFCF87FFF, "You have arrived to Project Reality, welcome aboard!");
			CPF(playerid, -1, "INFO: Visit our User Control Panel (UCP) and change your forum name - www.pr-rp.com");
			CPF(playerid, -1, "INFO: You must be offline in-game while editing information on the UCP, otherwise it's not going to save.");
	    }
	}
	return 1;
}

stock split( const src[ ], dest[ ][ ], delimiter = ' ', size = sizeof( dest[ ] ) )
{
    new
                i, li,
                index;
        new const
                len = strlen( src );
    while( ++i < len ) if( src[ i ] == delimiter )
    {
                memcpy( dest[ index ], src[ li ], 0, 4 * (i - li), size );
                li = ( i + 1 );
                index++;
    }

        memcpy( dest[ index ], src[ li ], 0, 4 * (i - li), size );
    return true;
}

stock UpdateSafe(safeID)
{
	if(Safe[safeID][sLocked])
	{
	    format(gString, sizeof(gString), ""COL_WHITE"Safe {b5c8b6}%d\n{c62222}Locked", Safe[safeID][ID]);
	    UpdateDynamic3DTextLabelText(Safe[safeID][sLabel], 0xFFFFFFFF, gString);
	}
	else
	{
	    format(gString, sizeof(gString), ""COL_WHITE"Safe {b5c8b6}%d\n{39c622}Unlocked", Safe[safeID][ID]);
	    UpdateDynamic3DTextLabelText(Safe[safeID][sLabel], 0xFFFFFFFF, gString);
	}
	return 1;
}

public OnPlayerModelSelectionEx(playerid, response, extraid, modelid)
{
	if(extraid == 1)
	{
	    if(!response) return ShowPlayerDialog(playerid, DIALOG_FURNITUREBUY, DIALOG_STYLE_LIST, "Buy Furniture - Categories", "Beds\nDecorations\nComfort\nDoors\nElectronics\nCabinets\nKitchen\nPlumbing\nGyms\nOther\nSpecial", "Select", "Back");
	    new temp = GetFurnID(modelid);
		if(InHouse[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You are not inside a House.");
		if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_RED, "You are not the owner of this house.");
		if(Furnitures[temp][Authority] == 2 && IsHouseHaveSafe(InHouse[playerid])) return CPF(playerid, COLOR_RED, "This house already has a safe.");
		if(Furnitures[temp][Price] > cInfo[playerid][cMoney]) return CPF(playerid, COLOR_RED, "You can't afford this furniture.");
		format(gString, sizeof(gString), "You have bought "COL_RED"%s"COL_WHITE" for "COL_GREEN"$%d"COL_WHITE", press "COL_YELLOW"ESC{FFFFFF} to cancel the purchase.", Furnitures[temp][Name], Furnitures[temp][Price]);
		SendClientMessage(playerid, -1, gString);
		CPF(playerid, COLOR_FADE1, "HINT: Press SPACEBAR to move your screen when editing the object.");
		new Float:fPos[3];
		GetPlayerPos(playerid, fPos[0], fPos[1], fPos[2]);
		furnObject[playerid] = CreateDynamicObject(Furnitures[temp][Object], fPos[0], fPos[1], fPos[2]-1.0, 0.0, 0.0, 0.0, hInfo[InHouse[playerid]][VirtualWorld], hInfo[InHouse[playerid]][INT], -1, 200.0);
	 	EditDynamicObject(playerid, furnObject[playerid]);
	 	BuyingObject[playerid] = temp;
	    EditingFurn[playerid] = false;
	    BuyingFurn[playerid] = true;
	}
	return 1;
}

stock GetFurnID(modelid)
{
    for(new i = 0,j = sizeof(Furnitures); i < j; i ++)
    {
		if(Furnitures[i][Object] != modelid) continue;
		else return i;
    }
    return 1;
}

stock GetBagItemCount(playerid)
{
	new count = 0;
    for(new i = 0; i < MAX_ITEMS; i++)
    {
        if(Bag[playerid][bagItem][i] <= 0) continue;
        count++;
    }
	return count;
}

stock _AddDatabaseItem(item, amount, owner)
{
	format(_query, sizeof(_query), "INSERT INTO `bagitems`(`Owner`, `Item`, `ItemAmount`) VALUES (%d, %d, %d)", owner, item, amount);
	mysql_query(_query);
	return 1;
}

stock _RemoveDatabaseItem(id)
{
	format(_query, sizeof(_query), "DELETE FROM `bagitems` WHERE `ID` = %d", id);
	mysql_query(_query);
	return 1;
}

stock _AddBagItem(playerid, item, amount)
{
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        if(Bag[playerid][bagItem][i] > 0) continue;
        else
        {
			format(_query, sizeof(_query), "INSERT INTO `bagitems`(`Owner`, `Item`, `ItemAmount`) VALUES (%d, %d, %d)", cInfo[playerid][SQLID], item, amount);
			mysql_query(_query);
	        Bag[playerid][bagItemID][i] = mysql_insert_id();
	        Bag[playerid][bagItem][i] = item;
	        Bag[playerid][bagItemAmount][i] = amount;
	        Bag[playerid][bagItemLoaded][i] = 0;
	        Bag[playerid][bagItemLoadAmount][i] = 0;
	        Bag[playerid][bagItemAttached][i] = 0;
	        Bag[playerid][bagItemServer][i] = 0;
	        break;
        }
    }
	return 1;
}

stock _AddBagItemPD(playerid, item, amount)
{
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        if(Bag[playerid][bagItem][i] > 0) continue;
        else
        {
			format(_query, sizeof(_query), "INSERT INTO `bagitems`(`Owner`, `Item`, `ItemAmount`) VALUES (%d, %d, %d)", cInfo[playerid][SQLID], item, amount);
			mysql_query(_query);
	        Bag[playerid][bagItemID][i] = mysql_insert_id();
	        Bag[playerid][bagItem][i] = item;
	        Bag[playerid][bagItemAmount][i] = amount;
	        Bag[playerid][bagItemLoaded][i] = 0;
	        Bag[playerid][bagItemLoadAmount][i] = 0;
	        Bag[playerid][bagItemAttached][i] = 0;
	        Bag[playerid][bagItemServer][i] = 1;
	        break;
        }
    }
	return 1;
}

stock _RemoveBagItem(playerid, id)
{
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        if(Bag[playerid][bagItem][i] <= 0) continue;
        if(Bag[playerid][bagItemID][i] == id)
        {
	        Bag[playerid][bagItemID][i] = 0;
	        Bag[playerid][bagItem][i] = 0;
	        Bag[playerid][bagItemAmount][i] = 0;
	        Bag[playerid][bagItemLoaded][i] = 0;
	        Bag[playerid][bagItemLoadAmount][i] = 0;
	        Bag[playerid][bagItemAttached][i] = 0;
        }
    }
    return 1;
}

stock GetItemName(item)
{
	new nam[64] = "None";
    for(new i = 0,j = sizeof(Items); i < j; i ++)
    {
        if(Items[i][Item] == item)
        {
            format(nam, 64, Items[i][Name]);
            break;
        }
    }
    return nam;
}

stock GetItemObject(item)
{
    for(new i = 0,j = sizeof(Items); i < j; i ++)
    {
        if(Items[i][Item] == item)
        {
            return Items[i][Object];
        }
    }
    return 1;
}

stock SavePlayerBag(playerid)
{
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        if(Bag[playerid][bagItem][i] <= 0) continue;
		format(_query, sizeof(_query), "UPDATE `bagitems` SET `Item`=%d,`ItemAmount`=%d,`ItemLoaded`=%d,`ItemLoadAmount`=%d WHERE `ID` = %d",
		Bag[playerid][bagItem][i], Bag[playerid][bagItemAmount][i], Bag[playerid][bagItemLoaded][i], Bag[playerid][bagItemLoadAmount][i], Bag[playerid][bagItemID][i]);
		mysql_query(_query);
	}
	return 1;
}

stock NextBagPage(playerid)
{
    //new count = 0, test = 0, bagitems[1024], bagtitle[64];
    Bag_Page[playerid] = Bag_Page[playerid] + 1;
    ClearItems(playerid);
    ShowBag(playerid);
   	/*format(gString, sizeof(gString), "{33aa33}ID\t\tName (Amount)\n");
    strcat(bagitems, gString);
    pList[playerid][test] = 0;
 	test++;
	for(new i = (Bag_Page[playerid] * 10); i < MAX_ITEMS; i++)
	{
	    if(count >= (Bag_Page[playerid] * 10) + 10) break;
		if(Bag[playerid][bagItem][i] <= 0) continue;
		new loadtext[32] = "";
		if(Bag[playerid][bagItem][i] > 0 && Bag[playerid][bagItem][i] <= 34)
		{
			if(Bag[playerid][bagItemLoaded][i] >= 1)
			{
				format(loadtext, 32, ""COL_RED"[LOADED]");
			}
			else
			{
                format(loadtext, 32, ""COL_GREEN"[NOT LOADED]");
			}
		}
	    count++;
        pList[playerid][test] = i;
	 	test++;
	 	format(gString, sizeof(gString), "%d.\t\t%s%s (%d) %s\n", count, Bag[playerid][bagItemAttached][i] ? (""COL_RED"(E)"COL_WHITE"") : (""), GetItemName(Bag[playerid][bagItem][i]), Bag[playerid][bagItemAmount][i], loadtext);
	 	strcat(bagitems, gString);
	}
	if(GetBagItemCount(playerid) > ((Bag_Page[playerid] * 10) + 10))
	{
	    format(gString, sizeof(gString), "Next Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 200;
	    test++;
	}
	if(Bag_Page[playerid] > 0)
	{
	    format(gString, sizeof(gString), "Back Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 201;
	}
	format(bagtitle, 64, "Inventory (Page %d)", Bag_Page[playerid] + 1);
	ShowPlayerDialog(playerid, DIALOG_BAG, DIALOG_STYLE_LIST, bagtitle, bagitems, "Select", "Close");*/
	return 1;
}

stock BackBagPage(playerid)
{
    //new count = 0, test = 0, bagitems[1024], bagtitle[64];
    Bag_Page[playerid] = Bag_Page[playerid] - 1;
    ClearItems(playerid);
    ShowBag(playerid);
    /*format(gString, sizeof(gString), "{33aa33}ID\t\tName (Amount)\n");
    strcat(bagitems, gString);
    pList[playerid][test] = 0;
 	test++;
	for(new i = (Bag_Page[playerid] * 10); i < MAX_ITEMS; i++)
	{
	    if(count >= (Bag_Page[playerid] * 10) + 10) break;
		if(Bag[playerid][bagItem][i] <= 0) continue;
		new loadtext[32] = "";
		if(Bag[playerid][bagItem][i] > 0 && Bag[playerid][bagItem][i] <= 34)
		{
			if(Bag[playerid][bagItemLoaded][i] >= 1)
			{
				format(loadtext, 32, ""COL_RED"[LOADED]");
			}
			else
			{
                format(loadtext, 32, ""COL_GREEN"[NOT LOADED]");
			}
		}
	    count++;
        pList[playerid][test] = i;
	 	test++;
	 	format(gString, sizeof(gString), "%d.\t\t%s%s (%d) %s\n", count, Bag[playerid][bagItemAttached][i] ? (""COL_RED"(E)"COL_WHITE"") : (""), GetItemName(Bag[playerid][bagItem][i]), Bag[playerid][bagItemAmount][i], loadtext);
	 	strcat(bagitems, gString);
	}
	if(GetBagItemCount(playerid) > ((Bag_Page[playerid] * 10) + 10))
	{
	    format(gString, sizeof(gString), "Next Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 200;
	    test++;
	}
	if(Bag_Page[playerid] > 0)
	{
	    format(gString, sizeof(gString), "Back Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 201;
	}
	format(bagtitle, 64, "Inventory (Page %d)", Bag_Page[playerid] + 1);
	ShowPlayerDialog(playerid, DIALOG_BAG, DIALOG_STYLE_LIST, bagtitle, bagitems, "Select", "Close");*/
	return 1;
}

stock ShowBag(playerid)
{
    new count = 0, test = 0, bagitems[1024], bagtitle[64], bullets;
    ClearItems(playerid);
    format(gString, sizeof(gString), "{33aa33}Slot\t\tName (Amount)\n");
    strcat(bagitems, gString);
    pList[playerid][test] = 0;
 	test++;
	for(new i = (Bag_Page[playerid] * 10); i < MAX_ITEMS; i++)
	{
	    if(count >= (Bag_Page[playerid] * 10) + 10) break;
		if(Bag[playerid][bagItem][i] <= 0) continue;
		//new loadtext[32] = "";
		/*if(Bag[playerid][bagItem][i] > 0 && Bag[playerid][bagItem][i] <= 34)
		{
			if(Bag[playerid][bagItemLoaded][i] >= 1)
			{
				format(loadtext, 32, ""COL_RED"[LOADED]");
			}
			else
			{
                format(loadtext, 32, ""COL_GREEN"[NOT LOADED]");
			}
		}*/
	    count++;
        pList[playerid][test] = i;
	 	test++;
		switch(Bag[playerid][bagItem][i])
		{
		    case 101: bullets = 14;
		    case 100: bullets = 10;
		    case 102: bullets = 50;
		    case 103: bullets = 5;
		}
	 	if(Bag[playerid][bagItem][i] >= 100 && Bag[playerid][bagItem][i] < 104)
	 	{
	 	    format(gString, sizeof(gString), "%d\t\t%s [%d/%d]\n", count, GetItemName(Bag[playerid][bagItem][i]), Bag[playerid][bagItemAmount][i], bullets);
	 	}
	 	else
	 	{
	 	    format(gString, sizeof(gString), "%d\t\t%s %s\n", count, GetItemName(Bag[playerid][bagItem][i]), Bag[playerid][bagItemAttached][i] ? ("(In Use)") : (""));
	 	}
	 	strcat(bagitems, gString);
	}
	if(GetBagItemCount(playerid) > ((Bag_Page[playerid] * 10) + 10))
	{
	    format(gString, sizeof(gString), "Next Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 200;
	    test++;
	}
	if(Bag_Page[playerid] > 0)
	{
	    format(gString, sizeof(gString), "Back Page\n");
	    strcat(bagitems, gString);
	    pList[playerid][test] = 201;
	}
	format(bagtitle, 64, "Inventory (Page %d)", Bag_Page[playerid] + 1);
	ShowPlayerDialog(playerid, DIALOG_BAG, DIALOG_STYLE_LIST, bagtitle, bagitems, "Select", "Close");
	return 1;
}

stock GetVehicleRoof(vehicleid, &Float:x, &Float:y, &Float:z)
{
    if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
            return (x = 0.0, y = 0.0, z = 0.0), 0;

    static
        Float:vlpos[6];

    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, vlpos[0], vlpos[1], vlpos[2]);
    GetVehiclePos(vehicleid, vlpos[3], vlpos[4], vlpos[5]);

    x = vlpos[3];
    y = vlpos[4];
    z = vlpos[5] + floatsqroot(vlpos[2]);

    return 1;
}

stock _PickItem(playerid)
{
	new pickDialog[1024], count = 0;
	ClearItems(playerid);
    format(gString, sizeof(gString), "{33aa33}ID\t\tName (Amount)\n");
    strcat(pickDialog, gString);
	for(new i = 0; i < MAX_DROPPED_ITEMS; i++)
	{
	    if(DropItem[i][dItem] <= 0) continue;
	    if(!IsPlayerInRangeOfPoint(playerid, 4.0, DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2])) continue;
	    count++;
	    pList[playerid][count] = i;
	    format(gString, sizeof(gString), "%d. \t\t%s (%d)\n", count, GetItemName(DropItem[i][dItem]), DropItem[i][dAmount]);
	    strcat(pickDialog, gString);
	}
	if(count <= 0) CPF(playerid, COLOR_RED, "Either there are no items around to pick up or this item is not pickupable.");
	else ShowPlayerDialog(playerid, DIALOG_BAGPICK, DIALOG_STYLE_LIST, "Nearby Items", pickDialog, "Pick-up", "Close");
	return 1;
}

stock _DropItem(playerid, amount)
{
	new itemid = DroppedItem[playerid];
	if(Bag[playerid][bagItemAttached][itemid] >= 1)
	{
		ResetPlayerWeapons(playerid);
		AttachingWeapon[playerid] = -1;
		RemovePlayerAttachedObject(playerid, 2);
		AttachingWeapon[playerid] = -1;
		Bag[playerid][bagItemAttached][itemid] = 0;
	}
	CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Dropped %s (Amount: %d)", GetItemName(Bag[playerid][bagItem][itemid]), amount);
	for(new i = 0; i < MAX_DROPPED_ITEMS; i++)
	{
	    if(DropItem[i][dItem] > 0) continue;
	    else
	    {
	        GetPlayerPos(playerid, DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2]);
       	 	DropItem[i][dItem] = Bag[playerid][bagItem][itemid];
       	 	DropItem[i][dLoaded] = Bag[playerid][bagItemLoaded][itemid];
       	 	DropItem[i][dLoadAmount] = Bag[playerid][bagItemLoadAmount][itemid];
       	 	DropItem[i][dAmount] = amount;
			switch(DropItem[i][dItem])
			{
				case 1..46,104,105: DropItem[i][dObject] = CreateDynamicObject(GetItemObject(Bag[playerid][bagItem][itemid]), DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2]-1, 80.0, 0.0, 0.0, -1, -1, -1, 200.0);
				case 100..103: DropItem[i][dObject] = CreateDynamicObject(GetItemObject(Bag[playerid][bagItem][itemid]), DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2]-0.9, 0.0, 0.0, 0.0, -1, -1, -1, 200.0);
				//case 104..105: DropItem[i][dObject] = CreateDynamicObject(GetItemObject(Bag[playerid][bagItem][itemid]), DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2]-0.9, 0.0, 0.0, 0.0, -1, -1, -1, 200.0);
			}
			format(gString, sizeof(gString), "%s\n{63E676}/pickup", GetItemName(Bag[playerid][bagItem][itemid]));
			DropItem[i][dLabel] = CreateDynamic3DTextLabel(gString, 0xFFFFFF99, DropItem[i][dPos][0], DropItem[i][dPos][1], DropItem[i][dPos][2]-0.5, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 200.0);
	        break;
	    }
	}
	if(Bag[playerid][bagItemAmount][itemid] > amount)
	{
        Bag[playerid][bagItemAmount][itemid] -= amount;
	}
	else if(Bag[playerid][bagItemAmount][itemid] <= amount)
	{
	    _RemoveDatabaseItem(Bag[playerid][bagItemID][itemid]);
		_RemoveBagItem(playerid, Bag[playerid][bagItemID][itemid]);
	}
	return 1;
}

stock GetPlayerGender(playerid)
{
	new gender[6];
	switch(cInfo[playerid][cGender])
	{
	    case 1: gender = "his";
		case 2: gender = "her";
	}
	return gender;
}

stock HaveRadio(playerid)
{
	for(new i = 0; i < MAX_ITEMS; i++)
	{
	    if(Bag[playerid][bagItem][i] <= 0) continue;
	    if(Bag[playerid][bagItem][i] == 105)
			return true;
	}
	return false;
}

public FadeScreen(playerid, type)
{
	switch(type)
	{
	    case 1: // Fade In
	    {
            if(GetPVarInt(playerid, "FADEIN") == 0)
            {
                FadeTime[playerid]=0;
                SetPVarInt(playerid, "FADEIN", 1);
                FadeDraw[playerid] = TextDrawCreate(-10.000000, 1.000000, "-INPUT TEXT-");
		        TextDrawBackgroundColor(FadeDraw[playerid], 0);
		        TextDrawFont(FadeDraw[playerid], 1);
		        TextDrawLetterSize(FadeDraw[playerid], 0.500000, 50.000000);
		        TextDrawColor(FadeDraw[playerid], 0);
		        TextDrawSetOutline(FadeDraw[playerid], 1);
		        TextDrawSetProportional(FadeDraw[playerid], 1);
		        TextDrawUseBox(FadeDraw[playerid], 1);
		        TextDrawBoxColor(FadeDraw[playerid], 255);
		        TextDrawTextSize(FadeDraw[playerid], 720.000000, 0.000000);
            }
            if(GetPVarInt(playerid, "FADEOUT")) DeletePVar(playerid, "FADEOUT");
			if(FadeTime[playerid] >= 255 && FadeTime[playerid] <= 299)
			{
			    TextDrawBoxColor(FadeDraw[playerid], 255);
			    FadeTime[playerid]=300;
			    SetTimerEx("FadeScreen", 2000, false, "ii", playerid, 1);
			    return 1;
			}
			if(FadeTime[playerid] >= 300) // End the fade
			{
			    TextDrawHideForPlayer(playerid, FadeDraw[playerid]);
			    FadeTime[playerid]=0;
			    DeletePVar(playerid, "FADEIN");
			    TextDrawDestroy(FadeDraw[playerid]);
			    CallRemoteFunction("OnPlayerFade","ii",playerid, 1);
			    return 1;
			}
			if(FadeTime[playerid] == 0) TextDrawBoxColor(FadeDraw[playerid], 0), TextDrawShowForPlayer(playerid, FadeDraw[playerid]);
            FadeTime[playerid]++;
            TextDrawBoxColor(FadeDraw[playerid], FadeTime[playerid]);
            TextDrawHideForPlayer(playerid, FadeDraw[playerid]);
            TextDrawShowForPlayer(playerid, FadeDraw[playerid]);
            SetTimerEx("FadeScreen", 20, false, "ii", playerid, 1);
	    }
	    case 2: // Fade Out
	    {
	        if(GetPVarInt(playerid, "FADEOUT") == 0)
            {
                FadeTime[playerid]=255;
                SetPVarInt(playerid, "FADEOUT", 1);
                FadeDraw[playerid] = TextDrawCreate(-10.000000, 1.000000, "-INPUT TEXT-");
		        TextDrawBackgroundColor(FadeDraw[playerid], 0);
		        TextDrawFont(FadeDraw[playerid], 1);
		        TextDrawLetterSize(FadeDraw[playerid], 0.500000, 50.000000);
		        TextDrawColor(FadeDraw[playerid], 0);
		        TextDrawSetOutline(FadeDraw[playerid], 1);
		        TextDrawSetProportional(FadeDraw[playerid], 1);
		        TextDrawUseBox(FadeDraw[playerid], 1);
		        TextDrawBoxColor(FadeDraw[playerid], 255);
		        TextDrawTextSize(FadeDraw[playerid], 720.000000, 0.000000);
            }
            if(GetPVarInt(playerid, "FADEIN")) DeletePVar(playerid, "FADEIN");
			if(FadeTime[playerid] <= 0) // End the fade
			{
			    TextDrawHideForPlayer(playerid, FadeDraw[playerid]);
			    FadeTime[playerid]=0;
			    DeletePVar(playerid, "FADEOUT");
			    TextDrawDestroy(FadeDraw[playerid]);
			    CallRemoteFunction("OnPlayerFade","ii",playerid, 2);
			    return 1;
			}
			if(FadeTime[playerid] == 255) TextDrawBoxColor(FadeDraw[playerid], 255), TextDrawShowForPlayer(playerid, FadeDraw[playerid]);
            FadeTime[playerid]--;
            TextDrawBoxColor(FadeDraw[playerid], FadeTime[playerid]);
            TextDrawHideForPlayer(playerid, FadeDraw[playerid]);
            TextDrawShowForPlayer(playerid, FadeDraw[playerid]);
            SetTimerEx("FadeScreen", 20, false, "ii", playerid, 2);
	    }
	}
    return 1;
}

public OnPlayerFade(playerid, num)
{
	switch(num)
	{
	    case 1:
	    {
	        if(GetPVarInt(playerid, "PlayerLogged") == 2) return CallRemoteFunction("OnPlayerSpawn","ii",playerid, 1);
	    }
	}
	return 1;
}

public PrintHud(playerid)
{
	new string[50], string2[50], Float:health, Float:armour, rhealth, rarmour;
	if(Spawned[playerid])
	{
		GetPlayerHealth(playerid, health), GetPlayerArmour(playerid, armour);
		rhealth = floatround(health), rarmour = floatround(armour);
		switch(rhealth)
		{
		    case 0: { string="~r~IIIIIIIIII", string2=" ";  }
		    case 1 .. 10: { string="~r~~h~~h~I", string2=" ~r~IIIIIIIII"; }
		    case 11 .. 20: { string="~r~~h~~h~II", string2="  ~r~IIIIIIII"; }
		    case 21 .. 30: { string="~r~~h~~h~III", string2="   ~r~IIIIIII"; }
		    case 31 .. 40: { string="~r~~h~~h~IIII", string2="    ~r~IIIIII"; }
		    case 41 .. 50: { string="~r~~h~~h~IIIII", string2="     ~r~IIIII"; }
		    case 51 .. 60: { string="~r~~h~~h~IIIIII", string2="      ~r~IIII"; }
		    case 61 .. 70: { string="~r~~h~~h~IIIIIII", string2="       ~r~III"; }
		    case 71 .. 80: { string="~r~~h~~h~IIIIIIII", string2="        ~r~II"; }
		    case 81 .. 90: { string="~r~~h~~h~IIIIIIIII", string2="         ~r~I"; }
		    case 91 .. 200: { string="~r~~h~~h~IIIIIIIIII", string2=" "; }
		}
		TextDrawSetString(PlayerHudS[1][playerid], string), TextDrawSetString(PlayerHudS[2][playerid], string2);
		switch(rarmour)
		{
		    case 0: { string="~b~IIIIIIIIII", string2=" "; }
		    case 1 .. 10: { string="~b~~h~~h~I", string2=" ~b~IIIIIIIII"; }
		    case 11 .. 20: { string="~b~~h~~h~II", string2="  ~b~IIIIIIII"; }
		    case 21 .. 30: { string="~b~~h~~h~III", string2="   ~b~IIIIIII"; }
		    case 31 .. 40: { string="~b~~h~~h~IIII", string2="    ~b~IIIIII"; }
		    case 41 .. 50: { string="~b~~h~~h~IIIII", string2="     ~b~IIIII"; }
		    case 51 .. 60: { string="~b~~h~~h~IIIIII", string2="      ~b~IIII"; }
		    case 61 .. 70: { string="~b~~h~~h~IIIIIII", string2="       ~b~III"; }
		    case 71 .. 80: { string="~b~~h~~h~IIIIIIII", string2="        ~b~II"; }
		    case 81 .. 90: { string="~b~~h~~h~IIIIIIIII", string2="         ~b~I"; }
		    case 91 .. 200: { string="~b~~h~~h~IIIIIIIIII", string2=" "; }
		}
		TextDrawSetString(PlayerHudS[3][playerid], string), TextDrawSetString(PlayerHudS[4][playerid], string2);
	    SetSlidedMoneyBar(playerid);
	}
	return true;
}

stock GivePlayerMoneyEx(playerid, money)
{
	cInfo[playerid][cMoney]+=money;
	if(cInfo[playerid][cMoney] < 0) cInfo[playerid][cMoney]=0;
	return SetSlidedMoneyBar(playerid);
}

stock ResetPlayerMoneyEx(playerid)
{
	cInfo[playerid][cMoney]=0;
	return SetSlidedMoneyBar(playerid);
}

stock GetPlayerMoneyEx(playerid)
{
	return cInfo[playerid][cMoney];
}

stock SetSlidedMoneyBar(playerid)
{
	new string[128], result[10], amount;
	if(GetPlayerMoney(playerid) > 0) ResetPlayerMoney(playerid);
	amount = GetPlayerMoneyEx(playerid);
	switch(GetPVarInt(playerid,"HudCol"))
	{
		case 0: result="~g~~h~";
		case 1: result="~r~~h~";
		case 2: result="~w~~h~";
		case 3: result="~y~~h~";
		case 4: result="~p~~h~";
		case 5: result="~b~~h~";
	}
	if(amount >= 0 && amount <= 9) format(string, sizeof(string),"%s$0000000%d", result, amount);
	if(amount >= 10 && amount <= 99) format(string, sizeof(string),"%s$000000%d", result, amount);
	if(amount >= 100 && amount <= 999) format(string, sizeof(string),"%s$00000%d", result, amount);
	if(amount >= 1000 && amount <= 9999) format(string, sizeof(string),"%s$0000%d", result, amount);
	if(amount >= 10000 && amount <= 99999) format(string, sizeof(string),"%s$000%d", result, amount);
	if(amount >= 100000 && amount <= 999999) format(string, sizeof(string),"%s$00%d", result, amount);
	if(amount >= 1000000 && amount <= 9999999) format(string, sizeof(string),"%s$0%d", result, amount);
    return TextDrawSetString(Text:MoneyDraw[playerid], string);
}

stock checkserialban(playerid)
{
	new bannato[24];
	new pserial[128];
	new PIP[16];
	gpci(playerid, pserial, sizeof(pserial));
	GetPlayerName(playerid, bannato, 24);
    GetPlayerIp(playerid, PIP, sizeof(PIP));
    format(_query, sizeof(_query), "SELECT * FROM `serialbans` WHERE (`cID` = '%s' OR `ip` = '%s' OR `gpci` = '%s' )", cInfo[playerid][SQLID], PIP, pserial);
    mysql_query(_query);
    mysql_store_result();
    if(mysql_num_rows() > 0)
	{
		Kick(playerid);
		return 0;
	}
	mysql_free_result();
	return 1;
}
