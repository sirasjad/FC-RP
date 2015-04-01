==============================================================================
== OnGameModeExit
==============================================================================*/

public OnGameModeExit()
{
    FadeExit();
    new time = GetTickCount();
	new Day, Month, Year;
	getdate(Day, Month, Year);
    printf("-- [%d/%d/%d] Game restart / Saving overall database", Year, Month, Day);
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
 	    if(hInfo[i][ID] <= 0) continue;
      	SaveHouse(i);
 	}
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
 	    if(Safe[i][ID] <= 0) continue;
      	SaveSafe(i);
 	}
 	for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
 	{
 	    if(Furn[i][ID] <= 0) continue;
      	SaveFurniture(i);
 	}
 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
 	{
 	    if(bInfo[i][ID] <= 0) continue;
        SaveBizz(i);
 	}
 	for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
 	{
 	    if(!IsValidVehicle(i)) continue;
 	    SaveVehicle(i);
 	    DestroyObject(light[i]);
 	    siren[i] = false;
 	}
 	SaveFactions();
 	SaveInteriors();
 	if(GetLoggedCount() > 0)
 	{
	 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		{
		    if(IsPlayerConnected(i))
		    {
		        DestroyDynamicObject(furnObject[i]);
		        KillTimer(TutorialTimer[i]);
		        DestroyDynamic3DTextLabel(playerNametag[i]);
				format(playerTag[i], 128, "None");
		        NeedHelp[i] = 0;
		        KillTimer(DLic[i][dTimer]);
		        KillTimer(FishTimer[i]);
		        KillTimer(CallTimer[i]);
		        KillTimer(ReduceCredits[i]);
		        KillTimer(AFKTimer[i]);
			    SavePlayer(i, GetName(i));
				SaveCharacter(i, GetName(i));
				SavePlayer(i, cInfo[i][cCreator]);
			}
			else continue;
		}
	}
	KillTimer(AdvertTimer);
    DestroyPickup(Storage_PU);
    DestroyPickup(Garbage_PU);
    DestroyAllDynamic3DTextLabels();
    printf("-- [%d/%d/%d] Everything has been saved, restarting server", Year, Month, Day);
    printf("-- [%d/%d/%d] APPROXIMATE SAVE TIME: %d ms", Year, Month, Day, GetTickCount()-time);
	return 1;
}
