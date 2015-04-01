==============================================================================
== OnDialogResponse
==============================================================================*/

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_ARMOURY && response)
	{
		if(GetBagItemCount(playerid) >= 200)
		    return CPF(playerid, COLOR_RED, "No more room in your Inventory. (200 slots)");

	    switch(listitem)
	    {
			case 0:
			{
				new bool:count[6];
				for(new i = 0; i < MAX_ITEMS; i++)
				{
					if(Bag[playerid][bagItem][i] <= 0) continue;
					if(Bag[playerid][bagItem][i] == 105)
					    count[0] = true;

					else if(Bag[playerid][bagItem][i] == 24)
					    count[1] = true;

					else if(Bag[playerid][bagItem][i] == 3)
					    count[2] = true;

					else if(Bag[playerid][bagItem][i] == 104)
					    count[3] = true;

					else if(Bag[playerid][bagItem][i] == 105)
					    count[4] = true;

					else if(Bag[playerid][bagItem][i] == 106)
					    count[5] = true;

					else
					    continue;
				}
				if(count[0] && count[1] && count[2] && count[3] && count[4] && count[5])
					return CPF(playerid, COLOR_GRAY, "You are already in a possession of a complete General Patrol Gear.");

				else
				{
				    if(!count[0])
				        _AddBagItemPD(playerid, 105, 1);

				    else if(!count[1])
				        _AddBagItemPD(playerid, 24, 1);

				    else if(!count[2])
				        _AddBagItemPD(playerid, 3, 1);

				    else if(!count[3])
				        _AddBagItemPD(playerid, 104, 1);

				    else if(!count[4])
				        _AddBagItemPD(playerid, 105, 1);

				    else if(!count[5])
				        _AddBagItemPD(playerid, 106, 1);

					CPF(playerid, -1, "** You have recieved the missing equipments in your patrol gear.");
				}
			}
			case 1: ShowPlayerDialog(playerid, DIALOG_ARMOURY_SMGS, DIALOG_STYLE_LIST, "Armoury -> Heavy", "Heckler & Koch MP5/10\nMossberg 500\nM4 Carbine", "Select", "Back");
			case 2:
			{
				new bool:count[3];
				for(new i = 0; i < MAX_ITEMS; i++)
				{
					if(Bag[playerid][bagItem][i] <= 0) continue;
					if(Bag[playerid][bagItem][i] == 31)
					    count[0] = true;

					else if(Bag[playerid][bagItem][i] == 34)
					    count[1] = true;

					else if(Bag[playerid][bagItem][i] == 17)
					    count[2] = true;

					else
					    continue;
				}
				if(count[0] && count[1] && count[2])
				    return CPF(playerid, -1, "You already in a possession of a complete SWAT Gear (M4 Carbine, THOR M408 Long Range and Tear Gas)");

				else
				{
					if(!count[0])
					    _AddBagItemPD(playerid, 31, 1);

					if(!count[0])
					    _AddBagItemPD(playerid, 34, 1);

					else if(!count[0])
					    _AddBagItemPD(playerid, 17, 1);
				}
			}
			case 3:
			{
			    new count = 0;
				for(new i = 0; i < MAX_ITEMS; i++)
				{
					if(Bag[playerid][bagItem][i] <= 0) continue;
					if(Bag[playerid][bagItem][i] == 104)
					{
					    count++;
					    SendClientMessage(playerid, COLOR_GRAY, "You are already in a possession of a Kevlar Vest.");
					    return 1;
					}
				}
				if(count <= 0)
				{
				    _AddBagItemPD(playerid, 104, 1);
				    CPF(playerid, -1, "** Equipped Kevlar Vest.");
				}
			}
			case 4: ShowPlayerDialog(playerid, DIALOG_ARMOURY_CLIPS, DIALOG_STYLE_LIST, "Armoury -> Ammounation", "12x76 Slugs (10)\n9x18mm Clips (14)\n5.56x45mm Clips (50)\n7.62x54mm Clips (5)", "Select", "Back");
			case 5:
			{
			    new count = 0;
			    for(new i = 0; i < MAX_ITEMS; i++)
				{
				    if(Bag[playerid][bagItem][i] <= 0) continue;
				    if(Bag[playerid][bagItemServer][i] == 1)
				    {
				        count ++;
				        _RemoveDatabaseItem(Bag[playerid][bagItemID][i]);
				        _RemoveBagItem(playerid, Bag[playerid][bagItemID][i]);
				    }
				}
				if(count >= 1) CPF(playerid, -1, "** Returned all equipment.");
				else CPF(playerid, -1, "** You don't have any equipment to return.");
			}
	    }
	}
	if(dialogid == DIALOG_ARMOURY_CLIPS && response)
	{
	    switch(listitem)
	    {
	        case 0: _AddBagItem(playerid, 100, 10), CPF(playerid, -1, "** Added 12x76 Slugs (10)");
	        case 1: _AddBagItem(playerid, 101, 14), CPF(playerid, -1, "** Added 9x18mm Clips (14)");
	        case 2: _AddBagItem(playerid, 102, 50), CPF(playerid, -1, "** Added 5.56x45mm Clips (50)");
	        case 3: _AddBagItem(playerid, 103, 5), CPF(playerid, -1, "** Added 7.62x54mm Clips (5)");
	    }
	}
	if(dialogid == DIALOG_BAGPICK && response)
	{
	    if(listitem == 0) return _PickItem(playerid);
		if(GetBagItemCount(playerid) >= 200)
		    return CPF(playerid, COLOR_RED, "No more room in your Inventory. (200 slots)");

		new id = pList[playerid][listitem];
	    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
	    {
	        if(Bag[playerid][bagItem][i] > 0) continue;
	        else
	        {
				format(_query, sizeof(_query), "INSERT INTO `bagitems`(`Owner`, `Item`, `ItemAmount`) VALUES (%d, %d, %d)", cInfo[playerid][SQLID], DropItem[id][dItem], DropItem[id][dAmount]);
				mysql_query(_query);
		        Bag[playerid][bagItemID][i] = mysql_insert_id();
		        Bag[playerid][bagItem][i] = DropItem[id][dItem];
		        Bag[playerid][bagItemAmount][i] = DropItem[id][dAmount];
		        Bag[playerid][bagItemLoaded][i] = DropItem[id][dLoaded];
		        Bag[playerid][bagItemLoadAmount][i] = DropItem[id][dLoadAmount];
		        Bag[playerid][bagItemAttached][i] = 0;
		        break;
	        }
	    }
	    CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Picked up %s (Amount: %d)", GetItemName(DropItem[id][dItem]), DropItem[id][dAmount]);
   	 	DropItem[id][dItem] = 0;
   	 	DropItem[id][dLoaded] = 0;
   	 	DropItem[id][dLoadAmount] = 0;
   	 	DropItem[id][dAmount] = 0;
   	 	DestroyDynamicObject(DropItem[id][dObject]);
   	 	DestroyDynamic3DTextLabel(DropItem[id][dLabel]);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        ClearAnimations(playerid);
        ApplyAnimation(playerid, "MISC", "Case_pickup", 1, 0, 1, 1, 0, 1000);
	}
	if(dialogid == DIALOG_BAG)
	{
	    if(!response) return 1;
	    if(listitem == 0) return ShowBag(playerid);
	    new itm = pList[playerid][listitem];
	    switch(itm)
	    {
	        case 200: NextBagPage(playerid);
	        case 201: BackBagPage(playerid);
	        default:
	        {
	            bItem[playerid] = itm;
	            new titl[64];
	            format(titl, 64, GetItemName(Bag[playerid][bagItem][itm]));
				switch(Bag[playerid][bagItem][itm])
				{
				    case 22..34:
				    {
						if(Bag[playerid][bagItemAttached][itm] == 1)
						{
						    format(gString, sizeof(gString), "Unequip Weapon\nDescription\nDrop\nDestroy%s", Bag[playerid][bagItemLoaded][itm] ? ("\nRemove Magazine") : (""));
						}
						else
						{
						    format(gString, sizeof(gString), "Equip Weapon\nDescription\nDrop\nDestroy%s", Bag[playerid][bagItemLoaded][itm] ? ("\nRemove Magazine") : (""));
						}
						ShowPlayerDialog(playerid, DIALOG_BAGOPTION, DIALOG_STYLE_LIST, titl, gString, "Select", "Back");
				    }
				    case 100..103:
				    {
						format(gString, sizeof(gString), "Load Magazine\nDescription\nDrop\nDestroy");
						ShowPlayerDialog(playerid, DIALOG_BAGOPTION, DIALOG_STYLE_LIST, titl, gString, "Select", "Back");
				    }
				    case 104:
				    {
						format(gString, sizeof(gString), "%s\nDescription\nDestroy", Bag[playerid][bagItemAttached][itm] ? ("Unequip Kevlar Vest") : ("Equip Kevlar Vest"));
						ShowPlayerDialog(playerid, DIALOG_BAGOPTION, DIALOG_STYLE_LIST, titl, gString, "Select", "Back");
				    }
				    case 105:
				    {
						format(gString, sizeof(gString), "Description\nDrop\nDestroy");
						ShowPlayerDialog(playerid, DIALOG_BAGOPTION, DIALOG_STYLE_LIST, titl, gString, "Select", "Back");
				    }
				    default:
				    {
						CPF(playerid, COLOR_RED, "You have selected an unknown item, therefore it was destroyed.");
						_RemoveDatabaseItem(Bag[playerid][bagItemID][itm]);
						_RemoveBagItem(playerid, Bag[playerid][bagItemID][itm]);
				    }
				}
	        }
	    }
	}
	if(dialogid == DIALOG_BAGDESC)
	{
		ShowBag(playerid);
	}
	if(dialogid == DIALOG_BAGDROP)
	{
	    if(!response) return ShowBag(playerid);
	    new id = DroppedItem[playerid];
	    if(strval(inputtext) > Bag[playerid][bagItemAmount][id] || strval(inputtext) < 0)
	    {
			new title[64], cont[256];
			format(title, 64, GetItemName(Bag[playerid][bagItem][id]));
			format(cont, 256, "Invalid amount!\nDropping Item: %s\nPlease enter the amount you would like to drop (CURRENT: %d)", GetItemName(Bag[playerid][bagItem][id]), Bag[playerid][bagItemAmount][id]);
			ShowPlayerDialog(playerid, DIALOG_BAGDROP, DIALOG_STYLE_INPUT, title, cont, "Drop", "Back");
			return 1;
	    }
	    _DropItem(playerid, strval(inputtext));
	}
	if(dialogid == DIALOG_BAGOPTION)
	{
		if(!response) return ShowBag(playerid);
		new id = bItem[playerid];
		// global listitems
		switch(listitem)
		{
			case 1:
			{
				new title[64], description[516], type[32], ammo[32], bullets, forwep[128];
				format(title, 64, GetItemName(Bag[playerid][bagItem][id]));
				format(gString, sizeof(gString), ""COL_WHITE"Name: {63E676}%s\n", GetItemName(Bag[playerid][bagItem][id]));
				strcat(description, gString);
				switch(Bag[playerid][bagItem][id])
				{
				    case 1..46: type = "Weapon";
				    case 100..103: type = "Ammounation";
				}
				format(gString, sizeof(gString), ""COL_WHITE"Type: {63E676}%s\n", type);
				strcat(description, gString);
				switch(Bag[playerid][bagItem][id])
				{
					case 22..34:
					{
						switch(Bag[playerid][bagItem][id])
						{
						    case 22..24: format(ammo, 32, GetItemName(101)), bullets = 14;
						    case 26..27: format(ammo, 32, GetItemName(100)), bullets = 10;
						    case 28..32: format(ammo, 32, GetItemName(102)), bullets = 50;
						    case 33..34: format(ammo, 32, GetItemName(103)), bullets = 5;
						}
						format(gString, sizeof(gString), ""COL_WHITE"Ammo Type: {63E676}%s\n", ammo);
						strcat(description, gString);
						if(Bag[playerid][bagItemLoaded][id] == 1)
						{
							format(gString, sizeof(gString), ""COL_WHITE"Loaded Magazine: {63E676}%d/%d\n", Bag[playerid][bagItemLoadAmount][id], bullets);
							strcat(description, gString);
						}
					}
					case 100..103:
					{
						switch(Bag[playerid][bagItem][id])
						{
						    case 100: format(forwep, 128, "Mossberg 930 Autoloader, Mossberg 500"), bullets = 10;
						    case 101: format(forwep, 128, "Beretta 9mm, Heckler & Koch USP, Walther PPK"), bullets = 14;
						    case 102: format(forwep, 128, "MAC-10, Heckler & Koch MP5/10, Kalashnikov, M4 Carbine, AB-10"), bullets = 50;
						    case 103: format(forwep, 128, "Lee-Enfield, THOR M408 Long Range"), bullets = 5;
						}
						format(gString, sizeof(gString), ""COL_WHITE"Useable for: {63E676}%s\n", forwep);
						strcat(description, gString);
						format(gString, sizeof(gString), ""COL_WHITE"Ammo: {63E676}%d/%d", Bag[playerid][bagItemAmount][id], bullets);
						strcat(description, gString);
					}
					case 104:
					{
						format(gString, sizeof(gString), ""COL_WHITE"A Kevlar Vest is an item of personal armor that helps absorb the impact from firearm-fired projectiles and shrapnel from explosions, and is worn on the torso.");
						strcat(description, gString);
					}
					case 105:
					{
						format(gString, sizeof(gString), ""COL_WHITE"A Taser is an electroshock weapon sold by Taser International. It uses electrical current to disrupt voluntary control of muscles causing neuromuscular incapacitation.");
						strcat(description, gString);
					}
				}
				ShowPlayerDialog(playerid, DIALOG_BAGDESC, DIALOG_STYLE_MSGBOX, title, description, "Okay", "");
			}
			case 2:
			{
			    DroppedItem[playerid] = id;
				new title[64], cont[256];
				format(title, 64, GetItemName(Bag[playerid][bagItem][id]));
				format(cont, 256, "Dropping Item: %s\nPlease enter the amount you would like to drop (CURRENT: %d)", GetItemName(Bag[playerid][bagItem][id]), Bag[playerid][bagItemAmount][id]);
				ShowPlayerDialog(playerid, DIALOG_BAGDROP, DIALOG_STYLE_INPUT, title, cont, "Drop", "Back");
			}
		}
		switch(Bag[playerid][bagItem][id])
		{
		    case 104:
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
						CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"%s %s.", Bag[playerid][bagItemAttached][id] ? ("Unequipeed") : ("Equipped"), GetItemName(Bag[playerid][bagItem][id]));
						AttachingWeapon[playerid] = Bag[playerid][bagItemAttached][id] ? -1 : id;
						Bag[playerid][bagItemAttached][id] = Bag[playerid][bagItemAttached][id] ? 0 : 1;
		            }
		        }
		    }
		    case 22..34:
		    {
		        switch(listitem)
				{
					case 0:
					{
						if(Bag[playerid][bagItemAttached][id] == 1)
						{
							CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Unequipped %s.", GetItemName(Bag[playerid][bagItem][id]));
							if(Bag[playerid][bagItemLoadAmount][id] > 0) ResetPlayerWeapons(playerid);
							RemovePlayerAttachedObject(playerid, 2);
							AttachingWeapon[playerid] = -1;
							Bag[playerid][bagItemAttached][id] = 0;
						}
						else
						{
							if(AttachingWeapon[playerid] > -1) return CPF(playerid, COLOR_GRAY, "You can't use this weapon when %s is already being used.", GetItemName(Bag[playerid][bagItem][AttachingWeapon[playerid]]));
						    AttachingWeapon[playerid] = id;
						    Bag[playerid][bagItemAttached][id] = 1;
						    CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Equipped %s.", GetItemName(Bag[playerid][bagItem][id]));
							if(Bag[playerid][bagItemLoadAmount][id] > 0)
							{
								GivePlayerWeaponEx(playerid, Bag[playerid][bagItem][id], Bag[playerid][bagItemLoadAmount][id]);
								GameTextForPlayer(playerid, "~g~Magazine is loaded!", 3500, 4);
							}
							else
							{
								SetPlayerAttachedObject(playerid, 2, GetItemObject(Bag[playerid][bagItem][id]), 6);
								GameTextForPlayer(playerid, "~r~Magazine is empty!~n~~w~Press ~y~~k~~CONVERSATION_YES~~w~ to reload", 3500, 4);
							}
						}
					}
					case 3:
					{
					    CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"%s was destroyed and removed from inventory.", GetItemName(Bag[playerid][bagItem][id]));
					    if(Bag[playerid][bagItemAttached][id])
					    {
					        if(Bag[playerid][bagItemLoadAmount][id] > 0) ResetPlayerWeapons(playerid);
							RemovePlayerAttachedObject(playerid, 2);
							AttachingWeapon[playerid] = -1;
							Bag[playerid][bagItemAttached][id] = 0;
			    		}
			    		_RemoveDatabaseItem(Bag[playerid][bagItemID][id]);
					    _RemoveBagItem(playerid, Bag[playerid][bagItemID][id]);
					}
		            case 4:
		            {
		                if(Bag[playerid][bagItemAttached][id] < 1)
		                    return CPF(playerid, COLOR_GRAY, "You are not equipping this weapon.");

		                switch(Bag[playerid][bagItem][id])
		                {
						    case 22..24:
						    {
                                _AddBagItem(playerid, 101, Bag[playerid][bagItemLoadAmount][id]);
						    }
						    case 26..27:
						    {
                                _AddBagItem(playerid, 100, Bag[playerid][bagItemLoadAmount][id]);
						    }
						    case 28..32:
						    {
						        _AddBagItem(playerid, 102, Bag[playerid][bagItemLoadAmount][id]);
						    }
						    case 33..34:
						    {
						        _AddBagItem(playerid, 103, Bag[playerid][bagItemLoadAmount][id]);
						    }
		                }
		                CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Magazine was removed from the %s. (Added to inventory)", GetItemName(Bag[playerid][bagItem][id]));
						Bag[playerid][bagItemLoadAmount][id] = 0;
						Bag[playerid][bagItemLoaded][id] = 0;
						ResetPlayerWeapons(playerid);
						SetPlayerAttachedObject(playerid, 2, GetItemObject(Bag[playerid][bagItem][id]), 6);
					}
				}
		    }
		    case 1..21:
		    {

		    }
		    case 35..46:
		    {

		    }
		    case 100..103:
		    {
		        switch(listitem)
		        {
		            case 3:
		            {
					    CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"%s was destroyed and removed from inventory.", GetItemName(Bag[playerid][bagItem][id]));
					    if(Bag[playerid][bagItemAttached][id])
					    {
					        if(Bag[playerid][bagItemLoadAmount][id] > 0) ResetPlayerWeapons(playerid);
							RemovePlayerAttachedObject(playerid, 2);
							AttachingWeapon[playerid] = -1;
							Bag[playerid][bagItemAttached][id] = 0;
			    		}
			    		_RemoveDatabaseItem(Bag[playerid][bagItemID][id]);
					    _RemoveBagItem(playerid, Bag[playerid][bagItemID][id]);
		            }
		            case 0:
		            {
		                if(AttachingWeapon[playerid] == -1) return CPF(playerid, COLOR_GRAY, "You do not have any weapon attached.");
						if(Bag[playerid][bagItemLoaded][AttachingWeapon[playerid]] >= 1) return CPF(playerid, COLOR_GRAY, "This weapon already has a magazine in it.");
                        new wep = AttachingWeapon[playerid];
						switch(Bag[playerid][bagItem][wep])
						{
						    case 22..24:
						    {
						        if(Bag[playerid][bagItem][id] != 101)
						            return CPF(playerid, COLOR_GRAY, "This magazine does not fit the %s.", GetItemName(Bag[playerid][bagItem][wep]));
						    }
						    case 26..27:
						    {
						        if(Bag[playerid][bagItem][id] != 100)
						            return CPF(playerid, COLOR_GRAY, "This magazine does not fit the %s.", GetItemName(Bag[playerid][bagItem][wep]));
						    }
						    case 28..32:
						    {
						        if(Bag[playerid][bagItem][id] != 102)
						            return CPF(playerid, COLOR_GRAY, "This magazine does not fit the %s.", GetItemName(Bag[playerid][bagItem][wep]));
						    }
						    case 33..34:
						    {
						        if(Bag[playerid][bagItem][id] != 103)
						            return CPF(playerid, COLOR_GRAY, "This magazine does not fit the %s.", GetItemName(Bag[playerid][bagItem][wep]));
						    }
						}
						_RemoveDatabaseItem(Bag[playerid][bagItemID][id]);
		                Bag[playerid][bagItemLoaded][wep] = 1;
		                Bag[playerid][bagItemLoadAmount][wep] = Bag[playerid][bagItemAmount][id];
		                if(Bag[playerid][bagItemAmount][id] > 0)
		                {
			                RemovePlayerAttachedObject(playerid, 2);
			                CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Loaded %s with %s magazine.", GetItemName(Bag[playerid][bagItem][wep]), GetItemName(Bag[playerid][bagItem][id]));
							GivePlayerWeaponEx(playerid, Bag[playerid][bagItem][wep], Bag[playerid][bagItemAmount][id]);
							_RemoveBagItem(playerid, Bag[playerid][bagItemID][id]);
							ApplyAnimation(playerid,"PYTHON","python_reload",4.1,0,0,0,0,0,0);
		                }
		                else
		                {
			                CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Loaded %s with %s magazine. (Empty Magazine)", GetItemName(Bag[playerid][bagItem][wep]), GetItemName(Bag[playerid][bagItem][id]));
							_RemoveBagItem(playerid, Bag[playerid][bagItemID][id]);
							ApplyAnimation(playerid,"PYTHON","python_reload",4.1,0,0,0,0,0,0);
		                }
		            }
		        }
		    }
		}
	}
	if(dialogid == DIALOG_MYHOUSES)
	{
	    if(!response) return 1;
		new param = pList[playerid][listitem];
		new house_string[348], house_title[128];
		if(IsHouseHaveSafe(param))
		{
		    new saf = GetSafeID(hInfo[param][ID]);
            format(house_string, sizeof(house_string), "ID: %d\nAddress: %s\nSafe: %s\nSafe Code: %d\nRentable: %s\nRent Price: %d\nLocked: %s", hInfo[param][ID], hInfo[param][Address], Safe[saf][sLocked] ? ("Locked") : ("Unlocked"), Safe[saf][Code], hInfo[param][Rentable] ? ("Yes") : ("No"), hInfo[param][RentPrice], hInfo[param][Locked] ? ("Yes") : ("No"));
		}
		else
		    format(house_string, sizeof(house_string), "ID: %d\nAddress: %s\nRentable: %s\nRent Price: %d\nLocked: %s", hInfo[param][ID], hInfo[param][Address], hInfo[param][Rentable] ? ("Yes") : ("No"), hInfo[param][RentPrice], hInfo[param][Locked] ? ("Yes") : ("No"));
		format(house_title, sizeof(house_title), "%s", hInfo[param][Address]);
		ShowPlayerDialog(playerid, DIALOG_SHOWHOUSE, DIALOG_STYLE_MSGBOX, house_title, house_string, "Back", "");
	}
	if(dialogid == DIALOG_SHOWHOUSE)
	{
	    if(response || !response)
	    {
		   	new count = 0, helpstr[1600], test = 0;
		   	ClearItems(playerid);
		 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
		 	{
		 	    if(hInfo[i][ID] <= 0) continue;
				if(hInfo[i][Owner] != cInfo[playerid][SQLID]) continue;
			    count++;
				format(gString, sizeof(gString), "%d. %s\n", count, hInfo[i][Address]);
			 	strcat(helpstr, gString);
	            pList[playerid][test] = i;
			 	test++;
				ShowPlayerDialog(playerid, DIALOG_MYHOUSES, DIALOG_STYLE_LIST, "House List", helpstr, "Select", "Close");
			}
			if(count <= 0) CPF(playerid, COLOR_GRAY, "You do not have any houses.");
	    }
	}
	if(dialogid == DIALOG_SAFE)
	{
	    if(!response) return 1;
	    if(InHouse[playerid] <= 0) return 1;
		new saf = GetSafeID(InHouse[playerid]);
		if(saf <= 0) return 1;
		switch(listitem)
		{
			case 0:
			{
				if(Safe[saf][sLocked])
				{
				    if(Safe[saf][Code] <= 0)
					{
					    if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID])
					        return CPF(playerid, COLOR_RED, "Safe is currently unreachable due to mechanical problems.");
					    else
					    	ShowPlayerDialog(playerid, DIALOG_CSAFE, DIALOG_STYLE_INPUT, "Code Authorization", "It looks like you didn't set a security code for your safe.\nPlease set a combination of 6 numbers that will be used to unlock the safe.", "Set", "Close");
					}
					else
					    ShowPlayerDialog(playerid, DIALOG_CSAFE, DIALOG_STYLE_INPUT, "Code Authorization", "Please enter the security code of this safe to gain an access (6 numbers):", "Access", "Close");
				}
				else
				{
                    Safe[saf][sLocked] = true;
                    CPF(playerid, COLOR_RED, "Safe has been locked.");
                    UpdateSafe(saf);
				}
			}
			case 1:
			{
			    format(gString, sizeof(gString), "Enter the amount you would like to withdraw from the safe:\nBalance: $%d", Safe[saf][sMoney]);
			    ShowPlayerDialog(playerid, DIALOG_WSAFE, DIALOG_STYLE_INPUT, "Safe -> Withdraw Money", gString, "Withdraw", "Back");
			}
			case 2:
			{
			    format(gString, sizeof(gString), "Enter the amount you would like to deposit into the safe:\nBalance: $%d", Safe[saf][sMoney]);
			    ShowPlayerDialog(playerid, DIALOG_DSAFE, DIALOG_STYLE_INPUT, "Safe -> Deposit Money", gString, "Deposit", "Back");
			}
			case 3:
			{
			    format(gString, sizeof(gString), "Enter the new desired code you wish to have (6 numbers):");
			    ShowPlayerDialog(playerid, DIALOG_CCSAFE, DIALOG_STYLE_INPUT, "Safe -> Change Security Code", gString, "Set", "Back");
			}
			default: return 1;
		}
	}
	if(dialogid == DIALOG_CCSAFE)
	{
		new saf = GetSafeID(InHouse[playerid]);
		if(saf <= 0) return 1;
	    if(!response)
	    {
			if(Safe[saf][sLocked])
			    format(gString, sizeof(gString), ""COL_GREEN"Unlock Safe");

			else
			{
				if(Safe[saf][Code] <= 0)
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
				else
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money\nChange Security Code");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
			}
	        return 1;
	    }
	    if(InHouse[playerid] <= 0) return 1;
		if(IsNumeric(inputtext) && strlen(inputtext) == 6)
		{
            Safe[saf][Code] = strval(inputtext);
		    CPF(playerid, -1, "Safe's code has been set to "COL_YELLOW"%d", strval(inputtext));
		}
		else
		{
			 format(gString, sizeof(gString), "Invalid code!\nEnter the new desired code you wish to have (6 numbers):");
			 ShowPlayerDialog(playerid, DIALOG_CCSAFE, DIALOG_STYLE_INPUT, "Safe -> Change Security Code", gString, "Set", "Back");
		}
	}
	if(dialogid == DIALOG_WSAFE)
	{
		new saf = GetSafeID(InHouse[playerid]);
		if(saf <= 0) return 1;
	    if(!response)
	    {
			if(Safe[saf][sLocked])
			    format(gString, sizeof(gString), ""COL_GREEN"Unlock Safe");

			else
			{
				if(Safe[saf][Code] <= 0)
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
				else
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money\nChange Security Code");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
			}
	        return 1;
	    }
	    if(InHouse[playerid] <= 0) return 1;
		if(IsNumeric(inputtext) && strval(inputtext) <= Safe[saf][sMoney] && strval(inputtext) > 0)
		{
            Safe[saf][sMoney] -= strval(inputtext);
		    CPF(playerid, -1, "Withdrawed {008807}$%d"COL_WHITE" from the safe.", strval(inputtext));
		    CPF(playerid, COLOR_GRAY, "Balance: $%d.", Safe[saf][sMoney]);
		}
		else
		{
		    format(gString, sizeof(gString), "Invalid amount!\nEnter the amount you would like to withdraw from the safe:\nBalance: $%d", Safe[saf][sMoney]);
		 	ShowPlayerDialog(playerid, DIALOG_WSAFE, DIALOG_STYLE_INPUT, "Safe -> Withdraw Money", gString, "Withdraw", "Back");
		}
	}
	if(dialogid == DIALOG_DSAFE)
	{
		new saf = GetSafeID(InHouse[playerid]);
		if(saf <= 0) return 1;
	    if(!response)
	    {
			if(Safe[saf][sLocked])
			    format(gString, sizeof(gString), ""COL_GREEN"Unlock Safe");

			else
			{
				if(Safe[saf][Code] <= 0)
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
				else
				{
				    format(gString, sizeof(gString), ""COL_RED"Lock Safe\n"COL_WHITE"Withdraw Money\nDeposit Money\nChange Security Code");
					ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");
				}
			}
	        return 1;
	    }
	    if(InHouse[playerid] <= 0) return 1;
		if(IsNumeric(inputtext) && strval(inputtext) <= cInfo[playerid][cMoney] && strval(inputtext) > 0)
		{
            Safe[saf][sMoney] += strval(inputtext);
		    CPF(playerid, -1, "{008807}$%d"COL_WHITE" were deposited into the safe.", strval(inputtext));
		    CPF(playerid, COLOR_GRAY, "Balance: $%d.", Safe[saf][sMoney]);
		}
		else
		{
		    format(gString, sizeof(gString), "Invalid amount!\nEnter the amount you would like to deposit into the safe:\nBalance: $%d", Safe[saf][sMoney]);
		 	ShowPlayerDialog(playerid, DIALOG_DSAFE, DIALOG_STYLE_INPUT, "Safe -> Deposit Money", gString, "Deposit", "Back");
		}
	}
	if(dialogid == DIALOG_CSAFE)
	{
	    if(!response) return 1;
	    if(InHouse[playerid] <= 0) return 1;
		new saf = GetSafeID(InHouse[playerid]);
		if(saf <= 0) return 1;
		if(Safe[saf][sLocked])
		{
	        if(Safe[saf][Code] <= 0)
	        {
	            if(hInfo[InHouse[playerid]][Owner] == cInfo[playerid][SQLID])
				{
				    if(!IsNumeric(inputtext) || strlen(inputtext) > 6 || strlen(inputtext) <= 0)
				    	return ShowPlayerDialog(playerid, DIALOG_CSAFE, DIALOG_STYLE_INPUT, "Code Authorization", "Invalid Code!\nIt looks like you didn't set a security code for your safe.\nPlease set a combination of 6 numbers that will be used to unlock the safe.", "Set", "Close");

					else
					{
					    Safe[saf][Code] = strval(inputtext);
					    CPF(playerid, -1, "Safe's security code has been set to "COL_YELLOW"%d"COL_WHITE"", strval(inputtext));
					}
				}
	        }
	        else
	        {
				if(!IsNumeric(inputtext) || strval(inputtext) != Safe[saf][Code])
				{
				    GameTextForPlayer(playerid, "~r~Incorrect!", 2500, 4);
				    ShowPlayerDialog(playerid, DIALOG_CSAFE, DIALOG_STYLE_INPUT, "Code Authorization", "Please enter the security code of this safe to gain an access (6 numbers):", "Access", "Close");
				}
				else
				{
				    Safe[saf][sLocked] = false;
				    CPF(playerid, COLOR_GREEN, "Code has been authorized and safe is now unlocked.");
				    UpdateSafe(saf);
				}
	        }
        }
	}
	if(dialogid == DIALOG_TUT)
	{
	    if(!response) return KickEx(playerid);
	    else
	    {
			switch(Tutorial[playerid])
			{
			    case 1:
			    {
			        Tutorial[playerid] = 2;
					cInfo[playerid][cGender] = (listitem + 1);
					CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Please choose your age.");
					ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_INPUT, "Date of Birth", "Enter a valid date of birth (1-99):\n\tExample: 1.4.1997", "Next", "Exit");
				}
			    case 2:
			    {
					if(!IsValidDate(inputtext))
					    return ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_INPUT, "Date of Birth", "Invalid date of birth!\nEnter a valid date of birth (1-99):\n\tExample: 1.4.1997", "Next", "Exit");

					new tmp[3][64];
					split(inputtext, tmp, '.');
					new pDate[3], cYear[64];
					getdate(pDate[0], pDate[1], pDate[2]);
					format(cYear, 64, "%s", tmp[2]);
					new currentYear = pDate[0] - strval(cYear);
					if(currentYear >= 1 && currentYear <= 99)
					{
						cInfo[playerid][cAge] = currentYear;
						Tutorial[playerid] = 3;
						ClearChat(playerid);
						CPF(playerid, COLOR_YELLOW, "You are being redirected to server introduction.");
						CPF(playerid, COLOR_FADE1, "NOTE: Dialogs are not skipable until timer finishes, do not press ESC - You will get kicked!");
					    TutorialTimer[playerid] = SetTimerEx("Tutorialism", 10000, false, "i", playerid);
						ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Introduction", "Project Reality Roleplay is an international roleplaying server which focuses on high-end and very hardcore, detailed roleplay.\nOur staff are very professional and the main purpose of the server is to ensure that everyone has as much entertainment whilst playing with other people.\nAnother thing we focus on is to give as many opportunities and experiences to players as possible.", "...", "");
                        PlayAudioStreamForPlayer(playerid, "http://dl.dropboxusercontent.com/s/z834k2bgngbcmm6/kbgdHubwVdkG.128.mp3");
					}
					else
					    ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_INPUT, "Date of Birth", "Invalid date of birth!\nEnter a valid date of birth (1-99):\n\tExample: 1.4.1997", "Next", "Exit");
				}
				case 3:
				{
					ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Project Reality Roleplay", "Project Reality Roleplay is an international roleplaying server which focuses on high-end and very hardcore, detailed roleplay.\nOur staff are very professional and the main purpose of the server is to ensure that everyone has as much entertainment whilst playing with other people.\nAnother thing we focus on is to give as many opportunities and experiences to players as possible.", "...", "");
				}
				case 4:
				{
			        new gstr[516];
			        format(gstr, 516, "Members of the staff team ensure that no rules are broken and that everyone is treated fairly, equally & with the respect & professionalism that they deserve.\nThere are no exceptions and favoritism when it comes to rule breaking, everyone is treated on the same basis. Unlike any other server,\nwe are trying to be unique by thinking of new styles and systems on a regular basis in order to ensure authenticity and an enjoyable atmosphere for every player.");
			        ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Project Reality Roleplay", gstr, "...", "");
				}
				case 5:
				{
			        new gstr[516];
			        format(gstr, 516, "Some factions and organisations on the server may always exist by default that are required to be a part of your roleplaying experience.\nA few of these include government organisations such as the Los Santos Police Department and the Los Santos Fire Department.\nAll of these organisations are actively seeking new members and membership will be subject to applications, interviews\nand training depending on the agency you wish to join.");
		            ShowPlayerDialog(playerid, DIALOG_TUT, DIALOG_STYLE_MSGBOX, "Project Reality Roleplay", gstr, "...", "");
				}
			}
		}
	}
	if(dialogid == DIALOG_OPTIONS)
	{
	    if(!response) return true;
	    switch(listitem)
	    {
	        case 0:
	        {
	            if(SeeHUD[playerid])
	            {
	                PlayerTextDrawHide(playerid, Textdraw2[playerid]);
	                SeeHUD[playerid] = false;
	                CPF(playerid, COLOR_GRAY, "HUD is now hidden.");
	            }
	            else
	            {
	                PlayerTextDrawShow(playerid, Textdraw2[playerid]);
	                SeeHUD[playerid] = true;
	                CPF(playerid, COLOR_GRAY, "HUD is now visible.");
	            }
	        }
	        case 1:
	        {
	            if(cInfo[playerid][cFaction] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a family.");
	            CPF(playerid, COLOR_GRAY, "Family chat is now %s.", FactionChat[playerid] ? ("hidden") : ("visible"));
	            FactionChat[playerid] = FactionChat[playerid] ? false : true;
	        }
	        case 2:
	        {
	            if(pInfo[playerid][AdminLevel] <= 0) return NoAdmin(playerid);
	            CPF(playerid, COLOR_GRAY, "Admin chat is now %s.", AdminChat[playerid] ? ("hidden") : ("visible"));
	            AdminChat[playerid] = AdminChat[playerid] ? false : true;
	        }
	    }
	}
	if(dialogid == DIALOG_REGISTER)
	{
	    new buf[129];
	    if(!response) return KickEx(playerid);
	    if(!strlen(inputtext))
	    {
			format(gString, sizeof(gString), ""COL_RED"Password is empty!"COL_WHITE"\nWelcome to {33aa33}Project Reality Roleplay"COL_WHITE", %s.\nEnter the desired password you wish to have:", GetName(playerid));
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Register", gString, "Register", "Exit");
			return 1;
		}
		else if(strlen(inputtext) < 6)
		{
			format(gString, sizeof(gString), ""COL_RED"Password must be atleast 6 characters long!"COL_WHITE"\nWelcome to {33aa33}Project Reality Roleplay"COL_WHITE", %s.\nEnter the desired password you wish to have:", GetName(playerid));
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Register", gString, "Register", "Exit");
			return 1;
		}
		new pass[129];
		mysql_real_escape_string(inputtext, pass);
		WP_Hash(buf, sizeof (buf), pass);
		CreatePlayer(playerid, GetName(playerid), buf);
		LoadCharacters(playerid);
		ShowCharacterList(playerid, GetName(playerid));
	}

	if(dialogid == DIALOG_LOGIN)
	{
	    if(!response) return KickEx(playerid);
		LoadCharacters(playerid);
		new buf[129], realbuf[129];
		WP_Hash(buf, sizeof (buf), inputtext);
		mysql_real_escape_string(buf, realbuf);
		if(strcmp(pInfo[playerid][pPassword], realbuf, false) == 0)
		{
		    if(pInfo[playerid][pBanned] == 1)
		    {
		        ClearChat(playerid);
		        new IP[20];
		        GetPlayerIp(playerid, IP, sizeof IP);
		        CPF(playerid, COLOR_RED, "You are banned from this server.");
		        CPF(playerid, COLOR_RED, "Banned IP: "COL_WHITE"%s", IP);
		        CPF(playerid, COLOR_RED, "Banned By: "COL_WHITE"%s", pInfo[playerid][pBannedBy]);
		        CPF(playerid, COLOR_RED, "Ban Reason: "COL_WHITE"%s", pInfo[playerid][pBanReason]);
		        KickEx(playerid);
		        return 1;
		    }
		    else
		    {
				ShowCharacterList(playerid, GetName(playerid));
			}
		}
		else
		{
	    	format(gString, sizeof(gString), ""COL_RED"Wrong password\n"COL_WHITE"Welcome to {33aa33}Project Reality Roleplay"COL_WHITE", %s.\nEnter your password below to login:", GetName(playerid));
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", gString, "Login", "Exit");
		}
	}

	if(dialogid == DIALOG_CHARACTERS)
	{
	    new C_DIALOG[256], P_DIALOG[128];
	    if(!response) return KickEx(playerid);
		CharacterPick[playerid] = listitem;
		switch(listitem)
		{
		    case 0: ShowCharacterList(playerid, GetName(playerid));
		    case 1:
			{
				if(strcmp(pInfo[playerid][pCharacter1], "None" ,true) == 0) format(C_DIALOG, 128, "Create Character"), \
				ShowPlayerDialog(playerid, DIALOG_CREATE, DIALOG_STYLE_LIST, "Character 1 > Create", C_DIALOG, "Select", "Back");
				else format(P_DIALOG, 128, "Character 1 > %s", pInfo[playerid][pCharacter1]), format(C_DIALOG, 256, "Play this Character\n"COL_RED"Delete Character", \
				pInfo[playerid][pCharacter3]), ShowPlayerDialog(playerid, DIALOG_PLAY, DIALOG_STYLE_LIST, P_DIALOG, C_DIALOG, "Select", "Back");
			}
		    case 2:
			{
				if(strcmp(pInfo[playerid][pCharacter2], "None" ,true) == 0) format(C_DIALOG, 128, "Create Character"), \
				ShowPlayerDialog(playerid, DIALOG_CREATE, DIALOG_STYLE_LIST, "Character 2 > Create", C_DIALOG, "Select", "Back");
				else format(P_DIALOG, 128, "Character 2 > %s", pInfo[playerid][pCharacter2]), format(C_DIALOG, 256, "Play this Character\n"COL_RED"Delete Character", \
				pInfo[playerid][pCharacter2]), ShowPlayerDialog(playerid, DIALOG_PLAY, DIALOG_STYLE_LIST, P_DIALOG, C_DIALOG, "Select", "Back");
			}
		    case 3:
			{
				if(strcmp(pInfo[playerid][pCharacter3], "None" ,true) == 0) format(C_DIALOG, 128, "Create Character"), \
				ShowPlayerDialog(playerid, DIALOG_CREATE, DIALOG_STYLE_LIST, "Character 3 > Create", C_DIALOG, "Select", "Back");
				else format(P_DIALOG, 128, "Character 3 > %s", pInfo[playerid][pCharacter3]), format(C_DIALOG, 256, "Play this Character\n"COL_RED"Delete Character", \
				pInfo[playerid][pCharacter3]), ShowPlayerDialog(playerid, DIALOG_PLAY, DIALOG_STYLE_LIST, P_DIALOG, C_DIALOG, "Select", "Back");
			}
		}
	}

	/*if(dialogid == DIALOG_CHANGEPASS)
	{
		if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    new buf[129];
	    mysql_real_escape_string(inputtext, buf);
		WP_Hash(buf, sizeof (buf), inputtext);
		if(strcmp(pInfo[playerid][pPassword], buf, false) == 0)
		{
		    ShowPlayerDialog(playerid, DIALOG_CHANGEPASS2, DIALOG_STYLE_INPUT, "Change Account Password", "Please enter the password you would like to have:", "Change", "Back");
		}
		else
		    ShowPlayerDialog(playerid, DIALOG_CHANGEPASS, DIALOG_STYLE_INPUT, "Change Account Password", "Wrong password!\nPlease enter your current password:", "Proceed", "Back");
	}

	if(dialogid == DIALOG_CHANGEPASS2)
	{
	    if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    new buf[129];
	    mysql_real_escape_string(inputtext, buf);
		WP_Hash(buf, sizeof (buf), inputtext);
	    if(strcmp(pInfo[playerid][pPassword], buf, false) == 0) return
			ShowPlayerDialog(playerid, DIALOG_CHANGEPASS2, DIALOG_STYLE_INPUT, "Change Account Password", "You already have this password\nPlease enter the password you would like to have:", "Change", "Back");
		format(pInfo[playerid][pPassword], sizeof buf, buf);
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Password successfully changed to %s", inputtext);
		ShowCharacterList(playerid, GetName(playerid));
	}*/

    if(dialogid == DIALOG_BOOMBOX)
    {
        if(!response)return BoomboxID[playerid] = -1;
        switch(listitem)
        {
                case 0:
                {
                    ShowPlayerDialog(playerid, DIALOG_BOOMBOX_POP, DIALOG_STYLE_LIST, "Pop", "Top Hits\nCharHitz\n181 FM", "Select", "Back");
                }
                case 1:
                {
                    ShowPlayerDialog(playerid, DIALOG_BOOMBOX_HIPHOP, DIALOG_STYLE_LIST, "Hip Hop", "The Beat", "Select", "Back");
                }
                case 2:
                {
                    ShowPlayerDialog(playerid, DIALOG_BOOMBOX_ROCK, DIALOG_STYLE_LIST, "Rock", "Radio Paradise", "Select", "Back");
                }
                case 3:
                {
                    ShowPlayerDialog(playerid, DIALOG_BOOMBOX_COUNTRY, DIALOG_STYLE_LIST, "Country", "181 Highway", "Select", "Back");
                }
                case 4:
                {
                                if(isnull(Boombox[BoomboxID[playerid]][Bowner]))return 1;

                                Boombox[BoomboxID[playerid]][Bstationurl] = EOS;
                                DestroyDynamicArea(Boombox[BoomboxID[playerid]][Bareaid]);
                                Boombox[BoomboxID[playerid]][Bareaid] = CreateDynamicSphere(Boombox[BoomboxID[playerid]][Bpos][0], Boombox[BoomboxID[playerid]][Bpos][1], Boombox[BoomboxID[playerid]][Bpos][2], Boombox[BoomboxID[playerid]][Bvolume] * 2.5 + 1, -1, -1);
                                BoomboxID[playerid] = -1;
                }
        }
        return 1;
        }
    if(dialogid == DIALOG_BOOMBOX_POP)
    {
        if(!response)
        {
                ShowPlayerDialog(playerid, DIALOG_BOOMBOX, DIALOG_STYLE_LIST, "Radio List", BOOMBOXLIST, "Select", "Cancel");
        }
        if(response)
        {
                if(listitem == 0)SetBoomboxStation(playerid, BoomboxID[playerid], "http://www.sky.fm/mp3/tophits.pls");
                else if(listitem == 1)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=31645");
                else if(listitem == 2)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=35402");
                else if(listitem == 3)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=508962");
        }
        return 1;
    }
    if(dialogid == DIALOG_BOOMBOX_HIPHOP)
    {
        if(!response)
        {
                        ShowPlayerDialog(playerid, DIALOG_BOOMBOX, DIALOG_STYLE_LIST, "Radio List", BOOMBOXLIST, "Select", "Cancel");
        }
        if(response)
        {
            if(listitem == 0)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=105867");
        }
        return 1;
    }
    if(dialogid == DIALOG_BOOMBOX_ROCK)
    {
        if(!response)
        {
            ShowPlayerDialog(playerid, DIALOG_BOOMBOX, DIALOG_STYLE_LIST, "Radio List", BOOMBOXLIST, "Select", "Cancel");
        }
        if(response)
        {
            if(listitem == 0)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=785339");
        }
        return 1;
    }
    if(dialogid == DIALOG_BOOMBOX_COUNTRY)
    {
        if(!response)
        {
                        ShowPlayerDialog(playerid, DIALOG_BOOMBOX, DIALOG_STYLE_LIST, "Radio List", BOOMBOXLIST, "Select", "Cancel");
        }
        if(response)
        {
            if(listitem == 0)SetBoomboxStation(playerid, BoomboxID[playerid], "http://yp.shoutcast.com/sbin/tunein-station.pls?id=297243");
        }
        return 1;
    }

	if(dialogid == DIALOG_PLAY)
	{
	    if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    switch(listitem)
	    {
	        case 0:
	        {
	            switch(CharacterPick[playerid])
	            {
	                case 1: LoadCharacter(playerid, pInfo[playerid][pCharacter1]);
	                case 2: LoadCharacter(playerid, pInfo[playerid][pCharacter2]);
	                case 3: LoadCharacter(playerid, pInfo[playerid][pCharacter3]);
	            }
	        }
	        case 1:
	        {
				switch(CharacterPick[playerid])
				{
				    case 1: ShowPlayerDialog(playerid, DIALOG_ACCEPTDELETE, DIALOG_STYLE_MSGBOX, "Character 1 > Delete", ""COL_WHITE"Are you sure you want delete Character 1?\nWarning: You canno't undo this option.", "Yes, delete", "Cancel");
				    case 2: ShowPlayerDialog(playerid, DIALOG_ACCEPTDELETE, DIALOG_STYLE_MSGBOX, "Character 2 > Delete", ""COL_WHITE"Are you sure you want delete Character 2?\n"COL_YELLOW"Warning: You canno't undo this option.", "Yes, delete", "Cancel");
				    case 3: ShowPlayerDialog(playerid, DIALOG_ACCEPTDELETE, DIALOG_STYLE_MSGBOX, "Character 3 > Delete", ""COL_WHITE"Are you sure you want delete Character 3?\n"COL_YELLOW"Warning: You canno't undo this option.", "Yes, delete", "Cancel");
				}
	        }
	    }
	}

	if(dialogid == DIALOG_ACCEPTDELETE)
	{
	    if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    switch(CharacterPick[playerid])
	    {
	        case 1: DeleteCharacter(playerid, pInfo[playerid][pCharacter1], GetName(playerid), 1);
	        case 2: DeleteCharacter(playerid, pInfo[playerid][pCharacter2], GetName(playerid), 2);
	        case 3: DeleteCharacter(playerid, pInfo[playerid][pCharacter3], GetName(playerid), 3);
	    }
	    CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Character %d has been deleted.", CharacterPick[playerid]);
	    ShowCharacterList(playerid, GetName(playerid));
	}

	if(dialogid == DELETE_HOUSE)
	{
	    if(!response) return 1;
		for(new i = 0; i < MAX_HOUSES; i++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 2.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT]))
		    {
				DeleteHouse(playerid, i);
				break;
			}
		}
	}

	if(dialogid == DELETE_BIZZ)
	{
	    if(!response) return 1;
		for(new i = 0; i < MAX_BIZZES; i++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 2.5, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
		    {
				DeleteBizz(playerid, i);
				break;
			}
		}
	}

	if(dialogid == DIALOG_CREATE)
	{
	    if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    switch(CharacterPick[playerid])
	    {
	    	case 1: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 1 > Create", ""COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 2: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 2 > Create", ""COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 3: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 3 > Create", ""COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    }
	}

	if(dialogid == DIALOG_CREATE2)
	{
	    if(!response) return ShowCharacterList(playerid, GetName(playerid));
	    if(!IsRPName(inputtext))
	    {
		    switch(CharacterPick[playerid])
		    {
	    	case 1: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 1 > Create", ""COL_RED"Invalid name format!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 2: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 2 > Create", ""COL_RED"Invalid name format!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 3: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 3 > Create", ""COL_RED"Invalid name format!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
		    }
		    return 1;
	    }
		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", inputtext);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
		    switch(CharacterPick[playerid])
		    {
	    	case 1: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 1 > Create", ""COL_RED"Chosen name is already taken!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 2: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 2 > Create", ""COL_RED"Chosen name is already taken!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
	    	case 3: ShowPlayerDialog(playerid, DIALOG_CREATE2, DIALOG_STYLE_INPUT, "Character 3 > Create", ""COL_RED"Chosen name is already taken!\n"COL_WHITE"Enter your desired name using the correct roleplay format {33aa33}(Firstname_Lastname) "COL_WHITE"below:", "Create", "Back");
		    }
		    mysql_free_result();
		    return 1;
		}
		switch(CharacterPick[playerid])
		{
		    case 1: if(strcmp(pInfo[playerid][pCharacter1], "None" ,true) == 0) CreateCharacter(playerid, inputtext, GetName(playerid), 1);
		    case 2: if(strcmp(pInfo[playerid][pCharacter2], "None" ,true) == 0) CreateCharacter(playerid, inputtext, GetName(playerid), 2);
		    case 3: if(strcmp(pInfo[playerid][pCharacter3], "None" ,true) == 0) CreateCharacter(playerid, inputtext, GetName(playerid), 3);
		}
	}

	if(dialogid == HOUSE_MENU)
	{
	    if(!response) return 1;
	    new temp[128], name[25];
		switch(listitem)
		{
		    case 0:
		    {
		        new gTitle[64];
				if(InHouse[playerid] > 0)
				{
					if(hInfo[InHouse[playerid]][Owner] == cInfo[playerid][SQLID])
					{
						format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `ID` = '%d'", hInfo[InHouse[playerid]][Owner]);
						mysql_query(_query);
						mysql_store_result();
						if(mysql_num_rows())
						{
							if(mysql_retrieve_row()) {
						    	mysql_fetch_field_row(temp, "Name"), format(name, 25, temp);
							}
						}
					    format(gTitle, sizeof gTitle, "House %d Information", InHouse[playerid]);
				        format(gString, sizeof gString, ""COL_WHITE"Owner: %s\nMarket price: $%d\nRadio: %s\n{07aa0b}Rent Status:{FFFFFF} %s", name, hInfo[InHouse[playerid]][Price], hInfo[InHouse[playerid]][Radio] ? ("Yes") : ("No"), hInfo[InHouse[playerid]][Rentable] ? ("Yes") : ("No"));
						ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, gTitle, gString, "Okay", "");
					}
				}
		    }
		    case 1:
		    {
				if(InHouse[playerid] > 0)
				{
				    new price = hInfo[InHouse[playerid]][Price] - ((hInfo[InHouse[playerid]][Price]/100)*25);
				    format(gString, sizeof(gString), "~g~House sold for $%d", price);
                    GameTextForPlayer(playerid, gString, 3500, 4);
                    cInfo[playerid][cMoney] += price;
                    hInfo[InHouse[playerid]][Owner] = 0;
                    UpdateHouse(InHouse[playerid]);
				}
		    }
		}
	}

	if(dialogid == DIALOG_CONFIRMPM)
	{
		if(!response)
		    return true;

		if(!IsPlayerConnected(PMto[playerid]))
		    return CPF(playerid, COLOR_GRAY, "Given playerid is not connected.");

		format(gString, sizeof gString, "{FAD816}(( PM Sent to %s[%d]: %s ))", GetName(PMto[playerid]), PMto[playerid], PMcontent[playerid]);
		SendWrappedMessageToPlayer(playerid, 0xFFD900FF, gString);
		format(gString, sizeof gString, "{F2D429}(( PM From %s[%d]: %s))", GetName(playerid), playerid, PMcontent[playerid]);
		SendWrappedMessageToPlayer(PMto[playerid], 0xF2D429FF, gString);
	}

	if(dialogid == DIALOG_PHONE)
	{
	    if(!response) return true;
	    switch(listitem)
	    {
	        case 0: PhoneDialog(playerid);
	        case 1:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 1;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (White)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
	        case 2:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 2;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (Red)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
	        case 3:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 3;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (Green)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
	        case 4:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 4;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (Blue)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
	        case 5:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 5;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (Yellow)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
	        case 6:
	        {
    			if(cInfo[playerid][cMoney] < 500)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhone] = 100000 + random(999999);
				cInfo[playerid][cPhoneType] = 6;
				CPF(playerid, COLOR_GRAY, "You have bought a Cellphone (Purple)");
				CPF(playerid, -1, ""COL_YELLOW" * Your new cellphone number is %d.", cInfo[playerid][cPhone]);
				bInfo[InBiz[playerid]][Bank] += 500;
				cInfo[playerid][cMoney] -= 500;
	        }
			case 7:
			{
    			if(cInfo[playerid][cMoney] < 1000)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cPhoneCredits] += 1000;
				CPF(playerid, COLOR_GRAY, "You have bought 1000 credits.");
				bInfo[InBiz[playerid]][Bank] += 1000;
				cInfo[playerid][cMoney] -= 1000;
			}
			case 8:
			{
    			if(cInfo[playerid][cMoney] < 10000)
    			    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

                cInfo[playerid][cPhoneCredits] += 10000;
                CPF(playerid, COLOR_GRAY, "You have bought 10000 credits.");
                bInfo[InBiz[playerid]][Bank] += 10000;
                cInfo[playerid][cMoney] -= 10000;
			}
	    }
	}
	if(dialogid == DIALOG_UNIFORMS)
	{
	    if(!response) return 1;
	    if(fInfo[cInfo[playerid][cFaction]][Type] == 1)
	    {
	        switch(listitem)
	        {
	            case 0: SetPlayerSkin(playerid, 71);
	            case 1: SetPlayerSkin(playerid, 280);
	            case 2: SetPlayerSkin(playerid, 281);
	            case 3: SetPlayerSkin(playerid, 265);
	            case 4: SetPlayerSkin(playerid, 266);
	            case 5: SetPlayerSkin(playerid, 267);
	            case 6: SetPlayerSkin(playerid, 285);
	            case 7: SetPlayerSkin(playerid, 284);
                case 8: SetPlayerSkin(playerid, 211);
	        }
	    }
	    else if(fInfo[cInfo[playerid][cFaction]][Type] == 2)
	    {
	        switch(listitem)
	        {
	            case 0: SetPlayerSkin(playerid, 277);
	            case 1: SetPlayerSkin(playerid, 278);
	            case 2: SetPlayerSkin(playerid, 279);
	            case 3: SetPlayerSkin(playerid, 274);
	            case 4: SetPlayerSkin(playerid, 275);
	            case 5: SetPlayerSkin(playerid, 276);
	            case 6: SetPlayerSkin(playerid, 70);
	            case 7: SetPlayerSkin(playerid, 211);
			}
	    }
	}
	if(dialogid == DIALOG_SETSPAWN)
	{
	    if(!response) return 1;
	    switch(listitem)
	    {
	        case 0:
	        {
	            cInfo[playerid][cSpawn][0] = 1685.54;
				cInfo[playerid][cSpawn][1] = -2203.27;
				cInfo[playerid][cSpawn][2] = 13.5469;
				CPF(playerid, 0x33AA33FF, "Success: "COL_WHITE"Your spawn point has been set to Airport (Default)");
	        }
	        case 1:
	        {
	            if(cInfo[playerid][cFaction] <= 0)
	                return CPF(playerid, COLOR_GRAY, "You are not apart of a family.");

				switch(cInfo[playerid][cFaction])
				{
				    case 1:
				    {
			            cInfo[playerid][cSpawn][0] = 1543.7792;
						cInfo[playerid][cSpawn][1] = -1675.5090;
						cInfo[playerid][cSpawn][2] = 13.5571;
						CPF(playerid, 0x33AA33FF, "Success: "COL_WHITE"Your spawn point has been set to PD HQ");
				    }
				    case 2:
				    {
			            cInfo[playerid][cSpawn][0] = 1182.4381;
						cInfo[playerid][cSpawn][1] = -1324.1027;
						cInfo[playerid][cSpawn][2] = 13.5795;
						CPF(playerid, 0x33AA33FF, "Success: "COL_WHITE"Your spawn point has been set to EMS HQ");
				    }
				    default: CPF(playerid, COLOR_GRAY, "Your faction does not have a spawn point.");
				}
	        }
	        case 2:
	        {
	            if(InHouse[playerid] <= 0)
	                return CPF(playerid, COLOR_GRAY, "You are not inside a house.");

				if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID] && cInfo[playerid][cRenting] != InHouse[playerid])
				    return CPF(playerid, COLOR_GRAY, "You don't have this house keys.");

    			cInfo[playerid][cSpawn][0] = hInfo[InHouse[playerid]][X_OUT];
				cInfo[playerid][cSpawn][1] = hInfo[InHouse[playerid]][Y_OUT];
				cInfo[playerid][cSpawn][2] = hInfo[InHouse[playerid]][Z_OUT];
				CPF(playerid, 0x33AA33FF, "Success: "COL_WHITE"Your spawn point has been set to house");
	        }
	    }
	}
	if(dialogid == DIALOG_CLOTHES)
	{
	    if(!response) return 1;
     	if(!IsValidSkin(strval(inputtext)))
	        return ShowPlayerDialog(playerid, DIALOG_CLOTHES, DIALOG_STYLE_INPUT, "Clothes", ""COL_RED"Invalid Skin ID!\n"COL_WHITE"Enter your desired skin (1-299):\n{33AA33}Price: $250", "Buy", "Close");

		SetPlayerSkin(playerid, strval(inputtext));
		cInfo[playerid][cSkin] = strval(inputtext);
		CPF(playerid, -1, "{33AA33}You have bought new clothes for $250.");
		cInfo[playerid][cMoney] -= 250;
		bInfo[InBiz[playerid]][Bank] += 250;
	}
	if(dialogid == DIALOG_FOOD)
	{
	    new Float:plHealth;
	    if(!response)
			return true;

		switch(listitem)
		{
		    case 0: FoodDialog(playerid);
			case 1:
			{
			    if(cInfo[playerid][cMoney] < 50)
			        return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				GetPlayerHealth(playerid, plHealth);
				if(plHealth >= 100)
					return CPF(playerid, COLOR_GRAY, "You are not hungry (100 HP).");

				cInfo[playerid][cMoney] -= 50;
				SetPlayerHealth(playerid, plHealth+10);
				bInfo[InBiz[playerid]][Bank] += 50;
				CPF(playerid, 0x33aa33FF, "You have bought a Small Meal for $50.");
			}
			case 2:
			{
			    if(cInfo[playerid][cMoney] < 100)
			        return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				GetPlayerHealth(playerid, plHealth);
				if(plHealth >= 100)
					return CPF(playerid, COLOR_GRAY, "You are not hungry (100 HP).");

				cInfo[playerid][cMoney] -= 100;
				SetPlayerHealth(playerid, plHealth+20);
				bInfo[InBiz[playerid]][Bank] += 100;
				CPF(playerid, 0x33aa33FF, "You have bought a Medium Meal for $100.");
			}
			case 3:
			{
			    if(cInfo[playerid][cMoney] < 150)
			        return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				GetPlayerHealth(playerid, plHealth);
				if(plHealth >= 100)
					return CPF(playerid, COLOR_GRAY, "You are not hungry (100 HP).");

				cInfo[playerid][cMoney] -= 150;
				SetPlayerHealth(playerid, plHealth+30);
				bInfo[InBiz[playerid]][Bank] += 150;
				CPF(playerid, 0x33aa33FF, "You have bought a Large Meal for $150.");
			}
		}
	}
	if(dialogid == DIALOG_247)
	{
	    if(!response)
			return true;

		switch(listitem)
		{
		    case 0: Show247Dialog(playerid);
		    case 1:
		    {
		        if(HaveDice[playerid] == true)
		            return CPF(playerid, COLOR_GRAY, "You already have a Dice.");

		        if(cInfo[playerid][cMoney] < 50)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				HaveDice[playerid] = true;
				CPF(playerid, 0x33aa33FF, "You have bought a Dice for $50.");
				cInfo[playerid][cMoney] -= 50;
		    }
		    case 2:
		    {
		        if(cInfo[playerid][cMoney] < 150)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

                CPF(playerid, 0x33aa33FF, "You have bought a Baseball Bat for $150.");
                GivePlayerWeaponEx(playerid, 5, 1);
                cInfo[playerid][cMoney] -= 150;
		    }
		    case 3:
		    {
		        if(cInfo[playerid][cMoney] < 150)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

                CPF(playerid, 0x33aa33FF, "You have bought a Spray Can for $150.");
                GivePlayerWeaponEx(playerid, 41, 1);
                cInfo[playerid][cMoney] -= 150;
		    }
		    case 4:
		    {
		        if(HaveGasCan[playerid] == true)
		            return CPF(playerid, COLOR_GRAY, "You already have a Gas Can.");

		        if(cInfo[playerid][cMoney] < 250)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				HaveGasCan[playerid] = true;
				CPF(playerid, 0x33aa33FF, "You have bought a Gas Can for $250.");
				cInfo[playerid][cMoney] -= 250;
		    }
		    case 5:
		    {
		        if(cInfo[playerid][cHaveRadio] >= 1)
		            return CPF(playerid, COLOR_GRAY, "You already have a Radio Device.");

		        if(cInfo[playerid][cMoney] < 2000)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");


				CPF(playerid, 0x33aa33FF, "You have bought a Radio Device for $2000.");
				cInfo[playerid][cHaveRadio] = 1;
				cInfo[playerid][cMoney] -= 2000;
		    }
			case 6:
			{
		        if(HaveMask[playerid] == true || cInfo[playerid][cDonator] > 0 || pInfo[playerid][AdminLevel] > 0)
		            return CPF(playerid, COLOR_GRAY, "You already have a Mask.");

		        if(cInfo[playerid][cMoney] < 3500)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");


				CPF(playerid, 0x33aa33FF, "You have bought a Mask for $3500.");
				HaveMask[playerid] = true;
				cInfo[playerid][cMoney] -= 3500;
			}
			case 7:
			{
		        if(cInfo[playerid][cBoombox] == 1)
		            return CPF(playerid, COLOR_GRAY, "You already have a Boombox.");

		        if(cInfo[playerid][cMoney] < 1500)
		            return CPF(playerid, COLOR_GRAY, "You don't have enough money.");


				CPF(playerid, 0x33aa33FF, "You have bought a Boombox for $1500.");
				cInfo[playerid][cBoombox] = 1;
				cInfo[playerid][cMoney] -= 1500;
			}
		}
	}

	if(dialogid == DIALOG_PIZZA && response)
	{
		if(PizzaMission[playerid][OnMission]) return 1;
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "You're not on a pizza bike.");
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 448) return SendClientMessage(playerid, -1, "You're not on a pizza bike.");
		PizzaMission[playerid][PizzaSeconds] = 0;
		PizzaMission[playerid][PizzaWarmth] = 100;
		PizzaMission[playerid][OnMission] = true;
		PizzaMission[playerid][MissionBike] = GetPlayerVehicleID(playerid);
		PizzaLeft[GetPlayerVehicleID(playerid)] = 5;
		PlayerTextDrawSetString(playerid, PizzaDraw, "~g~Timer: ~w~0 seconds~n~~g~Pizza Warmth: ~r~100%");
		PlayerTextDrawShow(playerid, PizzaDraw);
		PizzaMission[playerid][PizzaTimer] = SetTimerEx("UpdatePizzaTextdraw", 1000, 1, "ii", playerid, PizzaMission[playerid][PizzaSeconds]);
		new hid = GetRandomHouseWithRange(playerid);
		PizzaMission[playerid][CPPOS][0] = hInfo[hid][X_OUT];
		PizzaMission[playerid][CPPOS][1]  =  hInfo[hid][Y_OUT];
		PizzaMission[playerid][CPPOS][2]  =  hInfo[hid][Z_OUT];
		SetPlayerCheckpoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2], 2.0);
		new sumstring[256];
		new ss[32];
		GetPlayer2DZone(playerid, ss, 32);
		new sd[32];
		Get2DZone(PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], sd, 32);
		format(sumstring, 256, "             "COL_YELLOW"New Delivery Acquired!\n"COL_WHITE"Current Location: %s\nDelivery Address: %s\nDistance: %.2fm\n"COL_YELLOW"Pizzas left: %d.", ss, hInfo[hid][Address], GetPlayerDistanceFromPoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2]), PizzaLeft[PizzaMission[playerid][MissionBike]]);
		ShowPlayerDialog(playerid, 1336, DIALOG_STYLE_MSGBOX, "Delivery Status", sumstring, "Confirm", "");
	}

	if(dialogid == DIALOG_SKINSTART)
	{
	    if(!response) return CPF(playerid, COLOR_GRAY, "You have chosen to not set up a skin, go to the nearest clothing shop to change it."), cInfo[playerid][cFirstLogin] = 0;
        if(!IsValidSkin(strval(inputtext)))
		{
		    ShowPlayerDialog(playerid, DIALOG_SKINSTART, DIALOG_STYLE_INPUT, "Skin", ""COL_WHITE"Wrong skin ID!\nPlease enter the skin ID you would like to have at the begining (1-299):", "Okay", "Cancel");
		}
		else
		{
			cInfo[playerid][cFirstLogin] = 0;
			SetPlayerSkin(playerid, strval(inputtext));
			cInfo[playerid][cSkin] = strval(inputtext);
		}
	}

	if(dialogid == DIALOG_JOBS && response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            cInfo[playerid][cJob] = DELIVERY_MAN_JOB;
	            CPF(playerid, 0x33AA33FF, "You are now a Delivery Man! /help to review the job cmds.");
	        }
	        case 1:
	        {
	            cInfo[playerid][cJob] = PIZZA_JOB;
	            CPF(playerid, 0x33AA33FF, "You are now a Pizza Boy! /help to review the job cmds.");
	        }
	        case 2:
	        {
	            cInfo[playerid][cJob] = GARBAGE_MAN_JOB;
	            CPF(playerid, 0x33AA33FF, "You are now a Garbage Man! /help to review the job cmds.");
	        }
	        case 3:
	        {
	            cInfo[playerid][cJob] = FISHER_MAN_JOB;
	            CPF(playerid, 0x33AA33FF, "You are now a Fisherman! /help to review the job cmds.");
	        }
	        case 4:
	        {
	            cInfo[playerid][cJob] = TAXI_DRIVER_JOB;
	            CPF(playerid, 0x33AA33FF, "You are now a Taxi Driver! /help to review the job cmds.");
	        }
	    }
	}

	if(dialogid == DIALOG_LICENSE)
	{
	    if(!response) return 1;
		switch(listitem)
		{
		    case 0:
			{
		        if(cInfo[playerid][cDrivingLicense] == 1)
		            return CPF(playerid, COLOR_GRAY, "You already possess a driving license.");

				else if(DLic[playerid][TookTest] == true)
				    return CPF(playerid, COLOR_GRAY, "You already took a driving test, head to a vehicle outside.");

				else if(cInfo[playerid][cMoney] < 500)
				    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

				cInfo[playerid][cMoney] -= 500;
				CPF(playerid, 0x33AA33FF, "You have bought a driving test! Head to the vehicles outside to complete your license.");
				DLic[playerid][TookTest] = true;
		    }
		}
	}

	if(dialogid == DIALOG_FURNITURE)
	{
		if(!response) return 1;
		if(InHouse[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You are not inside a House.");
		if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_RED, "You are not the owner of this house.");
		switch(listitem)
		{
		    case 0:
			{
			    ShowPlayerDialog(playerid, DIALOG_FURNITUREBUY, DIALOG_STYLE_LIST, "Buy Furniture - Categories", "Beds\nDecorations\nComfort\nDoors\nElectronics\nCabinets\nKitchen\nPlumbing\nGyms\nOther\nSpecial", "Select", "Back");
			}
			case 1:
			{
			    new count = 0, helpstr[1600], test = 0;
                ClearItems(playerid);
				for(new i =0; i < MAX_FURNITURES; i++)
				{
					if(Furn[i][ID] <= 0) continue;
					if(Furn[i][HouseID] == InHouse[playerid])
					{
					    count++;
						format(gString, sizeof(gString), "%d. %s\n", count, Furn[i][ObjectName]);
					 	strcat(helpstr, gString);
					 	pList[playerid][test] = i;
					 	test++;
				 	}
				}
				if(count <= 0) return CPF(playerid, COLOR_RED, "You have no furnitures in your house.");
				ShowPlayerDialog(playerid, 900, DIALOG_STYLE_LIST, "Furniture List", helpstr, "Edit", "Back");
			}
		}
	}
	if(dialogid == 900)
	{
	    if(!response)
	    {
			switch(cInfo[playerid][cDonator])
			{
				case 1: format(gString, sizeof(gString), "Furniture (%d/50)", CountHouseFurnitures(InHouse[playerid]));
				case 2: format(gString, sizeof(gString), "Furniture (%d/70)", CountHouseFurnitures(InHouse[playerid]));
				case 3: format(gString, sizeof(gString), "Furniture (%d/100)", CountHouseFurnitures(InHouse[playerid]));
				default: format(gString, sizeof(gString), "Furniture (%d/30)", CountHouseFurnitures(InHouse[playerid]));
			}
			ShowPlayerDialog(playerid, DIALOG_FURNITURE, DIALOG_STYLE_LIST, gString, "Buy Furniture\nFurniture List", "Select", "Close");
	        return 1;
	    }
	    SelectFurn[playerid] = GetItem(listitem);
	    format(gString, sizeof(gString), "%s", Furn[GetItem(listitem)][ObjectName]);
	    ShowPlayerDialog(playerid, 901, DIALOG_STYLE_LIST, gString, "Edit Position\nSell Furniture", "Select", "Back");
	}
	if(dialogid == 901)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            new param = SelectFurn[playerid];
	            CPF(playerid, -1, "You are now editing the position of "COL_RED"%s", Furn[param][ObjectName]);
                EditDynamicObject(playerid, Furn[param][Object]);
			    EditingFurn[playerid] = true;
			    BuyingFurn[playerid] = false;
	        }
	        case 1:
	        {
	            new param = SelectFurn[playerid];
	            new Float:price;
	            new price2;
				for(new i =0; i < sizeof(Furnitures); i++)
				{
				    if(Furnitures[i][Object] != Furn[param][ObjectID]) continue;
				    price = Furnitures[i][Price] / 2;
				    price2 = floatround(price, floatround_ceil);
				    break;
				}
				CPF(playerid, COLOR_RED, "You have sold %s for $%d.", Furn[param][ObjectName], price2);
				cInfo[playerid][cMoney] += price2;
				format(_query, sizeof(_query), "DELETE FROM `furnitures` WHERE `ID` = '%d'", Furn[param][ID]);
				mysql_query(_query);
				if(Furn[param][Authority] == 2)
				{
				    new saf = GetSafeID(InHouse[playerid]);
					Safe[saf][ID] = 0;
					Safe[saf][HouseID] = 0;
					Safe[saf][sMoney] = 0;
					Safe[saf][sLocked] = false;
					Safe[saf][Code] = 0;
					DestroyDynamic3DTextLabel(Safe[saf][sLabel]);
				}
				DestroyDynamicObject(Furn[param][Object]);
				Furn[param][ID] = 0;
				Furn[param][ObjectID] = 0;
				format(Furn[param][ObjectName], 128, "None");
				Furn[param][Opened] = 0;
				Furn[param][Locked] = 0;
				Furn[param][HouseID] = 0;
				Furn[param][Authority] = 0;
				Furn[param][VirtualWorld] = 0;
				Furn[param][fINT] = 0;
				Furn[param][pos][0] = 0.0;
				Furn[param][pos][1] = 0.0;
				Furn[param][pos][2] = 0.0;
				Furn[param][rot][0] = 0.0;
				Furn[param][rot][1] = 0.0;
				Furn[param][rot][2] = 0.0;

	        }
	    }
	}
	if(dialogid == DIALOG_FURNITUREBUY)
	{
	    if(!response)
	    {
			switch(cInfo[playerid][cDonator])
			{
				case 1: format(gString, sizeof(gString), "Furniture (%d/50)", CountHouseFurnitures(InHouse[playerid]));
				case 2: format(gString, sizeof(gString), "Furniture (%d/70)", CountHouseFurnitures(InHouse[playerid]));
				case 3: format(gString, sizeof(gString), "Furniture (%d/100)", CountHouseFurnitures(InHouse[playerid]));
				default: format(gString, sizeof(gString), "Furniture (%d/30)", CountHouseFurnitures(InHouse[playerid]));
			}
			ShowPlayerDialog(playerid, DIALOG_FURNITURE, DIALOG_STYLE_LIST, gString, "Buy Furniture\nFurniture List", "Select", "Close");
	        return 1;
	    }
		if(InHouse[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You are not inside a House.");
		if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_RED, "You are not the owner of this house.");
	    new count, test = 0, objects[100];
	    ClearItems(playerid);
		for(new i =0; i < sizeof(Furnitures); i++)
		{
			if(Furnitures[i][Category] != (listitem+1)) continue;
			objects[count] = Furnitures[i][Object];
		    count++;
			/*format(gString, sizeof(gString), "%d. %s - $%d\n", count, Furnitures[i][Name], Furnitures[i][Price]);
		 	strcat(helpstr, gString);*/
            pList[playerid][test] = i;
		 	test++;
		}
		ShowModelSelectionMenuEx(playerid, objects, count, "Furnitures", 1, 0.0, 0.0, -30.0);
		//ShowPlayerDialog(playerid, DIALOG_FURNITURECAT, DIALOG_STYLE_LIST, "Buy Furniture", helpstr, "Buy", "Back");
	}
	if(dialogid == DIALOG_FURNITURECAT)
	{
	    if(!response) return ShowPlayerDialog(playerid, DIALOG_FURNITUREBUY, DIALOG_STYLE_LIST, "Buy Furniture - Categories", "Beds\nDecorations\nComfort\nDoors\nElectronics\nCabinets\nKitchen\nPlumbing\nGyms\nOther\nSpecial", "Select", "Back");
	    new temp = GetItem(listitem);
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

	if(dialogid == 780 && response)
	{
	    format(gString, sizeof(gString), ""COL_YANIR"Help request from %s [ID: %d]:\n_______\n"COL_WHITE"%s\n_______\nDo you wish to handle this help request?", GetPlayerNameEx(DLItemID), DLItemID, HelpString[DLItemID]);
	    ShowPlayerDialog(playerid, 781, DIALOG_STYLE_MSGBOX, "View help request", gString, "Accept", "Cancel");
	    CaringAbout[playerid] = DLItemID;
	}
	if(dialogid == 781)
	{
		if(!response) return 1;
		CPF(playerid, -1, ""COL_YANIR"You have accepted %s's help request. You may assist him via PMs now.", GetPlayerNameEx(CaringAbout[playerid]));
		CPF(CaringAbout[playerid], -1, ""COL_YANIR"Moderator %s has accepted your help request. He will contact you shortly.", GetPlayerNameEx(playerid));
		NeedHelp[CaringAbout[playerid]] = 0;
		HelpString[CaringAbout[playerid]] = "None";
		CaringAbout[playerid] = -1;
	}

	if(dialogid == 800 && response)
	{
	    new helpstr[256];
	    format(helpstr, sizeof(helpstr), ""COL_YELLOW"Taxi Call\nCaller: "COL_WHITE"%s\n"COL_YELLOW"Phone Number: "COL_WHITE"%d\n"COL_YELLOW"Location: "COL_WHITE"%s", GetPlayerNameEx(DLItemID), cInfo[DLItemID][cPhone], TaxiString[DLItemID]);
	    ShowPlayerDialog(playerid, 801, DIALOG_STYLE_MSGBOX, "View taxi call", helpstr, "Respond", "Back");
	    CaringAbout[playerid] = DLItemID;
	}
	if(dialogid == 801)
	{
		if(!response)
		{
			new helpc=0;
			new helpstr[1600];
			for(new i =0; i < GetMaxPlayers(); i++)
			{
				if(!IsPlayerConnected(i) || !Logged[i]) continue;
				if(!RequestedTaxi[i]) continue;
				format(helpstr, sizeof(helpstr), ""COL_YELLOW"[CALL] "COL_WHITE"%s [Phone Number: %d]", GetPlayerNameEx(i), cInfo[i][cPhone]);
			 	AddDListItem(playerid, helpstr, i, -1);
			 	helpc++;
			}
			if(helpc == 0) return SendClientMessage(playerid, COLOR_GRAY, "There are no calls waiting for response.");
			ShowPlayerDList(playerid, 800, "Taxi Call Dispatch", "Select", "Close");
			return 1;
		}
		if(TaxiFare[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You didn't set your fare (/setfare)");
		format(gString, sizeof(gString), ""COL_YELLOW"* Taxi Driver %s has responded to %s call.", GetPlayerNameEx(playerid), GetPlayerNameEx(CaringAbout[playerid]));
		SendTaxiMessage(-1, gString);
		CPF(CaringAbout[playerid], COLOR_GREEN, "* Taxi Driver %s has responded to your call (his/her fare is $%d), he'll be there shortly.", GetPlayerNameEx(playerid), TaxiFare[playerid]);
		RequestedTaxi[CaringAbout[playerid]] = false;
		HelpString[CaringAbout[playerid]] = "None";
		CaringAbout[playerid] = -1;
	}
	Clear_DList(playerid);

    switch(dialogid)
    {
            case DIALOG_APB_CREATE_1:
            {
                    if(!response || strlen(inputtext) == 0)
                            return 0;
                    if(strlen(inputtext) > 64)
                            return ShowPlayerDialog(playerid, DIALOG_APB_CREATE_1, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Create", "You cannot write more than 64 characters!\n\nWrite below the APB you want to issue out", "Next", "Cancel");
                    new
                            id = GetFreeAPB(),
                            szString[64];
                    format(szString, sizeof(szString), "%s", inputtext);
                    _APB[id][ID] = id;
                    _APB[id][APB] = szString;
                    SetPVarInt(playerid, "APBid", id);
                    format(g_szMessage, sizeof(g_szMessage), "APB: %s\nWrite the charges below:", _APB[id][APB]);
                    ShowPlayerDialog(playerid, DIALOG_APB_CREATE_2, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Create", g_szMessage, "Create", "Cancel");
            }
            case DIALOG_APB_CREATE_2:
            {
                    new
                            id = GetPVarInt(playerid, "APBid"),
                            szString[64];
                    if(!response || strlen(inputtext) == 0)
                            return 0, _APB[id][ID] = 0;
                    if(strlen(inputtext) > 64)
                    {
                            format(g_szMessage, sizeof(g_szMessage), "APB: %s\nYou cannot write more than 64 characters!\n\nWrite the charges below:", _APB[id][APB]),
                            ShowPlayerDialog(playerid, DIALOG_APB_CREATE_2, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Create", g_szMessage, "Create", "Cancel");
                    }
                    new hour, minute, second;
                    gettime(hour, minute, second);
                    getdate(year, month, day);
                    format(szString, sizeof(szString), "%s", inputtext);
                    _APB[id][Charge] = szString;
                    format(szString, sizeof(szString), "%s [%d/%d/%d %d:%d:%d]", PlayerName[playerid], day, month, year, hour, minute, second);
                    _APB[id][Creator] = szString;
                    format(szString, sizeof(szString), "None");
                    _APB[id][Modified] = szString;
                    format(g_szMessage, sizeof(g_szMessage), "APB: %s %s has issued new All Points Bulletin, /apb details %d for further details.", cInfo[playerid][cRank], PlayerName[playerid], id);
                    SendFactionMessage(1, COLOR_RED, g_szMessage);
                    DeletePVar(playerid, "APBid");
            }
            case DIALOG_APB_DETAILS:
            {
                    if(!response)
                            return 0;
                    new
                            id = GetPVarInt(playerid, "APBid");
                    format(g_szMessage, sizeof(g_szMessage), "________ All Points Bulletin %d________", id);
                    SendClientMessage(playerid, COLOR_RED, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "APB: %s", _APB[id][APB]);
                    SendClientMessage(playerid, COLOR_RED, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "CHARGES: %s", _APB[id][Charge]);
                    SendClientMessage(playerid, COLOR_RED, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "MODIFIED BY: %s", _APB[id][Modified]);
                    SendClientMessage(playerid, COLOR_RED, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "____ ISSUED BY: %s____", _APB[id][Creator]);
                    SendClientMessage(playerid, COLOR_RED, g_szMessage);
                    DeletePVar(playerid, "APBid");
            }
            case DIALOG_APB_MODIFY:
            {
                    if(!response)
                            return 0;
                    switch(listitem)
                    {
                            case 0: ShowPlayerDialog(playerid, DIALOG_APB_MODIFY_1, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Modify APB", "     Write APB below:", "Edit", "Cancel");
                            case 1: ShowPlayerDialog(playerid, DIALOG_APB_MODIFY_2, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Modify Charges", "     Write charges below:", "Edit", "Cancel");
                    }
            }
            case DIALOG_APB_MODIFY_1:
            {
                    if(!response)
                            return 0;
                    new
                            szString[64],
                            id = GetPVarInt(playerid, "APBid");
                    new hour, minute, second;
                    gettime(hour, minute, second);
                    getdate(year, month, day);
                    format(szString, sizeof(szString), "%s [%d/%d/%d %d:%d:%d]", PlayerName[playerid], day, month, year, hour, minute, second);
                    _APB[id][Modified] = szString;
                    format(szString, sizeof(szString), "%s", inputtext);
                    _APB[id][APB] = szString;
                    format(g_szMessage, sizeof(g_szMessage), "APB: %s %s modified All Points Bulletin %d, /apb details %d for further details.", cInfo[playerid][cRank], PlayerName[playerid], id, id);
                    SendFactionMessage(1, COLOR_RED, g_szMessage);
                    DeletePVar(playerid, "APBid");
            }
            case DIALOG_APB_MODIFY_2:
            {
                    if(!response)
                            return 0;
                    new
                            szString[64],
                            id = GetPVarInt(playerid, "APBid");

                    new hour, minute, second;
                    gettime(hour, minute, second);
                    getdate(year, month, day);
                    format(szString, sizeof(szString), "%s [%d/%d/%d %d:%d:%d]", PlayerName[playerid], day, month, year, hour, minute, second);
                    _APB[id][Modified] = szString;
                    format(szString, sizeof(szString), "%s", inputtext);
                    _APB[id][Charge] = szString;
                    format(g_szMessage, sizeof(g_szMessage), "APB: %s %s modified All Points Bulletin %d, /apb details %d for further details.", cInfo[playerid][cRank], PlayerName[playerid], id, id);
                    SendFactionMessage(1, COLOR_RED, g_szMessage);
                    DeletePVar(playerid, "APBid");
            }
            case DIALOG_MDC_MAIN:
            {
                    if(!response)
                            return 0;
                    switch(listitem)
                    {
                            case 0: ShowPlayerDialog(playerid, DIALOG_MDC_NAME, DIALOG_STYLE_INPUT, DIALOG_MDC_TITLE" - Name Search", "Enter a name below: (( playerID ))", "Search", "Cancel");
                            case 1: ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_ID, DIALOG_STYLE_INPUT, DIALOG_MDC_TITLE" - Plate Search", "Enter a license plate below: (( playerID ))", "Search", "Cancel");
                            case 2: ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_NAME, DIALOG_STYLE_INPUT, DIALOG_MDC_TITLE" - Plate Search", "Enter a license plate below: (( Plate ))", "Search", "Cancel");
                    }
            }
            case DIALOG_MDC_NAME:
            {
                    if(!response || strlen(inputtext) <= 0 || strlen(inputtext) >= 3)
                            return 0;
                    if(IsNumeric(inputtext))
                    {
                            if(!IsPlayerConnected(strval(inputtext)))
                                    return ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
                            format(_query, sizeof(_query), "NAME SEARCH RESULT\n\nFull name: %s\nDrivers license: %s\nPhone number: %s\n%s\n%s\n\n%s", PlayerName[strval(inputtext)], PlayerLicense(strval(inputtext)), PlayerPhone(strval(inputtext)), PlayerHouse(strval(inputtext)), PlayerVehicle(strval(inputtext)), PlayerCharges(cInfo[playerid][SQLID]));
                            ShowPlayerDialog(playerid, DIALOG_MDC_NAME_PRINT, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Name Search", _query, "Print", "Cancel");
                            SetPVarInt(playerid, "MDCid", strval(inputtext));
                    }
                    else
                            ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
            }
            case DIALOG_MDC_PLATE_ID:
            {
                    if(!response || strlen(inputtext) <= 0 || strlen(inputtext) >= 3)
                            return 0;
                    if(IsNumeric(inputtext))
                    {
                            if(!IsPlayerConnected(strval(inputtext)) || !IsPlayerInAnyVehicle(strval(inputtext)))
                                    return ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
                            new
                                    vehicleid = GetPlayerVehicleID(strval(inputtext));
                            if(vInfo[vehicleid][ID] <= 0)
                                    return ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
                            format(g_szMessage, sizeof(g_szMessage), "PLATE SEARCH RESULT\n\nOwner: %s\nModel: %s\nPlate: %s", vInfo[vehicleid][Owner], GetVehicleName(vehicleid), vInfo[vehicleid][Plate]);
                            ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_ID, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Plate Search", g_szMessage, "Select", "Cancel");
                    }
                    else
                            ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
            }
            case DIALOG_MDC_PLATE_NAME:
            {
                    if(!response || strlen(inputtext) <= 0 || strlen(inputtext) >= 64)
                            return 0;
                    new
                            vehicleid = GetVehicleFromPlate(inputtext);
                    if(vehicleid <= 0)
                            return ShowPlayerDialog(playerid, DIALOG_MDC_ERROR, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Error", "No results found", "Select", "Cancel");
                    format(g_szMessage, sizeof(g_szMessage), "PLATE SEARCH RESULT\n\nOwner: %s\nModel: %s\nPlate: %s", vInfo[vehicleid][Owner], GetVehicleName(vehicleid), vInfo[vehicleid][Plate]);
                    ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_ID, DIALOG_STYLE_MSGBOX, DIALOG_MDC_TITLE" - Plate Search", g_szMessage, "Select", "Cancel");

            }
            case DIALOG_MDC_NAME_PRINT:
            {
                    if(!response)
                            return 0;
                    new
                            id = GetPVarInt(playerid, "MDCid");
                    format(g_szMessage, sizeof(g_szMessage), "______%s______", DIALOG_MDC_TITLE);
                    SendClientMessage(playerid, 0xFFFFFFFF, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "Full name: %s", PlayerName[id]);
                    SendClientMessage(playerid, 0xFFFFFFFF, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "Phone number: %s", PlayerPhone(id));
                    SendClientMessage(playerid, 0xFFFFFFFF, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "%s", PlayerHouse(id));
                    SendClientMessage(playerid, 0xFFFFFFFF, g_szMessage);
                    format(g_szMessage, sizeof(g_szMessage), "Driving license: %s", PlayerLicense(id));
                    SendClientMessage(playerid, 0xFFFFFFFF, g_szMessage);
                    SendClientMessage(playerid, 0xFFFFFFFF, "________________________");
                    DeletePVar(playerid, "MDCid");

            }
    }
	return 1;
}
