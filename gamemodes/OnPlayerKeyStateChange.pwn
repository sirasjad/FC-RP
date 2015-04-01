==============================================================================
== OnPlayerKeyStateChange
==============================================================================*/

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
	    if(GetBagItemCount(playerid) <= 0) return CPF(playerid, COLOR_GRAY, "You do not possess any items.");
	    Bag_Page[playerid] = 0;
	    ShowBag(playerid);
    }
	if (newkeys & KEY_YES)
	{
	    if(AttachingWeapon[playerid] > 0)
	    {
	        new id = AttachingWeapon[playerid];
	        if(Bag[playerid][bagItemLoadAmount][id] > 0) return GameTextForPlayer(playerid, "~r~Your weapon already has a magazine in it!", 2500, 4);
			new bullet_type;
	        switch(Bag[playerid][bagItem][id])
			{
			    case 22..24: bullet_type = 101;
			    case 26..27: bullet_type = 100;
			    case 28..32: bullet_type = 102;
			    case 33..34: bullet_type = 103;
			}
			for(new i = 0; i < MAX_ITEMS; i++)
			{
				if(Bag[playerid][bagItem][i] <= 0) continue;
				if(Bag[playerid][bagItem][i] == bullet_type)
				{
				    _RemoveDatabaseItem(Bag[playerid][bagItemID][i]);
	                RemovePlayerAttachedObject(playerid, 2);
	                Bag[playerid][bagItemLoaded][id] = 1;
	                Bag[playerid][bagItemLoadAmount][id] = Bag[playerid][bagItemAmount][i];
	                CPF(playerid, COLOR_GRAY, "SERVER: "COL_WHITE"Loaded %s with %s magazine.", GetItemName(Bag[playerid][bagItem][id]), GetItemName(Bag[playerid][bagItem][i]));
					GivePlayerWeaponEx(playerid, Bag[playerid][bagItem][id], Bag[playerid][bagItemAmount][i]);
					_RemoveBagItem(playerid, Bag[playerid][bagItemID][i]);
					ApplyAnimation(playerid,"PYTHON","python_reload",4.1,0,0,0,0,0,0);
				    break;
				}
			}
		}
	}
    if(newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP) && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
    {
		ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff",4.1,0,1,1,0,0);
		ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff",4.1,0,1,1,0,0);
    }
	if(newkeys & KEY_FIRE)
    {
		if(Spawned[playerid])
		{
		     new weapon = GetPlayerWeapon(playerid);
		     if(weapon != 0 && !PlayerWeapons[playerid][weapon] && weapon != 40) // if weapon is not fists, and weapon is not a remote control.
		     {
				format(gString, sizeof(gString), ""COL_RED"ANTICHEAT WARNING:"COL_WHITE" %s[%d] has a weapon %s (Ammo: %d) and shouldn't.", GetName(playerid), playerid, WeaponNames[weapon], GetPlayerAmmo(playerid));
		        if(AnticheatSpam[playerid] == false) SendAdminMessage(-1, gString);
		        AnticheatSpam[playerid] = true;
		        SetTimerEx("PreventACSpam", 7500, false, "i", playerid);
		        RemovePlayerWeapon(playerid, GetPlayerWeapon(playerid));
			}
		}
	}
    if(((newkeys & KEY_FIRE) == KEY_FIRE) || (((newkeys & KEY_FIRE) != KEY_FIRE) && ((oldkeys & KEY_FIRE) == KEY_FIRE)))
    {
        switch(GetPlayerAnimationIndex(playerid))
        {
            case 1160 .. 1163, 1167:
            {
                switch(GetPlayerWeapon(playerid))
                {
                    case 0..18, 35..46, 28, 32:
                    {
                        return 0;
                    }
                    default:
                    {
                        HasFiredTime[playerid] = GetTickCount();
                    }
                }
            }
        }
    }
    if(((newkeys & KEY_CROUCH) == KEY_CROUCH) && ((oldkeys & KEY_CROUCH) != KEY_CROUCH))
    {
        if((GetTickCount() - HasFiredTime[playerid]) < 500)
        {
            ClearAnimations(playerid);
            ApplyAnimation( playerid, "PED", "XPRESSscratch", 0.0, 1, 0, 0, 0, 200, 1 );
        }
    }

	return 1;
}
