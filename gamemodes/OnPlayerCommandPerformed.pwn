==============================================================================
== OnPlayerCommandPerformed
==============================================================================*/

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!Logged[playerid]) return true;
	if(Tutorial[playerid] > 0) return CPF(playerid, COLOR_RED, "Commands are temporarily disabled on tutorial.");
	printf(">> [CMD] %s used %s", GetName(playerid), cmdtext);
	if(!success) return SendClientMessage(playerid, -1, ""COL_WHITE"ERROR: Command was not found in the database, please try using /cmds.");
 	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
    if(!Logged[playerid]) return 0;
	return 1;
}

//==============================================================================

CMD:re(playerid, params[])
	return cmd_report(playerid, params);

CMD:f(playerid, params[])
	return cmd_family(playerid, params);

CMD:mods(playerid, params[])
	return cmd_moderators(playerid, params);

CMD:m(playerid, params[])
	return cmd_mchat(playerid, params);

CMD:inv(playerid, params[])
	return cmd_inventory(playerid, params);

CMD:commands(playerid, params[])
	return cmd_help(playerid, params);

CMD:g(playerid, params[])
	return cmd_group(playerid, params);

CMD:r(playerid, params[])
	return cmd_radio(playerid, params);
	
CMD:help(playerid, params[])
	return cmd_cmds(playerid, params);
	
//==============================================================================

CMD:cmds(playerid, params[])
{
	new fac = cInfo[playerid][cFaction];
	CPF(playerid, COLOR_FADE2, "Account: /refundstamp, /changepass, /forumname, /resetobjects, /clearcp");
	CPF(playerid, COLOR_FADE2, "General: /admins, /mods, /report, /helpme, /my, /buy, /factionon, /isafk");
	CPF(playerid, COLOR_FADE2, "General: /accept, /acceptfrisk, /denyfrisk, /phone, /jobs, /animlist");
	CPF(playerid, COLOR_FADE2, "Communication: /say, /l, /s, /w, /b, /pm, /me, /do, /ame");
	CPF(playerid, COLOR_FADE2, "Property: /enter, /exit, /house, /bizz, /rent, /unrent");
	if(cInfo[playerid][cOOCGroup] >= 1) CPF(playerid, COLOR_FADE2, "Group: /g, /gon, /leavegroup");
	if(cInfo[playerid][cOLeader] >= 1) CPF(playerid, COLOR_FADE2, "Group: /ginvite, /guninvite, /gchat");
	if(cInfo[playerid][cFaction] >= 1) CPF(playerid, COLOR_FADE2, "Faction: /f, /fon, /factionranks, /leavefaction");
	if(cInfo[playerid][cLeader] >= 1) CPF(playerid, COLOR_FADE2, "Faction leader: /faction");
	if(fInfo[fac][Type] == 1) CPF(playerid, COLOR_FADE2, "LSPD: /duty, /cuff, /armoury, /uniform, /megaphone, /arrest, /mdc");
	if(fInfo[fac][Type] == 1) CPF(playerid, COLOR_FADE2, "LSPD: /frisk, /siren, /spike, /roadblock, /apb, /givelicense, /takelicense");
	if(fInfo[fac][Type] == 2) CPF(playerid, COLOR_FADE2, "LSFD: /duty, /uniform, /heal, /putinambu, /terminate");
	if(cInfo[playerid][cJob] == DELIVERY_MAN_JOB) CPF(playerid, COLOR_FADE2, "Job: /cargo, /leavejob");
	if(cInfo[playerid][cJob] == GARBAGE_MAN_JOB) CPF(playerid, COLOR_FADE2, "Job: /garbage, /leavejob");
	if(cInfo[playerid][cJob] == PIZZA_JOB) CPF(playerid, COLOR_FADE2, "Job: /pizza, /takepizza, /stoppizza, /storepizza, /pizzacp, /leavejob");
	if(cInfo[playerid][cJob] == FISHER_MAN_JOB) CPF(playerid, COLOR_FADE2, "Job: /fish, /sellfish, /leavejob");
	if(cInfo[playerid][cJob] == TAXI_DRIVER_JOB) CPF(playerid, COLOR_FADE2, "Job: /taxiduty, /taxi_calls, /setfare, /startfare, /leavejob");
	if(pInfo[playerid][AdminLevel] == 1) CPF(playerid, 0xA52A2AAA, "Moderator: /mduty, /helprequests, /set");
	if(pInfo[playerid][AdminLevel] > 1) CPF(playerid, 0x33AA33FF, "Administrator: /aduty, /acmds");
	return 1;
}

CMD:animlist(playerid, params[])
{
	CPF(playerid, COLOR_GRAY, "/reload, /medic, /fall, /injured, /dance, /greet [player ID] [1-9]");
	CPF(playerid, COLOR_GRAY, "/fsit, /deal, /roll, /bat, /jump, /gsign [1-10], /seat");
    CPF(playerid, COLOR_GRAY, "/scratchballs, /lay, /laugh, /taichi, /crossarms, /crossarms2, /crossarms3, /crossarms4");
    CPF(playerid, COLOR_GRAY, "/cower, /vomit, /wave, /slapass, /dealerstand, /crack, /crack2, /fuckyou, /fuckyou2");
    CPF(playerid, COLOR_GRAY, "/injured, /injured2, /boxing, /masturbate, /cpr, /pointup, /fixcar, /lean, /sidelean");
    CPF(playerid, COLOR_GRAY, "/what, /follow, /bitchslap, /celebrate, /sit, /sit2, /sit3, /sit4, /officesit, /yes");
    CPF(playerid, COLOR_GRAY, "/handsup, /cry, /vapor, /stretch, /point, /aimgun, /reloadhandgun, /serveglass");
	return 1;
}

CMD:stopanim(playerid, params[])
{
	if(Dead[playerid] || Downed[playerid]) return 1;
	return ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
}

CMD:scratchballs(playerid, params[]) return ApplyAnimation(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0);
CMD:lay(playerid, params[]) return ApplyAnimation(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
CMD:laugh(playerid, params[]) return ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);
CMD:taichi(playerid, params[]) return ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0);
CMD:crossarms(playerid, params[]) return ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
CMD:crossarms2(playerid, params[]) return ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.0, 0, 1, 1, 1, -1);
CMD:crossarms3(playerid, params[]) return ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_01", 4.0, 0, 1, 1, 1, -1);
CMD:crossarms4(playerid, params[]) return ApplyAnimation(playerid, "GRAFFITI", "graffiti_Chkout", 4.0, 0, 0, 0, 0, 0);
CMD:cower(playerid, params[]) return ApplyAnimation(playerid,"ped", "cower", 4.0, 1, 0, 0, 0, 0);
CMD:vomit(playerid, params[]) return ApplyAnimation(playerid,"FOOD", "EAT_Vomit_P", 4.0, 1, 0, 0, 0, 0);
CMD:wave(playerid, params[]) return ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
CMD:slapass(playerid, params[]) return ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
CMD:dealerstand(playerid, params[]) return ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.0, 0, 0, 0, 0, 0);
CMD:crack(playerid, params[]) return ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
CMD:chat(playerid, params[]) return ApplyAnimation(playerid, "ped", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0);
CMD:fuckyou(playerid, params[]) return ApplyAnimation(playerid, "ped", "fucku", 4.0, 0, 0, 0, 0, 0);
CMD:fuckyou2(playerid, params[]) return ApplyAnimation(playerid, "RIOT", "RIOT_FUKU", 4.1, 0, 0, 0, 0, 0);
CMD:injured(playerid, params[]) return ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0);
CMD:boxing(playerid, params[]) return ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 1.800001, 1, 0, 0, 1, 600);
CMD:masturbate(playerid, params[]) return ApplyAnimation(playerid, "PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);
CMD:cpr(playerid, params[]) return ApplyAnimation(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0);
CMD:pointup(playerid, params[]) return ApplyAnimation(playerid, "ON_LOOKERS", "Pointup_loop", 4.1, 1, 0, 0, 0, 0);
CMD:fixcar(playerid, params[]) return ApplyAnimation(playerid, "CAR", "Fixn_Car_Loop", 4.1, 1, 0, 0, 0, 0);
CMD:lean(playerid, params[]) return ApplyAnimation(playerid, "GANGS", "leanIDLE", 4.1, 1, 0, 0, 0, 0);
CMD:sidelean(playerid, params[]) return ApplyAnimation(playerid, "MISC", "Plyrlean_loop", 4.1, 1, 0, 0, 0, 0);
CMD:what(playerid, params[]) return ApplyAnimation(playerid, "RIOT", "RIOT_ANGRY", 4.1, 0, 0, 0, 0, 0);
CMD:follow(playerid, params[]) return ApplyAnimation(playerid, "WUZI", "Wuzi_follow", 4.0, 0, 0, 0, 0, 0);
CMD:injured2(playerid, params[]) return ApplyAnimation(playerid, "SWAT", "gnstwall_injurd", 4.0, 1, 0, 0, 0, 0);
CMD:bitchslap(playerid, params[]) return ApplyAnimation(playerid, "MISC", "bitchslap", 4.0, 0, 0, 0, 0, 0);
CMD:celebrate(playerid, params[]) return ApplyAnimation(playerid, "benchpress", "gym_bp_celebrate", 4.0, 1, 0, 0, 0, 0);
CMD:sit(playerid, params[]) return ApplyAnimation(playerid, "PED", "SEAT_idle", 4.0, 1, 0, 0, 0, 0);
CMD:yes(playerid, params[]) return ApplyAnimation(playerid, "CLOTHES", "CLO_Buy", 4.0, 1, 0, 0, 0, 0);
CMD:officesit(playerid, params[]) return ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Type_Loop", 4.0, 1, 0, 0, 0, 0);
CMD:sit2(playerid, params[]) return ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
CMD:sit3(playerid, params[]) return ApplyAnimation(playerid, "BEACH", "ParkSit_W_loop", 4.0, 1, 0, 0, 0, 0);
CMD:sit4(playerid, params[]) return ApplyAnimation(playerid, "BEACH", "Lay_Bac_Loop", 4.0, 1, 0, 0, 0, 0);
CMD:cry(playerid, params[]) return ApplyAnimation(playerid, "GRAVEYARD", "mrnF_loop", 4.0, 1, 0, 0, 0, 0);
CMD:vapor(playerid, params[]) return ApplyAnimation(playerid, "GRAVEYARD", "mrnM_loop", 4.0, 1, 0, 0, 0, 0);
CMD:stretch(playerid, params[]) return ApplyAnimation(playerid, "PLAYIDLES", "stretch", 4.0, 0, 0, 0, 0, 0);
CMD:crack2(playerid, params[]) return ApplyAnimation(playerid, "CRACK", "crckidle2", 4.0, 1, 0, 0, 0, 0);
CMD:point(playerid, params[]) return ApplyAnimation(playerid, "PED", "gang_gunstand", 4.0, 1, 0, 0, 0, 0);
CMD:aimgun(playerid, params[]) return ApplyAnimation(playerid, "SHOP", "SHP_Gun_Aim", 4.0, 0, 1, 1, 1, -1);
CMD:reloadhandgun(playerid, params[]) return ApplyAnimation(playerid, "SILENCED", "Silence_reload", 3.0, 0, 0, 0, 0, 0);
CMD:serveglass(playerid, params[]) return ApplyAnimation(playerid, "BAR", "Barserve_bottle", 4.0, 0, 0, 0, 0, 0);
CMD:seat(playerid, params[]) return ApplyAnimation(playerid,"PED","SEAT_idle", 4.0, 1, 0, 0, 0, 0);
CMD:handsup(playerid, params[]) return SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
CMD:reload(playerid, params[]) return ApplyAnimation(playerid,"PYTHON","python_reload",4.1,0,0,0,0,0,0);
CMD:medic(playerid, params[]) return ApplyAnimation(playerid, "MEDIC", "CPR", 4.0, 1, 0 ,0 ,0 ,0);
CMD:fall(playerid, params[]) return ApplyAnimation(playerid,"PED","KO_skid_front",4.1,0,1,1,1,0);
CMD:fsit(playerid, params[]) return ApplyAnimation(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
CMD:deal(playerid, params[]) return ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
CMD:roll(playerid, params[]) return ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
CMD:bat(playerid, params[]) return ApplyAnimation(playerid,"BASEBALL","Bat_IDLE",4.0,1,1,1,1,0);
CMD:jump(playerid, params[]) return ApplyAnimation(playerid,"PED","EV_dive",4.0,0,1,1,1,0);

CMD:gsign(playerid, params[])
{
        new list;
        if(sscanf(params, "d", list))return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gsign (1-10)");
        if(list == 1)return ApplyAnimation(playerid, "GHANDS", "gsign1LH", 4.1, 0, 0, 0, 0, 0);
        else if(list == 2)return ApplyAnimation(playerid, "GHANDS", "gsign2LH", 4.1, 0, 0, 0, 0, 0);
        else if(list == 3)return ApplyAnimation(playerid, "GHANDS", "gsign3LH", 4.1, 0, 0, 0, 0, 0);
        else if(list == 4)return ApplyAnimation(playerid, "GHANDS", "gsign4LH", 4.1, 0, 0, 0, 0, 0);
        else if(list == 5)return ApplyAnimation(playerid, "GHANDS", "gsign5LH", 4.1, 0, 0, 0, 0, 0);
        else if(list == 6)return ApplyAnimation(playerid, "GHANDS", "gsign1", 4.1, 0, 0, 0, 0, 0);
        else if(list == 7)return ApplyAnimation(playerid, "GHANDS", "gsign2", 4.1, 0, 0, 0, 0, 0);
        else if(list == 8)return ApplyAnimation(playerid, "GHANDS", "gsign3", 4.1, 0, 0, 0, 0, 0);
        else if(list == 9)return ApplyAnimation(playerid, "GHANDS", "gsign4", 4.1, 0, 0, 0, 0, 0);
        else if(list == 10)return ApplyAnimation(playerid, "GHANDS", "gsign5", 4.1, 0, 0, 0, 0, 0);
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gsign (1-10)");
}

CMD:greet(playerid, params[])
{
    new playa, style;
    if(!sscanf(params, "ui", playa, style))
    {
        if(!IsPlayerConnected(playa) || !Logged[playa]) return Disconnected(playerid);
		if(playa == playerid) return true;
		if(!IsPlayerInRangeOfPlayer(playerid, playa, 2.5))
		    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

		if(style < 0 || style > 9) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /greet (playerid/partofname) (1-9)");
        ChosenStyle[playa] = style;
        Offer[playa] = playerid;
        new string[100];
        format(string, sizeof(string), "%s wants to greet you, \"/greet\" to accept.", GetName(playerid));
        SendClientMessage(playa, 0xff00deFF, string);
        format(string, sizeof(string), "A greet offer has been sent to %s.", GetName(playa));
        SendClientMessage(playerid, -1, string);
    }
    else
    {
        if(Offer[playerid] > -1)
        {
            playa = Offer[playerid];
            style = ChosenStyle[playerid];
            if(IsPlayerConnected(playa) && Logged[playa])
        	{
				if(!IsPlayerInRangeOfPlayer(playerid, playa, 1.5))
				    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

            	SetPlayerToFacePlayer(playerid, playa);
	            Offer[playerid] = -1;
	            ChosenStyle[playerid] = 0;
            	switch(style)
            	{
            	    case 1:
            	    {
                 		ApplyAnimation(playerid, "GANGS", "hndshkaa", 4.1, 0, 0, 0, 0, 0);
                		ApplyAnimation(playa, "GANGS", "hndshkaa", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 2:
            	    {
	                    ApplyAnimation(playerid, "GANGS", "hndshkaa", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "hndshkaa", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 3:
            	    {
	                    ApplyAnimation(playerid, "GANGS", "hndshkba", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "hndshkba", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 4:
            	    {
              		 	ApplyAnimation(playerid, "GANGS", "hndshkca", 4.1, 0, 0, 0, 0, 0);
                		ApplyAnimation(playa, "GANGS", "hndshkca", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 5:
            	    {
	                    ApplyAnimation(playerid, "GANGS", "hndshkda", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "hndshkda", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 6:
            	    {
	                    ApplyAnimation(playerid, "GANGS", "hndshkea", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "hndshkea", 4.1, 0, 0, 0, 0, 0);
            	    }
            	    case 7:
					{
	                    ApplyAnimation(playerid, "GANGS", "hndshkfa", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "hndshkfa", 4.1, 0, 0, 0, 0, 0);
					}
					case 8:
					{
	                    ApplyAnimation(playerid, "GANGS", "prtial_hndshk_01", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "prtial_hndshk_01", 4.1, 0, 0, 0, 0, 0);
					}
					case 9:
					{
	                    ApplyAnimation(playerid, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
					}
					default:
					{
	                    ApplyAnimation(playerid, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
	                    ApplyAnimation(playa, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
					}
            	}
      		}
            else Disconnected(playerid);
        }
        else
		{
			SendClientMessage(playerid, COLOR_GRAY, "Invalid playerID.");
            Offer[playerid] = -1;
            ChosenStyle[playerid] = 0;
        }
    }
    return 1;
}

CMD:dance(playerid, params[])
{
    if(sscanf(params,"d", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /dance (1-4)");

	if(params[0] < 1 || params[0] > 4)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /dance (1-4)");

	switch(params[0])
	{
	    case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
	    case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
	    case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
	    case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	}
	return 1;
}

CMD:say(playerid, params[])
{
    if(Dead[playerid]) return CPF(playerid, COLOR_RED, "You are not able to speak when you are dead.");
    if(sscanf(params,"s[144]", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /say (message)");

    gUser = playerid;
    gType = 1;
	format(gString, sizeof(gString), "%s says: %s", GetPlayerNameEx(playerid), params[0]);
	ProxDetector(10.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
	return 1;
}

CMD:low(playerid, params[])
{
    if(Dead[playerid]) return CPF(playerid, COLOR_RED, "You are not able to speak when you are dead.");
    if(sscanf(params,"s[144]", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /low (message)");

	gUser = playerid;
    gType = 2;
	format(gString, sizeof(gString), "%s says [low]: %s", GetPlayerNameEx(playerid), params[0]);
	ProxDetector(4.0, playerid, gString, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
	if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,1,1);
	if(!Dead[playerid] && !IsPlayerInAnyVehicle(playerid) && !Downed[playerid]) SetTimerEx("StopTalk", strlen(params[0])*30, false, "i", playerid);
	return 1;
}

CMD:gethere(playerid,params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	new targetid, Float:x, Float:y, Float:z;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gethere (playerid/partofname)");
	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
	CPF(playerid, COLOR_GRAY, "You have teleported (%d)%s.", targetid, GetPlayerNameEx(targetid));
	CPF(targetid, COLOR_GRAY, "You have been teleported.");
	GetPlayerPos(playerid, x, y, z);
	SetPos(targetid, x, y+0.5, z+0.5);
	SetPlayerInterior(targetid, GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(targetid, GetPlayerVirtualWorld(playerid));
	return 1;
}

CMD:stats(playerid, params[])
{
	new id;
	if ( sscanf( params, "u", id) )
		return Stats(playerid, playerid);
	if(pInfo[playerid][AdminLevel] > 0) return Stats(id, playerid);
	else Stats(playerid, playerid);
  	return 1;
}

CMD:gotoxyz(playerid, params[])
{
	new Float:gotoPos[3];
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "fffd", gotoPos[0], gotoPos[1], gotoPos[2], params[4])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gotoxyz (X) (Y) (Z) (Int)");
    SetPos(playerid, gotoPos[0], gotoPos[1], gotoPos[2]);
    SetPlayerInterior(playerid, params[4]);
    return 1;
}

CMD:gotofc(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	{
		SetVehiclePos(GetPlayerVehicleID(playerid),-162.7903,1082.1576,19.7422);
	}
	else
 	{
		SetPlayerPos(playerid,-162.7903,1082.1576,19.7422);
		SetPlayerInterior(playerid,0), SetPlayerVirtualWorld(playerid,0);
	}
	return 1;
}

CMD:goto(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	new targetid = strval( params );
	if( !IsPlayerConnected( targetid ) ) return Disconnected(playerid);
	new Float: Pos[ 4 ];
	new message[128];
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /goto (playerid/partofname)");
	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
	GetPlayerPos( targetid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );
	GetPlayerFacingAngle( targetid, Pos[ 3 ] );
	SetPos( playerid, Pos[ 0 ], Pos[ 1 ]+0.5, Pos[ 2 ] );
	SetPlayerFacingAngle( playerid, Pos[ 3 ] );
	SetPlayerInterior(playerid, GetPlayerInterior(targetid));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	format(message, sizeof(message), "You have teleported to (%d)%s.", targetid, GetName(targetid));
	SendClientMessage(playerid, COLOR_GRAY, message);
	return 1;
}

CMD:getinfo(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	new targetid = strval ( params );
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /getinfo (playerid/partofname)");
	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
	new IP[22], Float:Packet;
	GetPlayerIp(targetid, IP, 22);
	GetPlayerPacketloss(targetid, Packet);
	new GetInfoString[516];
	format(GetInfoString, sizeof(GetInfoString), "{33aa33}Success:"COL_WHITE" Data for (PLAYER_ID: %d) %s has been loaded.\n\nSQL ID: %d\nMaster Account: %s (SQL ID: %d)\n\nCharacter 1: %s\nCharacter 2: %s\nCharacter 3: %s\
	\n\nEmail Address: %s\nIP Address: %s\nPacket Loss: %.2f",
	targetid,
	GetName(targetid),
	cInfo[targetid][SQLID],
	cInfo[targetid][cCreator],
	pInfo[targetid][SQLID],
	pInfo[targetid][pCharacter1],
	pInfo[targetid][pCharacter2],
	pInfo[targetid][pCharacter3],
	pInfo[targetid][pEmail],
	IP,
	Packet);
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Get Info", GetInfoString, "Okay", "");
	return 1;
}

CMD:ao(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	if(sscanf(params, "s[156]", params)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /ao(admin ooc) (text)");
	gUser = playerid;
    gType = 9;
	format(gString, sizeof gString, "{089CBD}[Admin OOC] %s: %s", GetName(playerid), params);
	SendWrappedMessageToAll(-1, gString);
	return 1;
}

CMD:o(playerid, params[])
{
    if(sscanf(params, "s[156]", params)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /o(ooc) (text)");
    if(oocChat == false && pInfo[playerid][AdminLevel] <= 1)
        return SendClientMessage(playerid, COLOR_GRAY, "The OOC chat is currently disabled by an Admin.");

	gUser = playerid;
    gType = 8;
	format(gString, sizeof gString, "[OOC] %s: %s", GetName(playerid), params);
	SendWrappedMessageToAll(0xDEEEFFFF, gString);
	return 1;
}

CMD:noooc(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	oocChat = oocChat ? false : true;
	format(gString, sizeof gString, "The OOC chat has been %s by an Admin.", oocChat ? ("enabled") : ("disabled"));
	SendClientMessageToAll(COLOR_GRAY, gString);
	return 1;
}

CMD:getveh(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /getveh (vehID)");
    if(!IsValidVehicle(params[1])) return CPF(playerid, COLOR_GRAY, "Given vehicleID could not be found.");
    new Float:myyPos[3];
    GetPlayerPos(playerid, myyPos[0], myyPos[1], myyPos[2]);
    SetVehiclePos(params[1], myyPos[0], myyPos[1], myyPos[2]);
	return 1;
}

CMD:gotoveh(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gotoveh (vehID)");
    if(!IsValidVehicle(params[1])) return CPF(playerid, COLOR_GRAY, "Given vehicleID could not be found.");
    new Float:vPos[3];
    GetVehiclePos(params[1], vPos[0], vPos[1], vPos[2]);
    SetPlayerPos(playerid, vPos[0], vPos[1], vPos[2]);
    CPF(playerid, COLOR_GRAY, "You have teleported to vehicle ID %d.", params[1]);
	return 1;
}

CMD:gotohouse(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gotohouse (houseID)");
    if(hInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Given houseID could not be found.");
    SetPlayerPos(playerid, hInfo[params[1]][X_OUT], hInfo[params[1]][Y_OUT], hInfo[params[1]][Z_OUT]);
    CPF(playerid, COLOR_GRAY, "You have teleported to house ID %d.", params[1]);
	return 1;
}

CMD:gotobizz(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /gotobizz (bizzID)");
    if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Given bizzID could not be found.");
    SetPlayerPos(playerid, bInfo[params[1]][X_OUT], bInfo[params[1]][Y_OUT], bInfo[params[1]][Z_OUT]);
    CPF(playerid, COLOR_GRAY, "You have teleported to bizz ID %d.", params[1]);
	return 1;
}

CMD:mypos(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	CPF(playerid, -1, "Your pos is X[{33AA33}%02f"COL_WHITE"], Y[{33AA33}%02f"COL_WHITE"], Z[{33AA33}%02f"COL_WHITE"]", xa, ya, za);
	return 1;
}

CMD:xmin(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa-2, ya, za);
	return 1;
}

CMD:ymin(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa, ya-2, za);
	return 1;
}

CMD:zmin(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa, ya, za-2);
	return 1;
}

CMD:x(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa+2, ya, za);
	return 1;
}

CMD:y(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa, ya+2, za);
	return 1;
}

CMD:z(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	GetPlayerPos(playerid, xa, ya, za);
	SetPlayerPos(playerid, xa, ya, za+2);
	return 1;
}

CMD:jetpack( playerid, params[ ] )
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
	{
		CPF(playerid, COLOR_GRAY, "Jetpack disassembled.");
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		SetPlayerPos(playerid, x, y, z);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	else {
		CPF(playerid, COLOR_GRAY, "Jetpack assembled.");
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	}
	return 1;
}

CMD:givemoney(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
    if(sscanf(params, "dd", params[0], params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /givemoney (playerid/partofname) (value)");

    if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
    if(params[1] <= 0) return CPF(playerid, COLOR_GRAY, "Invalid amount.");
    cInfo[params[0]][cMoney] += params[1];
	format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has given [%d] %s (money) $%d.", GetPlayerNameEx(playerid), params[0], GetPlayerNameEx(params[0]), params[1]);
	SendAdminMessage(-1, gString);
	CPF(params[0], COLOR_GRAY, "Admin %s has given you $%d.", GetName(playerid), params[1]);
    return 1;
}

CMD:maskedlist(playerid, params[])
{
	CPF(playerid, 0x33AA33FF, "_______ MAKSED LIST _______");
    for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
    {
        if(!Logged[i] || !IsPlayerConnected(i)) continue;
		if(!MaskOn[i]) continue;
		CPF(playerid, COLOR_GRAY, "[%d] %s - Mask ID %d", i, GetName(i), cInfo[playerid][cMask]);
    }
	return 1;
}

CMD:mask(playerid, params[])
{
	if(HaveMask[playerid] || cInfo[playerid][cDonator] > 0 || cInfo[playerid][cFaction] == 1)
	{
		if(MaskOn[playerid])
		{
			MaskOn[playerid] = false;
			GameTextForPlayer(playerid, "~w~Mask ~r~Off", 3200, 4);
		}
		else
		{
			MaskOn[playerid] = true;
			GameTextForPlayer(playerid, "~w~Mask ~g~On", 3200, 4);
		}
	}
	else
	    CPF(playerid, COLOR_GRAY, "You don't have a mask.");
	return 1;
}

CMD:report(playerid, params[])
{
    if(sscanf(params, "s[256]", params[2]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /re(port) (message)");

	if(SentReport[playerid]) return CPF(playerid, COLOR_RED, "You are not able to send another report in such close range of time.");

	CPF(playerid, -1, ""COL_YANIR"Your report has been submitted.");
	format(gString, sizeof(gString), ""COL_RED"REPORT: [%d] %s reported: %s", playerid, GetName(playerid), params[2]);
	SendAdminMessage(COLOR_RED, gString);
	SentReport[playerid] = true;
	SetTimerEx("RemoveReport", 10*60*1000, false, "i", playerid);
    return 1;
}

CMD:changepass(playerid, params[])
{
    SendClientMessage(playerid, COLOR_WHITE, "Visit our User Control Panel (UCP) and change your password through 'Settings' - www.pr-rp.com");
    SendClientMessage(playerid, COLOR_WHITE, "You must be offline in-game while changing your password via the UCP, otherwise it's not going to save.");
    return 1;
}

CMD:forumname(playerid, params[])
{
    SendClientMessage(playerid, COLOR_WHITE, "Visit our User Control Panel (UCP) and change your forum name through 'Settings' - www.pr-rp.com");
    SendClientMessage(playerid, COLOR_WHITE, "You must be offline in-game while changing your forum name via the UCP, otherwise it's not going to save.");
    return 1;
}

CMD:resetobjects(playerid, params[])
{
    RemovePlayerAttachedObject(playerid, 9);
    return 1;
}



CMD:helpme(playerid, params[])
{
	if(SentHelpme[playerid]) return CPF(playerid, COLOR_RED, "You are not able to send another helpme in such close range of time.");
	new string[144];
	if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /helpme (message)");
	format(string, 144, ""COL_RED"HELPME: %s (ID %d): %s", GetName(playerid), playerid, params[0]);
	SendHelpMessage(COLOR_YELLOW, string);
	NeedHelp[playerid] = 1;
	format(HelpString[playerid], 128, "%s", params[0]);
	SendClientMessage(playerid, -1, ""COL_YANIR"Your help request has been submitted.");
	SentHelpme[playerid] = true;
	SetTimerEx("RemoveHelpme", 10*60*1000, false, "i", playerid);
	return 1;
}

CMD:helprequests(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 0) return NoAdmin(playerid);
	new helpc=0;
	new helpstr[1600];
	for(new i =0; i < GetMaxPlayers(); i++)
	{
		if(!IsPlayerConnected(i) || !Logged[i]) continue;
		if(!NeedHelp[i]) continue;
		format(helpstr, sizeof(helpstr), ""COL_RED"Help Request from: "COL_WHITE"%s [ID: %d]", GetPlayerNameEx(i), i);
	 	AddDListItem(playerid, helpstr, i, -1);
	 	helpc++;
	}
	if(helpc == 0) return SendClientMessage(playerid, -1, ""COL_RED"There are no help requests waiting for response.");
	ShowPlayerDList(playerid, 780, "Unclosed Requests", "View", "Close");
	return 1;
}

CMD:spec(playerid, params[])
{
    if(!IsPlayerConnected(playerid) || !Logged[playerid]) return Disconnected(playerid);
    new targetid;
    if(strcmp(pInfo[targetid][pForum], "Arrow", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Fresh", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Mr187", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(pInfo[playerid][AdminLevel] <= 1)
	        return NoAdmin(playerid);
	if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /spec (playerid)");
	if(!IsPlayerConnected(params[0]) || !Logged[params[0]]) return Disconnected(playerid);
	if(params[0] == playerid) return 1;
    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(params[0]));
    SetPlayerInterior(playerid, GetPlayerInterior(params[0]));
	TogglePlayerSpectating(playerid, 1);
	if(IsPlayerInAnyVehicle(params[0]))
	    PlayerSpectateVehicle(playerid, GetPlayerVehicleID(params[0]));

	else
		PlayerSpectatePlayer(playerid, params[0]);

	AdminSpectate[playerid] = true;
	Spec[playerid] = params[0];
	CPF(playerid, -1, ""COL_PARAM"You are now spectating %s[%d].", GetName(params[0]), params[0]);
	return 1;
}

CMD:specoff(playerid, params[])
{
    if(!IsPlayerConnected(playerid) || !Logged[playerid]) return Disconnected(playerid);
    if(pInfo[playerid][AdminLevel] <= 1)
	        return NoAdmin(playerid);
	if(!AdminSpectate[playerid]) return 1;
	TogglePlayerSpectating(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	AdminSpectate[playerid] = false;
	Spec[playerid] = -1;
	return 1;
}

CMD:givelicense(playerid, params[])
{
    new player;
    if(sscanf(params, "u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /givelicense (playerid)");
   	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    if(fInfo[cInfo[playerid][cFaction]][Type] == 1 && cInfo[playerid][cRank] == 15)
    {
		if(cInfo[player][cWeaponLicense] == 0)
		{
    	    cInfo[player][cWeaponLicense] = 1;
			CPF(player, COLOR_GRAY, "%s has given you a weapon license.", GetName(playerid));
    	}
	}
	else
	{
	    NoAdmin(playerid);
	}
	return 1;
}

CMD:takelicense(playerid, params[])
{
    new player;
    if(sscanf(params, "u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /takelicense (playerid)");
   	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    if(fInfo[cInfo[playerid][cFaction]][Type] == 1 && cInfo[playerid][cRank] == 15)
    {
		if(cInfo[player][cWeaponLicense] == 1)
		{
    	    cInfo[player][cWeaponLicense] = 0;
			CPF(player, COLOR_GRAY, "%s has taken your weapon license.", GetName(playerid));
    	}
	}
	else
	{
	    NoAdmin(playerid);
	}
	return 1;
}

CMD:fish(playerid, params[])
{
	new count = 0;
	if(cInfo[playerid][cJob] != FISHER_MAN_JOB)
	    return NoAdmin(playerid);

 	for(new i = 0,j = sizeof(FishLocation); i < j; i ++)
 	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, FishLocation[i][0], FishLocation[i][1], FishLocation[i][2]))
		    count ++;
	}

	if(count <= 0)
	    return CPF(playerid, COLOR_GRAY, "You are not at the fishing pier.");

    if(IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You can't fish while in a car.");

	if(IsFishing[playerid])
	    return CPF(playerid, COLOR_GRAY, "You will have to wait %d before fishing again.", FISH_TIME);

	if(Fishes[playerid] >= MAX_FISH)
		return CPF(playerid, COLOR_GRAY, "You have reached the maximum capacity (20 fish)");

	format(gString, sizeof(gString), "* %s throws the fishing rod into the sea.", GetPlayerNameEx(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	new rand = random(sizeof(Fish));
	switch(rand)
	{
	    case 15:
	    {
         	CPF(playerid, COLOR_GREEN, "You have caught a Boot.");
	        CPF(playerid, -1, "* You don't have to wait %d seconds.", FISH_TIME);
	    }
	    case 16:
	    {
	        new randomMoney = RandomEx(100, 200);
	        CPF(playerid, COLOR_GREEN, "You have caught a Wallet contains $%d.", randomMoney);
	        cInfo[playerid][cMoney] += randomMoney;
	        FishTimer[playerid] = SetTimerEx("Fishing", FISH_TIME * 1000, false, "i", playerid);
	        IsFishing[playerid] = true;
	    }
	    default:
	    {
	        new lbs = RandomEx(Fish[rand][FishMin], Fish[rand][FishMax]);
	        Fishes[playerid]++;
	        FishLBS[playerid] += lbs;
	        CPF(playerid, COLOR_GREEN, "You have caught a %s (%d lbs)", Fish[rand][FishName], lbs);
	        FishTimer[playerid] = SetTimerEx("Fishing", FISH_TIME * 1000, false, "i", playerid);
	        IsFishing[playerid] = true;
	    }
	}
	return 1;
}

CMD:sellfish(playerid, params[])
{
	if(cInfo[playerid][cJob] != FISHER_MAN_JOB)
    	return NoAdmin(playerid);

	if(!IsPlayerInRangeOfPoint(playerid, 5.0, SELLFISH_X, SELLFISH_Y, SELLFISH_Z))
	{
	    CPF(playerid, COLOR_GRAY, "You are not at the fish store (marked on the map)");
		SetPlayerCheckpoint(playerid, SELLFISH_X, SELLFISH_Y, SELLFISH_Z, 3.0);
		ShowCP[playerid] = true;
		return 1;
	}
	new Float:Money = FishLBS[playerid] * MONEY_PER_LBS;
	new MoneyEnd = floatround(Money, floatround_round);
	CPF(playerid, COLOR_YELLOW, "You sold your fish load (%d lbs) and an amount of $%d has been added to your paycheck.", FishLBS[playerid], MoneyEnd);
	cInfo[playerid][cPaycheck] += MoneyEnd;
	Fishes[playerid] = 0;
	IsFishing[playerid] = false;
	FishLBS[playerid] = 0;
	return 1;
}

CMD:pizza(playerid, params[])
{
    if(PizzaMission[playerid][OnMission]) return 1;
    if(PIZZA_JOB != cInfo[playerid][cJob])
        return NoAdmin(playerid);

    new helpstr[1600];
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "You're not on a pizza bike.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 448 || vInfo[GetPlayerVehicleID(playerid)][Job] != PIZZA_JOB) return SendClientMessage(playerid, -1, "You're not on a pizza bike.");
	format(helpstr, sizeof(helpstr), "\t"COL_WHITE"Welcome to the pizza delivery mission!\n"COL_GREEN"Job instructions:\n"COL_WHITE"1. Drive to the designated house marked on your GPS.\n2. Get off the bike.\n3. Take the pizza from the bike and deliver it to the door.\n4. Rinse and repeat for all 5 pizzas!\n\t\tCommands:\n/takepizza - take the pizza from the bike.\n/storepizza - put the pizza back in the bike.\n/stoppizza - cancel the delivery.\n/pizzacp - to refresh checkpoint.");
	ShowPlayerDialog(playerid, DIALOG_PIZZA, DIALOG_STYLE_MSGBOX,"Pizza Delivery", helpstr, "Start", "Cancel");
	return 1;
}

CMD:stoppizza(playerid, params[])
{
	if(PizzaMission[playerid][OnMission])
	{
	    SendClientMessage(playerid, -1, ""COL_RED"You forfeit the pizza delivery mission.");
	    DisablePlayerCheckpoint(playerid);
		PizzaMission[playerid][PizzaSeconds] = 0;
		if(PizzaMission[playerid][CarryingPizza])
		{
			PizzaMission[playerid][CarryingPizza] = false;
  			RemovePlayerAttachedObject(playerid, 9);
  			SetPlayerSpecialAction(playerid, 0);
  		}
		PizzaMission[playerid][PizzaWarmth] = 100;
		PizzaMission[playerid][OnMission] = false;
		PizzaMission[playerid][TotalSeconds] = 0;
		PizzaMission[playerid][MissionBike] = -1;
		PizzaMission[playerid][SessionEarning] = 0;
		KillTimer(PizzaMission[playerid][PizzaTimer]);
		PlayerTextDrawHide(playerid, PizzaDraw);
	}
	return 1;
}

CMD:takepizza(playerid, params[])
{
    if(!PizzaMission[playerid][OnMission]) return 1;
	CarryPizza(playerid, 1);
	return 1;
}

CMD:pizzacp(playerid, params[])
{
    if(!PizzaMission[playerid][OnMission]) return 1;
	SetPlayerCheckpoint(playerid, PizzaMission[playerid][CPPOS][0], PizzaMission[playerid][CPPOS][1], PizzaMission[playerid][CPPOS][2], 2.0);
	GameTextForPlayer(playerid, "~g~cp refreshed", 1000, 4);
	return 1;
}

CMD:storepizza(playerid, params[])
{
    if(!PizzaMission[playerid][OnMission]) return 1;
	CarryPizza(playerid, 0);
	return 1;
}

CMD:showbadge(playerid, params[])
{
	new targetid,string[128],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME];
	if(!OnDuty[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You cannot use this command while being off duty.");

	if(sscanf(params,"u", targetid))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /showbadge [Player ID]");

  	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);

   	if(fInfo[cInfo[playerid][cFaction]][Type] == 1 || fInfo[cInfo[playerid][cFaction]][Type] == 2)
	{
 		if(IsPlayerInRangeOfPlayer(playerid,targetid,3.0))
   		{
	    	format(giveplayer, sizeof(giveplayer), "%s", GetPlayerNameEx(targetid));
      		format(string, sizeof(string), "You have shown your badge to %s.", giveplayer);
        	SendClientMessage(playerid, COLOR_WHITE, string);
         	format(sendername, sizeof(sendername), "NAME: %s", GetPlayerNameEx(playerid));
   	     	switch(fInfo[cInfo[playerid][cFaction]][Type])
    		{
				case 1:
				{
					format(gString, sizeof gString, "LOS SANTOS POLICE DEPARTMENT - RANK: %s", GetPlayerRank(playerid));
					SendClientMessage(targetid, COLOR_WHITE, string);
  				}

		    	case 2:
			    {
		    		format(gString, sizeof gString, "LOS SANTOS FIRE DEPARTMENT - RANK: %s", GetPlayerRank(playerid));
		    		SendClientMessage(targetid, COLOR_WHITE, string);
			    }
			}
   			SendClientMessage(targetid, COLOR_WHITE, string);

 	    }
	}
	return 1;
}

CMD:isafk(playerid, params[])
{
    if(sscanf(params, "u", params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /isafk (playerid/partofname)");

	if(!IsPlayerConnected(params[1]) || !Logged[params[1]]) return Disconnected(playerid);
	if(AFKCount[params[1]] <= 6) CPF(playerid, COLOR_RED, "%s (ID %d) is not tabbed out of the game.", GetName(params[1]), params[1]);
	else CPF(playerid, COLOR_RED, "%s (ID %d) has been tabbed out of the game for %d seconds.", GetName(params[1]), params[1], AFKCount[params[1]]);
	return 1;
}

CMD:takereport(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	if(!AdminDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on Admin duty.");
    if(sscanf(params, "u", params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /takereport (playerid/partofname)");

	if(!IsPlayerConnected(params[1]) || !Logged[params[1]]) return Disconnected(playerid);
	if(!SentReport[params[1]]) return CPF(playerid, COLOR_GRAY, "Given playerid did not send a report.");
	format(gString, sizeof(gString), ""COL_ORANGE"Admin %s has taken [%d] %s report.", GetName(playerid), params[1], GetName(params[1]));
	SendAdminMessage(-1, gString);
	CPF(params[1], COLOR_YELLOW, "Admin %s has taken your report and will contact you soon.", GetName(playerid));
	SentReport[params[1]] = false;
    return 1;
}

CMD:mchat(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
    if(sscanf(params, "s[158]", params))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /m(chat) (message)");

	format(gString, sizeof(gString), "Moderator %s: %s", pInfo[playerid][pForum], params);
	SendHelpMessage(COLOR_YELLOW, gString);
    return 1;
}

CMD:a(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
    if(sscanf(params, "s[158]", params))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /a (message)");

	new admin_rank[32];
	switch(pInfo[playerid][AdminLevel])
	{
	    case 1: admin_rank = "Unknown Rank";
	    case 2: admin_rank = "Administrator";
	    case 3: admin_rank = "Level 2 Administrator";
	    case 4: admin_rank = "Level 3 Administrator";
	    case 5: admin_rank = "Lead Administrator";
	    case 6: admin_rank = "Management";
	    default: admin_rank = "Unknown Rank";
	}
	format(gString, sizeof(gString), "%s %s: %s", admin_rank, pInfo[playerid][pForum], params);
	SendAdminMessage(COLOR_YELLOW, gString);
    return 1;
}

CMD:restart(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 6) return NoAdmin(playerid);
	{
	    new string[128];
		SendClientMessageToAll(COLOR_RED,"Server is restarting in a few seconds. Please re-connect to the server.");
        format(string, sizeof(string),"~r~SAVING DATA...");
	    GameTextForAll(string, 6000, 5);
		new time[3], date[3], lastseen[64];
		getdate(date[2], date[1], date[0]);
		gettime(time[0], time[1], time[2]);
		format(_query, sizeof(_query), "INSERT INTO `restartlogs`(`By`, `Date`, `Type`) VALUES ('%d', '%s', '1', '%d')", cInfo[playerid][SQLID], lastseen, params[2]);
		mysql_query(_query);
		SetTimer("KickAllPlayers", 5000, true);
	}
	return 1;
}

CMD:set(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set (option)");
		if(pInfo[playerid][AdminLevel] >= 1) CPF(playerid, -1, "> "COL_GREY"Moderator:"COL_WHITE" gender, skin, vw, int, age");
 		if(pInfo[playerid][AdminLevel] >= 2) CPF(playerid, -1, "> "COL_GREY"Administrator:"COL_WHITE" hp, armour");
 		if(pInfo[playerid][AdminLevel] >= 3) CPF(playerid, -1, "> "COL_GREY"Level 2 Administrator:"COL_WHITE" gascan, radio, job");
 		if(pInfo[playerid][AdminLevel] >= 4) CPF(playerid, -1, "> "COL_GREY"Level 3 Administrator:"COL_WHITE" radio, gascan");
 		if(pInfo[playerid][AdminLevel] >= 5) CPF(playerid, -1, "> "COL_GREY"Lead Administrator:"COL_WHITE" level, exp, hours, wlicense, dlicense, leader, faction, rank");
 		if(pInfo[playerid][AdminLevel] >= 6) CPF(playerid, -1, "> "COL_GREY"Management:"COL_WHITE" admin, money, namechanges, numberchanges, donator, oocgroup");
 		return 1;
    }
	if(!strcmp(params, "gender", true, 6))
	{
	    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
	    new gender[22], player;
	    if(sscanf(params, "s[64]us[22]", params, player, gender)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set gender (playerid) (male/female)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(strcmp(gender, "male", true) && strcmp(gender, "female", true)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set gender (playerid) (male/female)");
		if(strcmp(gender, "male", false) == 0)
		    cInfo[player][cGender] = 1;

		else if(strcmp(gender, "female", false) == 0)
		    cInfo[player][cGender] = 2;

		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s gender to %s.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), gender);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your gender to %s.", GetName(playerid), gender);
	}
	/*else if(!strcmp(params, "item", true, 4))
	{
	    if(pInfo[playerid][AdminLevel] <= 4) return 1;
	    new setitem, setamount, player;
	    if(sscanf(params, "s[64]udd", params, player, setitem, setamount)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set item (item) (amount)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
        AddBagItem(player, setitem, setamount);
	}*/
	else if(!strcmp(params, "age", true, 3))
	{
	    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
	    new setage, player;
	    if(sscanf(params, "s[64]ud", params, player, setage)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set age (playerid) (1-99)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setage > 99 || setage < 1) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set age (playerid) (1-99)");
		cInfo[player][cAge] = setage;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s age to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setage);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your age to %d.", GetName(playerid), setage);
	}
	else if(!strcmp(params, "hp", true, 2))
	{
	    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	    new sethp, player;
	    if(sscanf(params, "s[64]ud", params, player, sethp)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set hp (playerid) (0-99)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(sethp >= 100 || sethp < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set hp (playerid) (0-99)");
		SetPlayerHealth(player, sethp);
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s health to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), sethp);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your health to %d.", GetName(playerid), sethp);
	}
	else if(!strcmp(params, "armour", true, 6))
	{
	    if(pInfo[playerid][AdminLevel] <= 1) return 1;
	    new setarmour, player;
	    if(sscanf(params, "s[64]ui", params, player, setarmour)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set armour (playerid) (0-99)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setarmour >= 100 || setarmour < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set armour (playerid) (0-99)");
		SetPlayerArmour(player, setarmour);
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s armour to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setarmour);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your armour to %d.", GetName(playerid), setarmour);
	}
	else if(!strcmp(params, "skin", true, 4))
	{
	    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
	    new setskin, player;
	    if(sscanf(params, "s[64]ui", params, player, setskin)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set skin (playerid) (0-299)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setskin > 299 || setskin < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set (playerid) setskin (0-299)");
		SetPlayerSkin(player, setskin);
		cInfo[player][cSkin] = setskin;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s skin to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setskin);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your skin to %d.", GetName(playerid), setskin);
	}
	else if(!strcmp(params, "level", true, 4))
	{
     	if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	    new setskin, player;
	    if(sscanf(params, "s[64]ui", params, player, setskin)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set level (playerid) (lvl)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setskin < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set (playerid) level (0-UNLIMITED)");
		cInfo[player][cLevel] = setskin;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s level to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setskin);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your level to %d.", GetName(playerid), setskin);
	}
	else if(!strcmp(params, "hours", true, 4))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	    new setskin, player;
	    if(sscanf(params, "s[64]ui", params, player, setskin)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set hours (playerid) (lvl)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setskin < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set (playerid) hours (0-UNLIMITED)");
		cInfo[player][cLevel] = setskin;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s hours to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setskin);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your hours to %d.", GetName(playerid), setskin);
	}
	else if(!strcmp(params, "exp", true, 4))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	    new setskin, player;
	    if(sscanf(params, "s[64]ui", params, player, setskin)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set exp (playerid) (lvl)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		if(setskin < 0) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set (playerid) exp (0-UNLIMITED)");
		cInfo[player][cEXP] = setskin;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s exp to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setskin);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your exp to %d.", GetName(playerid), setskin);
	}
	else if(!strcmp(params, "vw", true, 2))
	{
	    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
	    new setvw, player;
	    if(sscanf(params, "s[64]ui", params, player, setvw)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set vw (playerid) (virtualworld)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		SetPlayerVirtualWorld(player, setvw);
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s virtual world to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setvw);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your virtual world to %d.", GetName(playerid), setvw);
	}
	else if(!strcmp(params, "job", true, 3))
	{
	    if(pInfo[playerid][AdminLevel] < 3) return NoAdmin(playerid);
	    new setjob, player;
	    if(sscanf(params, "s[64]ui", params, player, setjob)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set job (playerid) (jobID)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		cInfo[player][cJob] = setjob;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s job to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setjob);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your job to %d.", GetName(playerid), setjob);
	}
	else if(!strcmp(params, "int", true, 3))
	{
	    if(pInfo[playerid][AdminLevel] < 1) return NoAdmin(playerid);
	    new setint, player;
	    if(sscanf(params, "s[64]ui", params, player, setint)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set interior (playerid) (interiorid)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		SetPlayerInterior(player, setint);
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s interior to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setint);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your interior to %d.", GetName(playerid), setint);
	}
	else if(!strcmp(params, "admin", true, 5))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return NoAdmin(playerid);
	    new setadmin, player;
	    if(sscanf(params, "s[64]ui", params, player, setadmin)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set admin (playerid) (adminlevel)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		pInfo[player][AdminLevel] = setadmin;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s admin level to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setadmin);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your admin level to %d.", GetName(playerid), setadmin);
	}
	else if(!strcmp(params, "money", true, 5))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return 1;
	    new setmoney, player;
	    if(sscanf(params, "s[64]ui", params, player, setmoney)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set money (playerid) (value)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
		cInfo[player][cMoney] = setmoney;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s money to $%d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setmoney);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your money to %d.", GetName(playerid), setmoney);
	}
	else if(!strcmp(params, "leader", true, 5))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return 1;
	    new setleader, player;
	    if(sscanf(params, "s[64]ui", params, player, setleader)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set leader (playerid) (factionID)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(!FactionExists(setleader) && setleader != 0) return CPF(playerid, COLOR_GRAY, "Given factionID does not exist.");

		cInfo[player][cLeader] = setleader;
		if(cInfo[player][cFaction] != setleader && setleader != 0)
		{
	        fInfo[cInfo[player][cFaction]][TotalMembers] -= 1;
	        fInfo[cInfo[player][cFaction]][OnlineMembers] -= 1;
	        cInfo[player][cFaction] = setleader;
	        fInfo[cInfo[player][cFaction]][TotalMembers] += 1;
	        fInfo[cInfo[player][cFaction]][OnlineMembers] += 1;
		}
		else cInfo[player][cFaction] = setleader;
		if(setleader > 0) {
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s leader to faction %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setleader);
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "Admin %s has set your leader to (%d) %s.", GetName(playerid), setleader, fInfo[cInfo[player][cFaction]][Name]);
		}
		else {
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has removed [%d] %s leader.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has removed your leader.", GetName(playerid));
		}
	}
	else if(!strcmp(params, "rank", true, 4))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return 1;
	    new setrank, player;
	    if(sscanf(params, "s[64]ui", params, player, setrank)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set rank (playerid) (1-15)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(setrank > 15 || setrank < 1) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set rank (playerid) (1-15)");
		cInfo[player][cRank] = setrank;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s rank to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setrank);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your rank to %d.", GetName(playerid), setrank);
	}
	else if(!strcmp(params, "faction", true, 7))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return 1;
	    new setfaction, player;
	    if(sscanf(params, "s[64]ui", params, player, setfaction)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set faction (playerid) (factionID)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(!FactionExists(setfaction) && setfaction != 0) return CPF(playerid, COLOR_GRAY, "Given factionID does not exist.");
		fInfo[cInfo[player][cFaction]][TotalMembers] -= 1;
		fInfo[cInfo[player][cFaction]][OnlineMembers] -= 1;
		cInfo[player][cFaction] = setfaction;
        fInfo[cInfo[player][cFaction]][TotalMembers] += 1;
        fInfo[cInfo[player][cFaction]][OnlineMembers] += 1;
        if(setfaction > 0) {
			CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" You have set (%d) %s' faction to %d.", player, GetName(player), setfaction);
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s faction to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setfaction);
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has set your faction to %d.", GetName(playerid), setfaction);
		}
		else {
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has removed [%d] %s faction.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has removed you from your faction.", GetName(playerid));
		}
	}
	else if(!strcmp(params, "oocgroup", true, 5))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return 1;
	    new setgroup, player;
	    if(sscanf(params, "s[64]ui", params, player, setgroup)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set oocgroup (playerid) (groupID)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(!GroupExists(setgroup)) return CPF(playerid, COLOR_GRAY, "Given groupID does not exist.");
		cInfo[player][cOOCGroup] = setgroup;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s ooc-group to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setgroup);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your group to %d.", GetName(playerid), setgroup);
		return 1;
	}
	else if(!strcmp(params, "radio", true, 2))
	{
	    if(pInfo[playerid][AdminLevel] < 4) return 1;
	    new player;
	    if(sscanf(params, "s[64]u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set radio (playerid)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(cInfo[player][cHaveRadio] == 0) {
    	    cInfo[player][cHaveRadio] = true;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has given [%d] %s a radio device.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has given you a radio device.", GetName(playerid));
    	}
    	else {
    	    cInfo[player][cHaveRadio] = false;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has taken [%d] %s his radio device.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has taken your radio device.", GetName(playerid));
    	}
	}
	else if(!strcmp(params, "gascan", true, 2))
	{
	    if(pInfo[playerid][AdminLevel] < 4) return 1;
	    new player;
	    if(sscanf(params, "s[64]u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set gascan (playerid)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(cInfo[player][cHaveRadio] == 0) {
    	    cInfo[player][cHaveRadio] = true;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has given [%d] %s a gas can.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has given you a radio device.", GetName(playerid));
    	}
    	else {
    	    cInfo[player][cHaveRadio] = false;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has taken [%d] %s his radio device.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has taken your radio device.", GetName(playerid));
    	}
	}
	else if(!strcmp(params, "numberchanges", true, 13))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return 1;
	    new player, setchanges;
	    if(sscanf(params, "s[64]ud", params, player, setchanges)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set numberchanges (playerid) (amount)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	cInfo[player][cNumberchanges] = setchanges;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s number changes to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setchanges);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your number changes to %d.", GetName(playerid), setchanges);
	}
	else if(!strcmp(params, "namechanges", true, 11))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return 1;
	    new player, setchanges;
	    if(sscanf(params, "s[64]ud", params, player, setchanges)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set namechanges (playerid) (amount)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	cInfo[player][cNamechanges] = setchanges;
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s name changes to %d.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), setchanges);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your name changes to %d.", GetName(playerid), setchanges);
	}
	else if(!strcmp(params, "donator", true, 7))
	{
	    if(pInfo[playerid][AdminLevel] < 6) return 1;
	    new player, setchanges;
	    if(sscanf(params, "s[64]ud", params, player, setchanges)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set donator (playerid) (0-3)");
	    if(setchanges < 0 || setchanges > 3) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set donator (playerid) (0-3)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	cInfo[player][cDonator] = setchanges;
		new donorname[22];
		switch(cInfo[player][cDonator])
		{
		    case 1: donorname = "Bronze Donator";
		    case 2: donorname = "Silver Donator";
		    case 3: donorname = "Gold Donator";
		    default: donorname = "Regular Member";
		}
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has set [%d] %s donator status to %s.", GetPlayerNameEx(playerid), player, GetPlayerNameEx(player), donorname);
		SendAdminMessage(-1, gString);
		CPF(player, COLOR_GRAY, "%s has set your donator status to %s.", GetName(playerid), donorname);
	}
	else if(!strcmp(params, "wlicense", true, 3))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return 1;
	    new player;
	    if(sscanf(params, "s[64]u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set wlicense (playerid)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(cInfo[player][cWeaponLicense] == 0) {
    	    cInfo[player][cWeaponLicense] = 1;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has given %s (ID %d) a weapon license.", GetPlayerNameEx(playerid), GetPlayerNameEx(player), player);
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has given you a weapon license.", GetName(playerid));
    	}
    	else {
    	    cInfo[player][cWeaponLicense] = 0;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has taken %s's weapon license.", GetPlayerNameEx(playerid), GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has taken your weapon license..", GetName(playerid));
    	}
	}
	else if(!strcmp(params, "dlicense", true, 3))
	{
	    if(pInfo[playerid][AdminLevel] < 5) return 1;
	    new player;
	    if(sscanf(params, "s[64]u", params, player)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /set dlicense (playerid)");
    	if(!IsPlayerConnected(player)) return Disconnected(playerid);
    	if(cInfo[player][cDrivingLicense] == 0) {
    	    cInfo[player][cDrivingLicense] = 1;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has given %s (ID %d) a driving license.", GetPlayerNameEx(playerid), GetPlayerNameEx(player), player);
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has given you a driving license.", GetName(playerid));
    	}
    	else {
    	    cInfo[player][cDrivingLicense] = 0;
			format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has taken %s's driving license.", GetPlayerNameEx(playerid), GetPlayerNameEx(player));
			SendAdminMessage(-1, gString);
			CPF(player, COLOR_GRAY, "%s has taken your driving license..", GetName(playerid));
    	}
	}
	else CPF(playerid, COLOR_GRAY, "Invalid parameter.");
	return 1;
}

CMD:accept(playerid, params[])
{
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /accept (option)");
 		CPF(playerid, -1, "faction | group | job | death");
 		return 1;
    }
	if(!strcmp(params, "group", true, 5))
	{
	    if(GroupInvite[playerid] == 0) return CPF(playerid, COLOR_GRAY, "You don't have any pending group offers.");
		if(cInfo[playerid][cOOCGroup] >= 1) return CPF(playerid, COLOR_GRAY, "You are already in a group."), GroupInvite[playerid] = 0;

		cInfo[playerid][cOOCGroup] = GroupInvite[playerid];
		format(gString, sizeof gString, ""COL_RED"%s has joined the group.", GetPlayerNameEx(playerid));
		SendGroupMessage(cInfo[playerid][cOOCGroup], -1, gString);
		GroupInvite[playerid] = 0;
	}
	else if(!strcmp(params, "faction", true, 7))
	{
	    if(FactionInvite[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You don't have any pending faction offers.");
		if(cInfo[playerid][cFaction] >= 1) return CPF(playerid, COLOR_GRAY, "You are already in a faction."), FactionInvite[playerid] = 0;

		cInfo[playerid][cFaction] = FactionInvite[playerid];
		cInfo[playerid][cRank] = fInfo[cInfo[playerid][cFaction]][JoinRank];
		format(gString, sizeof gString, "%s has joined the faction.", GetPlayerNameEx(playerid));
		SendFMessage(cInfo[playerid][cFaction], 0x4be400FF, gString);
		FactionInvite[playerid] = 0;
        fInfo[cInfo[playerid][cFaction]][TotalMembers] += 1;
        fInfo[cInfo[playerid][cFaction]][OnlineMembers] += 1;
	}
	else if(!strcmp(params, "death", true, 5))
	{
	    if(Dead[playerid] == false)
	        return CPF(playerid, COLOR_GRAY, "You are not on deathmod.");

		cInfo[playerid][cMoney] -= 1500;
		CPF(playerid, COLOR_RED, "You were charged $1500 in medical bills.");
		SetPlayerPos(playerid, 1183.7876,-1323.9093,13.5761);
		SetPlayerFacingAngle(playerid, 273.0283);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		Dead[playerid] = false;
		DeathPos[playerid][0] = 0.0;
		DeathPos[playerid][1] = 0.0;
		DeathPos[playerid][2] = 0.0;
		deathInt[playerid] = 0;
		deathVW[playerid] = 0;
		Downed[playerid] = false;
		TogglePlayerControllable(playerid, true);
		ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	}
	else CPF(playerid, COLOR_GRAY, "Invalid parameter.");
	return 1;
}

CMD:jobs(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 2.5, 1470.3402,-1807.0114,5476.7861))
	    return CPF(playerid, COLOR_GRAY, "You are not at the City Hall.");

	if(cInfo[playerid][cJob] > 0)
		return CPF(playerid, COLOR_GRAY, "You already have a job! /leavejob first before joining another one.");

	ShowPlayerDialog(playerid, DIALOG_JOBS, DIALOG_STYLE_LIST, "City Hall Job Centre", "Delivery Man\nPizza Boy\nGarbage Man\nFisherman\nTaxi Driver", "Select", "Cancel");
	return 1;
}

CMD:leavejob(playerid, params[])
{
	if(cInfo[playerid][cJob] <= 0) return CPF(playerid, COLOR_GRAY, "You don't have a job.");
	if(cInfo[playerid][cJobHours] < 2) return CPF(playerid, COLOR_GRAY, "You do not fulfill 2 hours in the career.");
	CPF(playerid, -1, "You have left your job.");
	cInfo[playerid][cJob] = 0;
	cInfo[playerid][cJobHours] = 0;
	return 1;
}

CMD:leavefaction(playerid, params[])
{
	if(cInfo[playerid][cFaction] <= 0) return CPF(playerid, COLOR_GRAY, "You are not in a family.");
	CPF(playerid, -1, "You have left your faction.");
    fInfo[cInfo[playerid][cFaction]][TotalMembers] -= 1;
    fInfo[cInfo[playerid][cFaction]][OnlineMembers] -= 1;
	format(gString, sizeof(gString), "(( %s has left the faction ))", GetName(playerid));
	switch(fInfo[cInfo[playerid][cFaction]][Type])
	{
	    case 1: SendFMessage(cInfo[playerid][cFaction], 0x8D8DFF00, gString);
	    case 2: SendFMessage(cInfo[playerid][cFaction], 0xFF8282AA, gString);
	    default: SendFMessage(cInfo[playerid][cFaction], 0x7BDDA5AA, gString);
	}
	cInfo[playerid][cRank] = 0;
	cInfo[playerid][cLeader] = 0;
	cInfo[playerid][cFaction] = 0;
	return 1;
}

CMD:checkajail(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
 	if(sscanf(params,"u", params[0]))
	 	return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /checkajail (playerid/partofname)");

	if(!Logged[params[0]] || !IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(cInfo[params[0]][cJailed] <= 0)
	    return CPF(playerid, COLOR_GRAY, "Given playerid/partofname is not ajailed.");

	CPF(playerid, COLOR_GRAY, "[AJAIL] %s is ajailed for %d minutes, Reason: [%s]", GetName(params[0]), cInfo[playerid][cJailTime], cInfo[playerid][cJailReason]);
	return 1;
}

CMD:leavegroup(playerid, params[])
{
	if(cInfo[playerid][cOOCGroup] <= 0) return CPF(playerid, COLOR_GRAY, "You are not in a group.");
	new confirmMsg[32], fFile[32];
 	if(sscanf(params,"s[32]", confirmMsg)) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /leavegroup (confirm)");

	if(!strcmp(confirmMsg, "confirm" ,true))
	{
	    if(cInfo[playerid][cOLeader] != 0)
		{
		    format(gString, sizeof gString, ""COL_RED"The group has been closed since the leader has left.", GetPlayerNameEx(playerid));
		    SendGroupMessage(cInfo[playerid][cOOCGroup], -1, gString);
			format(fFile, sizeof fFile, "OOCGroups/%d.ini", cInfo[playerid][cOOCGroup]);
			if(GroupExists(cInfo[playerid][cOOCGroup]))
			{
			    format(_query, sizeof(_query), "DELETE FROM `oocgroups` WHERE `ID` ='%d'", cInfo[playerid][cOOCGroup]);
			    mysql_query(_query);
			 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
				{
				    if(!IsPlayerConnected(i)) continue;
					if(cInfo[i][cOOCGroup] != cInfo[playerid][cOOCGroup]) continue;
					if(i == playerid) continue;
					cInfo[i][cOOCGroup] = 0;
					cInfo[i][cOLeader] = 0;
					CPF(i, -1, "You have been uninvited from your group (Deleted)");
				}
				cInfo[playerid][cOOCGroup] = 0;
				cInfo[playerid][cOLeader] = 0;
				CPF(playerid, COLOR_GRAY, "You have left your group.");
			}
	    }
	    else {
		    format(gString, sizeof gString, ""COL_RED"GROUP: %s has left the group.", GetPlayerNameEx(playerid));
		    SendGroupMessage(cInfo[playerid][cOOCGroup], -1, gString);
			cInfo[playerid][cOOCGroup] = 0;
			cInfo[playerid][cOLeader] = 0;
			CPF(playerid, COLOR_GRAY, "You have left your group.");
		}
	}
	else return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /leavegroup (confirm)");
	return 1;
}

CMD:acmds(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] >= 2)
    {
		CPF(playerid, COLOR_FADE2, "Administrator: /aduty, /set");
		CPF(playerid, COLOR_FADE2, "Administrator: /ajail, /kick, /ban, /goto, /gotoxyz, /gethere, /ao, /o");
		CPF(playerid, COLOR_FADE2, "Administrator: /stats(playerid), /getinfo, /gotohouse, /gotoveh, /noooc");
		CPF(playerid, COLOR_FADE2, "Administrator: /gotobizz, /mypos, /x, /y, /z, /xmin, /ymin, /zmin, /gotofc");
		CPF(playerid, COLOR_FADE2, "Administrator: /takereport, /spec, /specoff, /repairveh, /flipcar, /respawncar");
		CPF(playerid, COLOR_FADE2, "Administrator: /respawncars, /getveh, /getbizzid, /gethouseid");
    }
    if(pInfo[playerid][AdminLevel] >= 5)
 	{
 	    CPF(playerid, COLOR_FADE2, "Lead Administrator: /fillcars, /fillcar, /acolors, /apark, /veh, /destroyveh, /destroyall");
 	    CPF(playerid, COLOR_FADE2, "Lead Administrator: /settime, /setweather, /despawn");
    }
    if(pInfo[playerid][AdminLevel] >= 6)
	{
		CPF(playerid, COLOR_FADE2, "Management: /givemoney, /create_faction, /create_house, /create_bizz, /create_int");
		CPF(playerid, COLOR_FADE2, "Management: /delete_house, /delete_bizz, /edit_house, /edit_bizz, /cvo, /createveh, /newreward");
	}
	return 1;
}

// ------------- [ TAXI COMMANDS ] ------------- //

CMD:taxiduty(playerid, params[])
{
	if(cInfo[playerid][cJob] != TAXI_DRIVER_JOB) return NoAdmin(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 420)
	{
	    new vid = GetPlayerVehicleID(playerid);
	    if(vInfo[vid][Job] > 0 && vInfo[vid][Job] != TAXI_DRIVER_JOB) return CPF(playerid, COLOR_GRAY, "You do not have permissions for this vehicle.");
	    else if(vInfo[vid][Job] <= 0 && vInfo[vid][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_GRAY, "You do not have permissions for this vehicle.");
		if(TaxiDuty[playerid])
		{
		    TaxiDuty[playerid] = false;
		    format(gString, sizeof(gString), ""COL_YELLOW"* Taxi Driver %s is now off duty.", GetPlayerNameEx(playerid));
		    SendTaxiMessage(-1, gString);
		}
		else
		{
		    TaxiDuty[playerid] = true;
		    format(gString, sizeof(gString), ""COL_YELLOW"* Taxi Driver %s is now on duty.", GetPlayerNameEx(playerid));
		    SendTaxiMessage(-1, gString);
		}
	}
	else CPF(playerid, COLOR_GRAY, "You are not driving a Taxi.");
	return 1;
}

CMD:taxi_calls(playerid, params[])
{
	if(cInfo[playerid][cJob] != TAXI_DRIVER_JOB) return NoAdmin(playerid);
	if(!TaxiDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on taxi driver duty.");
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

CMD:setfare(playerid, params[])
{
	if(cInfo[playerid][cJob] != TAXI_DRIVER_JOB) return NoAdmin(playerid);
	if(!TaxiDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on taxi driver duty.");
 	if(sscanf(params,"d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setfare price ($1-$10 per second)");
 	if(params[1] > 10 || params[1] < 1)
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setfare price ($1-$10 per second)");

	TaxiFare[playerid] = params[1];
	CPF(playerid, -1, "* You have successfully set your fare price to $%d. Roam around the city and work.", params[1]);
	return 1;
}

CMD:startfare(playerid, params[])
{
	if(cInfo[playerid][cJob] != TAXI_DRIVER_JOB) return NoAdmin(playerid);
	if(!TaxiDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on taxi driver duty.");
	if(TaxiFare[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You didn't set your fare (/setfare)");
 	if(sscanf(params,"d", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /startfare (target id)");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 420)
	{
	    new vid = GetPlayerVehicleID(playerid);
	    if(vInfo[vid][Job] > 0 && vInfo[vid][Job] != TAXI_DRIVER_JOB) return CPF(playerid, COLOR_GRAY, "You do not have permissions for this vehicle.");
	    else if(vInfo[vid][Job] <= 0 && vInfo[vid][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_GRAY, "You do not have permissions for this vehicle.");
		if(!IsTaxiAvailable(vid)) return CPF(playerid, COLOR_GRAY, "There are no passengers in the taxi.");
		if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
		if(params[1] == playerid) return true;
		if(!IsPlayerInRangeOfPlayer(playerid, params[1], 2.5))
		    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	    TaxiTarget[playerid] = params[1];
	    GameTextForPlayer(playerid, "~w~Starting Fare", 1000, 4);
	    TaxiTimer[playerid] = SetTimerEx("TaxiCheck", 1000, true, "i", playerid);
	    CPF(params[1], -1, "* Taxi Driver %s has set the fare to $%d.", GetPlayerNameEx(playerid), TaxiFare[playerid]);
	}
	else CPF(playerid, COLOR_GRAY, "You are not driving a Taxi.");
	return 1;
}

CMD:gate(playerid, params[])
{
	if(cInfo[playerid][cFaction] == 1)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 12.0, 1588.8877,-1636.8511,13.4266))
	    {
	        if(!pGate)
	        {
	            MoveDynamicObject(pdgate, 1592.8000500,-1638.3000500, 14.9000000, 3.0, 0.0000000,0.0000000,90.0000000);
	            pGate = true;
				format(gString, sizeof(gString), "* %s uses %s remote controller to open the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	    	}
			else
	        {
	            MoveDynamicObject(pdgate, 1592.8000500,-1638.3000500,9, 3.0, 0.0000000,0.0000000,90.0000000);
	            pGate = false;
				format(gString, sizeof(gString), "* %s uses %s remote controller to close the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	        }
	    }
	    else if(IsPlayerInRangeOfPoint(playerid, 12.0, 1541.8368,-1627.7568,13.3828))
	    {
	        if(!pBarrier)
	        {
	            MoveDynamicObject(pdbarrier, 1544.6999511719,-1631,13.199999809265, 2.0, 0, 350, 270);
	            pBarrier = true;
				format(gString, sizeof(gString), "* %s uses %s remote controller to open the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	        }
			else
	        {
	            MoveDynamicObject(pdbarrier, 1544.6999511719,-1631,13.199999809265, 2.0, 0, 270, 270);
	            pBarrier = false;
				format(gString, sizeof(gString), "* %s uses %s remote controller to close the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	        }
	    }

    }
    else if(cInfo[playerid][cFaction] == 2)
    {
	    if(IsPlayerInRangeOfPoint(playerid, 15.0, 1141.3716,-1289.8912,13.5778))
	    {
	        if(!eGate)
	        {
	            MoveDynamicObject(emsgate, 1144.6999500,-1291.8000500,13.5000000, 2.0, 0.0000000,350.0000000,0.0000000);
	            eGate = true;
				format(gString, sizeof(gString), "* %s uses %s remote controller to open the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	        }
			else
	        {
	            MoveDynamicObject(emsgate, 1144.6999500,-1291.8000500,13.5000000, 2.0, 0.0000000,269.0000000,0.0000000);
	            eGate = false;
				format(gString, sizeof(gString), "* %s uses %s remote controller to close the gate.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
				ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	        }
	    }
    }
	return 1;
}

CMD:safe(playerid, params[])
{
    if(InHouse[playerid] > 0)
	{

		new Float:oPos[3], Float:oRot[3];
		new Float:fAngle;
		new count = 0;
		GetPlayerFacingAngle(playerid, fAngle);
		for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
		{
		    if(Furn[i][ID] <= 0) continue;
		    if(Furn[i][HouseID] != InHouse[playerid]) continue;
		    GetDynamicObjectPos(Furn[i][Object], oPos[0], oPos[1], oPos[2]);
		    GetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]);
		    if(!IsPlayerInRangeOfPoint(playerid, 3.0, oPos[0], oPos[1], oPos[2])) continue;
	        count++;
		    /*if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID])
		        return NoAdmin(playerid);*/

	        if(Furn[i][Authority] == 2)
	        {
	            new saf = GetSafeID(InHouse[playerid]);
				if(Safe[saf][sLocked])
				    format(gString, sizeof(gString), ""COL_GREEN"Unlock Safe"), ShowPlayerDialog(playerid, DIALOG_SAFE, DIALOG_STYLE_LIST, "Safe", gString, "Select", "Close");

				else
				{
					if(Safe[saf][Code] == 0)
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
		}
		CPF(playerid, COLOR_GRAY, "There is no safe nearby.");
	}
	else CPF(playerid, COLOR_GRAY, "You are not inside a House.");
	return 1;
}

CMD:door(playerid, params[])
{
	if(InHouse[playerid] > 0)
	{
		new Float:oPos[3], Float:oRot[3];
		new Float:fAngle;
		new count = 0;
		GetPlayerFacingAngle(playerid, fAngle);
		for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
		{
		    if(Furn[i][ID] <= 0) continue;
		    if(Furn[i][HouseID] != InHouse[playerid]) continue;
		    GetDynamicObjectPos(Furn[i][Object], oPos[0], oPos[1], oPos[2]);
		    GetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]);
		    if(!IsPlayerInRangeOfPoint(playerid, 3.0, oPos[0], oPos[1], oPos[2])) continue;
	        count++;
	        if(Furn[i][Locked] == 1) return CPF(playerid, COLOR_RED, "This door is locked!");
	        if(Furn[i][Authority] == 1)
	        {
	            if(Furn[i][Opened] == 1)
	            {
	                SetDynamicObjectRot(Furn[i][Object], Furn[i][rot][0], Furn[i][rot][1], Furn[i][rot][2]);
	                Furn[i][Opened] = 0;
	            }
	            else
	            {
					if(Furn[i][rot][2] <= 0.0)
					{
		                if((fAngle >= 0.0 && fAngle < 180.0) || fAngle > 350.0)
		                {
		                    SetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]-90.0);
						}
						else if(fAngle >= 180.0)
		                {
		                    SetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]+90.0);
		                }
		                Furn[i][Opened] = 1;
	                }
	                else
	                {
		                if((fAngle >= 0.0 && fAngle < 180.0) || fAngle > 350.0)
		                {
		                    SetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]+90.0);
						}
						else if(fAngle >= 180.0)
		                {
		                    SetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]-90.0);
		                }
		                Furn[i][Opened] = 1;
	                }
	            }
	            return 1;
	        }
		}
		CPF(playerid, COLOR_GRAY, "There is no door nearby.");
	}
	else
	{
		if(cInfo[playerid][cFaction] <= 0) return NoAdmin(playerid);
		if(cInfo[playerid][cFaction] == 1)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 3.0, 240.7297,117.6944,1003.2188))
		    {
		        if(!pDoor[0])
		        {
		            MoveDynamicObject(pddoor[0], 239.6000100,116.5900000,1003.4000200, 3.0, 0.0000000,0.0000000,180.0000000);
		            pDoor[0] = true;
					format(gString, sizeof(gString), "* %s slides %s admission card to open the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        else
		        {
		            MoveDynamicObject(pddoor[0], 239.6000100,116.5900000,1003.4000200, 3.0, 0.0000000,0.0000000,100.0000000);
		            pDoor[0] = false;
					format(gString, sizeof(gString), "* %s slides %s admission card to close the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 252.4386,108.9848,1003.2188))
		    {
		        if(!pDoor[1])
		        {
		            MoveDynamicObject(pddoor[1], 253.2000000,110.1000000,1003.5000000, 3.0, 0.0000000,0.0000000,350.0000000);
		            pDoor[1] = true;
					format(gString, sizeof(gString), "* %s slides %s admission card to open the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        else
		        {
		            MoveDynamicObject(pddoor[1], 253.2000000,110.1000000,1003.5000000, 3.0, 0.0000000,0.0000000,280.0000000);
		            pDoor[1] = false;
					format(gString, sizeof(gString), "* %s slides %s admission card to close the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 252.1769,125.2989,1003.2188))
		    {
		        if(!pDoor[2])
		        {
		            MoveDynamicObject(pddoor[2], 253.3000000,126.2500000,1003.7999900, 3.0, 0.0000000,0.0000000,360.0000000);
		            pDoor[2] = true;
					format(gString, sizeof(gString), "* %s slides %s admission card to open the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        else
		        {
		            MoveDynamicObject(pddoor[2], 253.3000000,126.2500000,1003.7999900, 3.0, 0.0000000,0.0000000,280.0000000);
		            pDoor[2] = false;
					format(gString, sizeof(gString), "* %s slides %s admission card to close the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        return 1;
		    }
		    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 240.4079,125.0801,1003.2257))
		    {
		        if(!pDoor[3])
		        {
		            MoveDynamicObject(pddoor[3], 239.6000100,126.1000000,1003.4000200, 3.0, 0.0000000,0.0000000,200.0000000);
		            pDoor[3] = true;
					format(gString, sizeof(gString), "* %s slides %s admission card to open the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        else
		        {
		            MoveDynamicObject(pddoor[3], 239.6000100,126.1000000,1003.4000200, 3.0, 0.0000000,0.0000000,280.0000000);
		            pDoor[3] = false;
					format(gString, sizeof(gString), "* %s slides %s admission card to close the door.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
					ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		        }
		        return 1;
		    }
		    CPF(playerid, COLOR_GRAY, "There is no door nearby.");
		}
	}
	return 1;
}

CMD:factionon(playerid, params[])
{
 	if(sscanf(params,"i", params[1])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /factionon (factionID)");
 	if(!FactionExists(params[1])) return CPF(playerid, COLOR_GRAY, "Given factionID does not exist.");
 	CPF(playerid, -1, "{33aa33}(Faction ID %d - %s): "COL_WHITE"%d/%d are online.", params[1], fInfo[params[1]][Name], fInfo[params[1]][OnlineMembers], fInfo[params[1]][TotalMembers]);
 	return 1;
}

CMD:create_group(playerid, params[])
{
	if(cInfo[playerid][cOOCGroup] >= 1) return CPF(playerid, COLOR_GRAY, "You are already in a group, /leavegroup");
	new confirmMsg[32];
 	if(sscanf(params,"s[32]", confirmMsg))
	{
	    SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_group (confirm)");
	    SendClientMessage(playerid, COLOR_GRAY, "Requirements: Level 3 and $15,000");
	    return 1;
	}
	if(!strcmp(confirmMsg, "confirm" ,true))
	{
	    if(cInfo[playerid][cLevel] != 3 && cInfo[playerid][cMoney] < 15000) return CPF(playerid, COLOR_GRAY, "You do not meet the requirements.");
	    new datestr[32], date[3];
	    getdate(date[0], date[1], date[2]);
	    format(datestr, 32, "%d/%d/%d", date[2], date[1], date[0]);
		format(_query, sizeof(_query), "INSERT INTO `oocgroups`(`CreateDate`) VALUES ('%s')", datestr);
		mysql_query(_query);
		format(gInfo[mysql_insert_id()][CreationDate], 64, datestr);
		gInfo[mysql_insert_id()][ID] = mysql_insert_id();
		gInfo[mysql_insert_id()][Taken] = 1;
		gInfo[mysql_insert_id()][Chat] = 1;
		cInfo[playerid][cOOCGroup] = mysql_insert_id();
		cInfo[playerid][cOLeader] = mysql_insert_id();
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" You have created a new group and it was listed as ID %d.", mysql_insert_id());
		CPF(playerid, COLOR_GRAY, "You've been set as the leader of this group.");
	}
	else {
	    SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_group (confirm)");
	    SendClientMessage(playerid, COLOR_GRAY, "Requirements: Level 3 and $15,000");
	}
	return 1;
}

CMD:create_int(playerid, params[])
{
	new outsidetext[256];
	new Float:Posit[3];
	if(pInfo[playerid][AdminLevel] <= 5) return NoAdmin(playerid);
 	if(sscanf(params,"fffis[256]", Posit[0], Posit[1], Posit[2], params[3], outsidetext))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_int (float X) (float Y) (float Z) (intID) (outsideText)");

	new Float:MyPos[3];
	GetPlayerPos(playerid, MyPos[0], MyPos[1], MyPos[2]);
	outsidetext = str_replace("(r)", "{ff0000}", outsidetext);
	outsidetext = str_replace("(w)", "{ffffff}", outsidetext);
	outsidetext = str_replace("(g)", "{3eda00}", outsidetext);
	outsidetext = str_replace("(b)", "{008aff}", outsidetext);
	outsidetext = str_replace("(o)", "{ff6600}", outsidetext);
	outsidetext = str_replace("(p)", "{d800ff}", outsidetext);
	outsidetext = str_replace("(y)", "{ffc600}", outsidetext);
	format(_query, sizeof(_query), "INSERT INTO `interiors`(`outX`, `outY`, `outZ`, `inX`, `inY`, `inZ`, `InteriorID`, `outsideText`) VALUES ('%f', '%f', '%f', '%f', '%f', '%f', '%d', '%s')",
	MyPos[0], MyPos[1], MyPos[2], Posit[0], Posit[1], Posit[2], params[3], outsidetext);
	mysql_query(_query);
	new i = mysql_insert_id();
	iInfo[i][ID] = i;
	iInfo[i][outX] = MyPos[0];
	iInfo[i][outY] = MyPos[1];
	iInfo[i][outZ] = MyPos[2];
	iInfo[i][inX] = Posit[0];
	iInfo[i][inY] = Posit[1];
	iInfo[i][inZ] = Posit[2];
	iInfo[i][InteriorID] = params[3];
	format(iInfo[i][outsideText], 256, outsidetext);
	iInfo[i][Pickup] = CreateDynamicPickup(1239, 1, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ], -1, -1, -1, 100);
	format(gString, sizeof gString, ""COL_WHITE"[%s"COL_WHITE"]", iInfo[i][outsideText]);
	iInfo[i][Label] = Create3DTextLabel(gString, -1, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ]+0.4, 10.0, 0, 0);
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Interior ID %d has been created (\"%s"COL_WHITE"\").", i, outsidetext);
	return 1;
}

CMD:b(playerid, params[])
{
    if(sscanf(params,"s[156]", params))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /b (message)");

	gUser = playerid;
	gType = 7;
	if(ModeratorDuty[playerid] && pInfo[playerid][AdminLevel] == 1)
	{
		format(gString, sizeof(gString), "(( [%d] {A52A2A}%s"COL_FADE": %s ))", playerid, GetPlayerNameEx(playerid), params);
		ProxDetector(10.0, playerid, gString, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
	}
	else if(AdminDuty[playerid] && pInfo[playerid][AdminLevel] > 1)
	{
		format(gString, sizeof(gString), "(( [%d] {33AA33}%s"COL_FADE": %s ))", playerid, cInfo[playerid][cCreator], params);
		ProxDetector(10.0, playerid, gString, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
	}
	else
	{
	    if(cInfo[playerid][cDonator] > 0)
	    {
			format(gString, sizeof(gString), "(( [%d] {E89F38}%s"COL_FADE": %s ))", playerid, GetPlayerNameEx(playerid), params);
			ProxDetector(10.0, playerid, gString, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
	    }
	    else
	    {
			format(gString, sizeof(gString), "(( [%d] %s: %s ))", playerid, GetPlayerNameEx(playerid), params);
			ProxDetector(10.0, playerid, gString, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
		}
	}
	return 1;
}

CMD:blockpm(playerid, params[])
{
	if(cInfo[playerid][cDonator] > 0 || pInfo[playerid][AdminLevel] > 0)
	{
	    if(sscanf(params,"u", params[0]))
			return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /blockpm (playerid/partofname)");

		if(params[0] == playerid) return CPF(playerid, COLOR_GRAY, "You can't block PMs from yourself.");
		if(!Logged[params[0]] || !IsPlayerConnected(params[0])) return Disconnected(playerid);
		if(BlockedPM[playerid][params[0]] == true)
		{
		    BlockedPM[playerid][params[0]] = false;
		    CPF(playerid, COLOR_GREEN, "You have unblocked %s, he can now PM you.", GetName(params[0]));
		}
		else
		{
		    BlockedPM[playerid][params[0]] = true;
		    CPF(playerid, COLOR_RED, "You have blocked all communication from %s.", GetName(params[0]));
		}
	}
	else NoAdmin(playerid);
	return 1;
}

CMD:showpm(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 2) return NoAdmin(playerid);
	if(ShowPM[playerid])
	{
	    ShowPM[playerid] = false;
	    CPF(playerid, COLOR_GRAY, "PMs are hidden now.");
	}
	else
	{
	    CPF(playerid, COLOR_GRAY, "PMs are visible now.");
	    ShowPM[playerid] = true;
	}
	return 1;
}

CMD:shout(playerid, params[])
{
    if(Dead[playerid]) return CPF(playerid, COLOR_RED, "You are not able to speak when you are dead.");
    if(sscanf(params,"s[144]", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /shout (message)");
    if(AdminSpectate[playerid]) return SendClientMessage(playerid, -1, ""COL_RED"You shouldn't use this while spectating as an admin!");

	gUser = playerid;
    gType = 3;
	format(gString, sizeof(gString), "%s shouts: %s", GetPlayerNameEx(playerid), params[0]);
	ProxDetector(17.0, playerid, gString, -1, -1, -1, COLOR_FADE1, COLOR_FADE2);
	return 1;
}

CMD:whisper(playerid, params[])
{
    if(Dead[playerid]) return CPF(playerid, COLOR_RED, "You are not able to speak when you are dead.");

    if(sscanf(params,"us[144]", params[0], params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /whisper (playerid/partofname) (message)");
	if(!IsPlayerConnected(params[0])) return CPF(playerid, -1, "SERVER: ID %d is not connected.", params[0]);
	if(AdminSpectate[playerid]) return SendClientMessage(playerid, -1, ""COL_RED"You shouldn't use chat while spectating as an admin!");
	GetPlayerPos(params[0], xa, ya, za);
	if(IsPlayerInRangeOfPoint(playerid, 3.0, xa, ya, za))
	{
		gUser = playerid;
	    gType = 6;
	    if(AdminSpectate[params[0]]) return CPF(playerid, COLOR_GRAY, "SERVER: ID %d is not close to you.", params[0]);
	    format(gString, sizeof(gString), ""COL_YELLOW"Whispers to %s: %s", GetPlayerNameEx(params[0]), params[1]);
		SendClientMessage(playerid, -1, gString);
		format(gString, sizeof(gString), ""COL_YELLOW"%s whispers: %s", GetPlayerNameEx(playerid), params[1]);
		SendWrappedMessageToPlayer(params[0], -1, gString);
		format(gString, sizeof gString, ">> %s whispers something to %s.", GetName(playerid), GetName(params[0]));
		SetPlayerChatBubble(playerid, gString, COLOR_PURPLE, 15.0, 10000);
	}
	else CPF(playerid, COLOR_GRAY, "SERVER: ID %d is not close to you.", params[0]);
	return 1;
}

CMD:pm(playerid, params[])
{
    if(sscanf(params,"us[256]", params[0], params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /pm (playerid/partofname) (message)");
	if(!IsPlayerConnected(params[0])) return CPF(playerid, -1, "SERVER: ID %d is not connected.", params[0]);
	if(params[0] == playerid) return true;
	if(BlockedPM[params[0]][playerid] == true) return CPF(playerid, -1, "This player has blocked communication with you.");
	if(AdminDuty[params[0]] && pInfo[params[0]][AdminLevel] >= 2 && pInfo[playerid][AdminLevel] <= 0)
	{
		PMto[playerid] = params[0];
		format(PMcontent[playerid], 256, params[1]);
		ShowPlayerDialog(playerid, DIALOG_CONFIRMPM, DIALOG_STYLE_MSGBOX, "PM Confirmation", "You are about to send a private message to an on-duty administrator. Relying on the server rules, \nmessaging administrators on-duty for administrating purposes is punishable. \nAre you sure you wish to send this PM?", "Send!", "Cancel");
	}
	else
	{
		format(gString, sizeof gString, "{FAD816}(( PM Sent to %s[%d]: %s ))", GetName(params[0]), params[0], params[1]);
		SendWrappedMessageToPlayer(playerid, 0xFFD900FF, gString);
		format(gString, sizeof gString, "{F2D429}(( PM From %s[%d]: %s))", GetName(playerid), playerid, params[1]);
		SendWrappedMessageToPlayer(params[0], 0xF2D429FF, gString);
		format(gString, sizeof(gString), "[Show PM] %s sent to %s: %s", GetName(playerid), GetName(params[0]), params[1]);
		SendShowPM(COLOR_RED, gString);
	}
	return 1;
}

CMD:id(playerid, params[])
{
	if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /id (playerid/partofname)");

	if(IsPlayerConnected(params[0]))
	{
	    CPF(playerid, COLOR_GRAY, "%s (ID %d) - Level %d", GetName(params[0]), params[0], cInfo[params[0]][cLevel]);
	    CPF(playerid, COLOR_GRAY, "Forum: %s", pInfo[params[0]][pForum]);

	    if(AFKCount[params[1]] <= 6)
		{
			return 1;
		}
		else
		{
			CPF(playerid, COLOR_RED, "AFK for %d seconds.", AFKCount[params[1]]);
		}
	}
	else
	{
	    Disconnected(playerid);
	}
	return 1;
}

CMD:eject(playerid, params[])
{
	if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /eject (playerid/partofname)");

	if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return CPF(playerid, COLOR_GRAY, "You are not the driver.");

	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[0] == playerid) return true;
	if(!IsPlayerInRangeOfPlayer(playerid, params[0], 2.5))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	format(gString, sizeof(gString), "* %s ejects %s from %s vehicle.", GetPlayerNameEx(playerid), GetName(params[0]), GetPlayerGender(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	RemovePlayerFromVehicle(params[0]);
	new Float:avPos[3];
	GetPlayerPos(params[0], avPos[0], avPos[1], avPos[2]);
	SetPlayerPos(params[0], avPos[0], avPos[1], avPos[2]+0.5);
	return 1;
}

CMD:me(playerid,params[])
{
	if(sscanf(params, "s[144]", params[0]))
		return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /me (action)");
    if(AdminSpectate[playerid]) return SendClientMessage(playerid, -1, ""COL_RED"You shouldn't use this while spectating as an admin!");

	gUser = playerid;
    gType = 4;
	format(gString, sizeof(gString), "* %s %s", GetPlayerNameEx(playerid), params[0]);
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:ame(playerid,params[])
{
	if(sscanf(params, "s[144]", params[0]))
		return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /ame (action)");


	format(gString, sizeof(gString), "* %s %s", GetPlayerNameEx(playerid), params[0]);
	SetPlayerChatBubble(playerid, gString, COLOR_PURPLE, 15.0, 10000);
	CPF(playerid, COLOR_PURPLE, ">> %s %s", GetPlayerNameEx(playerid), params[0]);
	return 1;
}

CMD:do(playerid,params[])
{
	if(sscanf(params, "s[144]", params[0]))
		return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /do (action)");
    if(AdminSpectate[playerid]) return SendClientMessage(playerid, -1, ""COL_RED"You shouldn't use this while spectating as an admin!");

	gUser = playerid;
    gType = 5;
	format(gString, sizeof(gString), "* %s (( %s ))", params[0], GetPlayerNameEx(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:t(playerid, params[])
	return cmd_say(playerid, params);

CMD:s(playerid, params[])
	return cmd_shout(playerid, params);

CMD:hr(playerid, params[])
	return cmd_helprequests(playerid, params);

CMD:l(playerid, params[])
	return cmd_low(playerid, params);


CMD:w(playerid, params[])
	return cmd_whisper(playerid, params);


CMD:moderatorduty(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 0) return NoAdmin(playerid);
    SetPlayerColor(playerid, ModeratorDuty[playerid] ? 0xFFFFFF00 : 0xA52A2A00);
    ModeratorDuty[playerid] = ModeratorDuty[playerid] ? false : true;
	format(gString, sizeof gString, "Moderator %s is now %s.", GetName(playerid), ModeratorDuty[playerid] ? ("on-duty") : ("off-duty"));
	SendModeratorMessage(0xA52A2AAA, gString);
    return 1;
}

CMD:adminduty(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    GetPlayerHealth(playerid, oldHealth[playerid]);
    GetPlayerArmour(playerid, oldArmour[playerid]);
    if(!AdminDuty[playerid])
        SetPlayerHealth(playerid, 99999.0);

	else
	    SetPlayerHealth(playerid, 99.0);

    SetPlayerColor(playerid, AdminDuty[playerid] ? 0xFFFFFF00 : 0x33AA3300);
    AdminDuty[playerid] = AdminDuty[playerid] ? false : true;
	format(gString, sizeof gString, "Administrator %s is now %s.", GetName(playerid), AdminDuty[playerid] ? ("on admin-duty") : ("off admin-duty"));
	SendAdminMessage(COLOR_RED, gString);
    return 1;
}

CMD:aduty(playerid, params[])
{
	return cmd_adminduty(playerid, "");
}

CMD:mduty(playerid, params[])
{
	return cmd_moderatorduty(playerid, "");
}


CMD:kick(playerid, params[])
{
    new reason[128];
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params,"us[128]", params[1], reason))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /kick (playerid/partofname) (reason)");
	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	
	new targetid;
	if(strcmp(pInfo[targetid][pForum], "Arrow", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Fresh", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Mr187", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
	TogglePlayerControllable(params[1], false);
	format(gString, sizeof gString, "ADMIN: %s has been kicked by administrator %s. [Reason: %s]", GetName(params[1]), GetName(playerid), reason);
	SendClientMessageToAll(COLOR_RED, gString);
	new time[3], date[3], lastseen[64];
	getdate(date[2], date[1], date[0]);
	gettime(time[0], time[1], time[2]);
	format(lastseen, 64, "%d/%d/%d %d:%d:%d", date[0], date[1], date[2], time[0], time[1], time[2]);
	format(_query, sizeof(_query), "INSERT INTO `adminlogs`(`cID`, `By`, `Reason`, `Date`, `Type`) VALUES ('%d', '%d', '%s', '%s', '2')", cInfo[params[1]][SQLID], cInfo[playerid][SQLID], reason, lastseen);
	mysql_query(_query);
	cInfo[params[1]][cAdminRecordCount]++;
	KickEx(params[1]);
    return 1;
}

CMD:ginvite(playerid, params[])
{
	if(cInfo[playerid][cOLeader] <= 0) return NoAdmin(playerid);
	new targetid;
    if(sscanf(params,"u", targetid))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /ginvite (playerid/partofname)");

	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
	if(targetid == playerid) return CPF(playerid, -1, ""COL_RED"Error:"COL_WHITE" You can't invite yourself.");
	if(cInfo[targetid][cOOCGroup] != 0) return CPF(playerid, COLOR_GRAY, "Given player is already in a group.");

	GroupInvite[targetid] = cInfo[playerid][cOOCGroup];
	CPF(playerid, -1, "You have invited (%d) %s to join your group.", targetid, GetPlayerNameEx(targetid));
	CPF(targetid, -1, ""COL_RED"%s has invited you to join his group, /accept group!", GetPlayerNameEx(playerid));
    return 1;
}

CMD:inventory(playerid, params[])
{
	if(GetBagItemCount(playerid) <= 0) return CPF(playerid, COLOR_GRAY, "You do not possess any items.");
 	Bag_Page[playerid] = 0;
  	ShowBag(playerid);
  	SendClientMessage(playerid, COLOR_FADE2, "HINT: You can quickly view your inventory by pressing 'N' on your keyboard.");
  	return 1;
}

CMD:guninvite(playerid, params[])
{
	if(cInfo[playerid][cOLeader] <= 0) return NoAdmin(playerid);
	new targetid;
    if(sscanf(params,"u", targetid))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /guninvite (playerid/partofname)");

	if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
	if(targetid == playerid) return CPF(playerid, -1, ""COL_RED"Error:"COL_WHITE" You can't uninvite yourself.");
	if(cInfo[targetid][cOOCGroup] != cInfo[playerid][cOOCGroup]) return CPF(playerid, COLOR_GRAY, "Given player is not apart of your group.");
	cInfo[targetid][cOOCGroup] = 0;
	cInfo[targetid][cOLeader] = 0;
	format(gString, sizeof gString, "(( GROUP: %s has been uninvited from the group. ))", GetPlayerNameEx(targetid));
	SendGroupMessage(cInfo[playerid][cOOCGroup], -1, gString);
	CPF(playerid, -1, "You kicked (%d) %s from your group.", targetid, GetPlayerNameEx(targetid));
	CPF(targetid, 0x7BDDA5AA, "You have been kicked from your group by %s.", GetPlayerNameEx(playerid));
    return 1;
}

CMD:uniform(playerid, params[])
{
	if(!OnDuty[playerid])
	    return CPF(playerid, COLOR_GRAY, "You are not on duty.");

	if(fInfo[cInfo[playerid][cFaction]][Type] == 1)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 232.5531,120.9065,1003.2188))
	        return CPF(playerid, COLOR_GRAY, "You are not in the lockers room.");

		ShowPlayerDialog(playerid, DIALOG_UNIFORMS, DIALOG_STYLE_LIST, "LSPD Uniform", "Guard/Student\nPolice Officer 1\nPolice Officer 2\nPolice Officer 3\nPolice Officer 4\nPolice Officer 5\nS.W.A.T\nBiker\nFemale", "Select", "Close");
	    return 1;
	}
	else if(fInfo[cInfo[playerid][cFaction]][Type] == 2)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 17.5295,0.0534,999.0019))
        	return CPF(playerid, COLOR_GRAY, "You are not in the lockers room.");

		ShowPlayerDialog(playerid, DIALOG_UNIFORMS, DIALOG_STYLE_LIST, "LSFD Uniform", "Firefighter 1\nFirefighter 2\nFirefighter 3\nParamedic 1\nParamedic 2\nParamedic 3\nDoctor\nFemale", "Select", "Close");
	    return 1;
	}
	NoAdmin(playerid);
	return 1;
}

CMD:duty(playerid, params[])
{
	if(AdminDuty[playerid])
	    return CPF(playerid, COLOR_GRAY, "You are on admin duty.");

	if(fInfo[cInfo[playerid][cFaction]][Type] == 1)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 232.5531,120.9065,1003.2188))
	        return CPF(playerid, COLOR_GRAY, "You are not in the lockers room.");

		if(OnDuty[playerid])
		{
			format(gString, sizeof(gString), "HQ: %s %s is now off-duty.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
			SendFactionMessage(1, 0x8D8DFF00, gString);
		    OnDuty[playerid] = false;
		    ResetPlayerWeapons(playerid);
			SetPlayerColor(playerid, 0xFFFFFF00);
		}
		else
		{
			OnDuty[playerid] = true;
			SetPlayerColor(playerid, 0x8D8DFF00);
			format(gString, sizeof(gString), "HQ: %s %s is now on-duty.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
			SendFactionMessage(1, 0x8D8DFF00, gString);
		}
	    return 1;
	}
	else if(fInfo[cInfo[playerid][cFaction]][Type] == 2)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 17.5295,0.0534,999.0019))
	        return CPF(playerid, COLOR_GRAY, "You are not in the lockers room.");

		if(OnDuty[playerid])
		{
			format(gString, sizeof(gString), "HQ: %s %s is now off-duty.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
			SendFactionMessage(2, 0xFF8282AA, gString);
		    OnDuty[playerid] = false;
		    ResetPlayerWeapons(playerid);
			SetPlayerColor(playerid, 0xFF828200);
		}
		else
		{
			OnDuty[playerid] = true;
			SetPlayerColor(playerid, 0xFF828200);
			format(gString, sizeof(gString), "HQ: %s %s is now on-duty.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
			SendFactionMessage(2, 0xFF8282AA, gString);
		}
	    return 1;
	}
	NoAdmin(playerid);
	return 1;
}

CMD:revive(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /revive (playerid/partofname)");

	SetPlayerHealth(params[0], 99.0);
	Downed[params[0]] = false;
    KillTimer(CountDownTimer[params[0]]);
    KillTimer(DownTimer[params[0]]);
	TogglePlayerControllable(playerid, 1);
	Dead[params[0]] = false;
	SetPlayerDrunkLevel(params[0], 0);
	CPF(playerid, 0xFCF87FFF, "You have revived (ID %d) %s", params[0], GetName(params[0]));
	CPF(params[0], COLOR_GRAY, "Administrator %s has revived you.", GetName(playerid));
	return 1;
}

CMD:heal(playerid, params[])
{
    if(fInfo[cInfo[playerid][cFaction]][Type] != 2) return NoAdmin(playerid);
    if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /heal (playerid/partofname)");

    if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(params[0] == playerid)
		return CPF(playerid, COLOR_GRAY, "You can't heal yourself.");

	if(!IsPlayerInRangeOfPlayer(playerid, params[0], 3.0))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	CPF(playerid, 0xFCF87FFF, "You have healed %s.", GetName(params[0]));
	CPF(params[0], 0xFCF87FFF, "%s %s has healed you.", GetPlayerRank(playerid), GetName(playerid));
	ClearAnimations(playerid);
	SetPlayerHealth(params[0], 100.0);
	Downed[params[0]] = false;
    KillTimer(CountDownTimer[params[0]]);
    KillTimer(DownTimer[params[0]]);
	TogglePlayerControllable(playerid, 1);
    return 1;
}

CMD:terminate(playerid, params[])
{
    if(fInfo[cInfo[playerid][cFaction]][Type] != 2) return NoAdmin(playerid);
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, -8.5748,0.7130,999.0078))
        return CPF(playerid, COLOR_GRAY, "You are not in the termination room.");

    if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /terminate (playerid/partofname)");

    if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(params[0] == playerid)
		return CPF(playerid, COLOR_GRAY, "You can't terminate yourself.");

	if(!IsPlayerInRangeOfPlayer(playerid, params[0], 3.0))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	if(!Dead[params[0]])
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not dead.");

	format(gString, sizeof(gString), ""COL_RED"HQ: %s %s has terminated %s.", GetPlayerRank(playerid), GetName(playerid), GetName(params[0]));
	SendFactionMessage(2, -1, gString);
	CPF(params[0], -1, ""COL_RED"%s %s has terminated you.", GetPlayerRank(playerid), GetName(playerid));
	Dead[params[0]] = false;
	Downed[params[0]] = false;
    KillTimer(CountDownTimer[params[0]]);
    KillTimer(DownTimer[params[0]]);
	TogglePlayerControllable(playerid, 1);
	return 1;
}

CMD:putinambu(playerid, params[])
{
    if(fInfo[cInfo[playerid][cFaction]][Type] != 2) return NoAdmin(playerid);

    if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /putinambu (playerid/partofname)");

	if(!IsPlayerInAnyVehicle(playerid) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 416)
	    return CPF(playerid, COLOR_GRAY, "You are not driving an Ambulance.");

    if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(params[0] == playerid)
		return 1;

	if(!IsPlayerInRangeOfPlayer(playerid, params[0], 5.0))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	PutPlayerInVehicle(params[0], GetPlayerVehicleID(playerid), 3);
	format(gString, sizeof(gString), "* %s puts %s in the ambulance.", GetPlayerNameEx(playerid), GetPlayerNameEx(params[0]));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:faction(playerid, params[])
{
    if(cInfo[playerid][cLeader] <= 0) return NoAdmin(playerid);
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction (option)");
 		CPF(playerid, -1, "invite, uninvite, chat, setrank, joinrank, cars, editname, editrank");
 		return 1;
    }
	if(!strcmp(params, "invite", true, 6))
	{
		new targetid;
	    if(sscanf(params,"s[64]u", params, targetid))
	        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction invite (playerid/partofname)");

		if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
		if(targetid == playerid) return CPF(playerid, -1, ""COL_RED"Error:"COL_WHITE" You can't invite yourself.");
		if(cInfo[targetid][cFaction] != 0) return CPF(playerid, COLOR_GRAY, "Given player is already in a faction.");

		FactionInvite[targetid] = cInfo[playerid][cFaction];
		CPF(playerid, 0xFCF87FFF, "You have invited (%d) %s to join your faction.", targetid, GetPlayerNameEx(targetid));
		CPF(targetid, 0xFCF87FFF, "The leader %s has invited you to join %s [To join type /accept faction]", fInfo[cInfo[playerid][cFaction]][Name], GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "uninvite", true, 8))
	{
		new targetid;
	    if(sscanf(params,"s[64]u", params, targetid))
	        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction uninvite (playerid/partofname)");

		if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
		if(targetid == playerid) return CPF(playerid, -1, ""COL_RED"Error:"COL_WHITE" You can't uninvite yourself.");
		if(cInfo[targetid][cFaction] != cInfo[playerid][cFaction]) return CPF(playerid, COLOR_GRAY, "Given player is not apart of your faction.");
		cInfo[targetid][cFaction] = 0;
		cInfo[targetid][cFaction] = 0;
		format(gString, sizeof gString, "GROUP: %s has been uninvited from the group.", GetPlayerNameEx(targetid));
		SendFMessage(cInfo[playerid][cFaction], -1, gString);
		CPF(playerid, 0xFCF87FFF, "You uninvited (%d) %s from your faction.", targetid, GetPlayerNameEx(targetid));
		CPF(targetid, -1, ""COL_RED"The leader %s has uninvited you from the faction.", GetPlayerNameEx(playerid));
	}
	else if(!strcmp(params, "joinrank", true, 8))
	{
		new joinrank, fac = cInfo[playerid][cFaction];
	    if(sscanf(params,"s[64]d", params, joinrank))
	        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction joinrank (rankID 1-15)");

		if(joinrank > 15 || joinrank < 1)
			return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction joinrank (rankID 1-15)");

		fInfo[fac][JoinRank] = joinrank;
		CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Join rank has been set to %d.", joinrank);
	}
	else if(!strcmp(params, "setrank", true, 7))
	{
		new targetid, rank;
	    if(sscanf(params,"s[64]ud", params, targetid, rank))
	        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction setrank (playerid/partofname) (rankID 1-15)");

		if(rank > 15 || rank < 1)
			return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction setrank (playerid/partofname) (rankID 1-15)");

		if(!IsPlayerConnected(targetid)) return Disconnected(playerid);
		if(cInfo[targetid][cFaction] != cInfo[playerid][cFaction]) return CPF(playerid, COLOR_GRAY, "Given player is not apart of your faction.");
		if(cInfo[targetid][cRank] < rank)
		    CPF(playerid, -1, "You have promoted to %s.", GetPlayerNameEx(targetid), GetPlayerRank(targetid)),
		    CPF(targetid, 0xFCF87FFF, "%s %s has promoted you to %s.", GetPlayerRank(playerid), GetPlayerNameEx(playerid), GetPlayerRank(targetid));

		else
		    CPF(playerid, -1, "You have demoted to %s.", GetPlayerNameEx(targetid), GetPlayerRank(targetid)),
		    CPF(targetid, 0xFCF87FFF, "%s %s has demoted you to %s.", GetPlayerRank(playerid), GetPlayerNameEx(playerid), GetPlayerRank(targetid));

		cInfo[targetid][cRank] = rank;
	}
	else if(!strcmp(params, "chat", true, 4))
	{
		new fac = cInfo[playerid][cFaction];
	    format(gString, sizeof gString, "(( Faction chat has been %s by %s. ))", fInfo[fac][Chat] ? ("disabled") : ("enabled") ,GetPlayerNameEx(playerid));
		switch(fInfo[cInfo[playerid][cFaction]][Type])
		{
		    case 1: SendFMessage(cInfo[playerid][cFaction], 0x8D8DFF00, gString);
		    case 2: SendFMessage(cInfo[playerid][cFaction], 0xFF8282AA, gString);
		    default: SendFMessage(cInfo[playerid][cFaction], 0x7BDDA5AA, gString);
		}
	    fInfo[fac][Chat] = fInfo[fac][Chat] ? 0 : 1;
	}
	else if(!strcmp(params, "cars", true, 4))
	{
	 	for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
	 	{
	 	    if(!IsValidVehicle(i)) continue;
	 	    if(IsVehicleOccupied(i)) continue;
	 	    if(vInfo[i][Faction] != cInfo[playerid][cFaction]) continue;
			RespawnVeh(i);
	 	}
	    format(gString, sizeof gString, "(( %s has respawned all faction vehicles. ))", GetPlayerNameEx(playerid));
		switch(fInfo[cInfo[playerid][cFaction]][Type])
		{
		    case 1: SendFMessage(cInfo[playerid][cFaction], 0x8D8DFF00, gString);
		    case 2: SendFMessage(cInfo[playerid][cFaction], 0x33ccffAA, gString);
		    default: SendFMessage(cInfo[playerid][cFaction], 0x7BDDA5AA, gString);
		}
	}
	else if(!strcmp(params, "editrank", true, 8))
	{
	    if(sscanf(params, "s[64]ds[64]", params, params[1], params[2]))
			return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction editrank (rankID 1-15) (rankName)");

		if(params[1] > 15 || params[1] < 1)
		    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction editrank (rankID 1-15) (rankName)");

		if(FactionExists(cInfo[playerid][cFaction]))
		{
		    switch(params[1])
		    {
		        case 1: format(fInfo[cInfo[playerid][cFaction]][Rank1], 128, params[2]);
		        case 2: format(fInfo[cInfo[playerid][cFaction]][Rank2], 128, params[2]);
		        case 3: format(fInfo[cInfo[playerid][cFaction]][Rank3], 128, params[2]);
		        case 4: format(fInfo[cInfo[playerid][cFaction]][Rank4], 128, params[2]);
		        case 5: format(fInfo[cInfo[playerid][cFaction]][Rank5], 128, params[2]);
		        case 6: format(fInfo[cInfo[playerid][cFaction]][Rank6], 128, params[2]);
		        case 7: format(fInfo[cInfo[playerid][cFaction]][Rank7], 128, params[2]);
		        case 8: format(fInfo[cInfo[playerid][cFaction]][Rank8], 128, params[2]);
		        case 9: format(fInfo[cInfo[playerid][cFaction]][Rank9], 128, params[2]);
		        case 10: format(fInfo[cInfo[playerid][cFaction]][Rank10], 128, params[2]);
		        case 11: format(fInfo[cInfo[playerid][cFaction]][Rank11], 128, params[2]);
		        case 12: format(fInfo[cInfo[playerid][cFaction]][Rank12], 128, params[2]);
		        case 13: format(fInfo[cInfo[playerid][cFaction]][Rank13], 128, params[2]);
		        case 14: format(fInfo[cInfo[playerid][cFaction]][Rank14], 128, params[2]);
				case 15: format(fInfo[cInfo[playerid][cFaction]][Rank15], 128, params[2]);
		    }
		    CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Rank %d has been set to \"%s\".", params[1], params[2]);
		}
	}
	else if(!strcmp(params, "editname", true, 8))
	{
	    if(sscanf(params, "s[64]s[128]", params, params[1]))
			return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /faction editname (name)");

		if(FactionExists(cInfo[playerid][cFaction]))
		{
		    format(fInfo[cInfo[playerid][cFaction]][Name], 128, params[1]);
		    CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Faction name has been set to \"%s\".", params[1]);
		}
	}
	return 1;
}

CMD:ajail(playerid, params[])
{
    new reason[128];
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params,"uis[128]", params[1], params[2], reason))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /ajail (playerid/partofname) (time in minutes) (reason)");
	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[2] <= 0)
	{
		format(gString, sizeof gString, "ADMIN: %s was released from admin-jail by %s.", GetName(params[1]), GetName(playerid));
		SendClientMessageToAll(COLOR_RED, gString);
		cInfo[params[1]][cJailed] = 0;
		cInfo[params[1]][cJailTime] = 0;
		SetPlayerInterior(playerid, 0);
		GameTextForPlayer(params[1], "~n~~n~~n~~n~~n~~g~Released from admin jail!", 3200, 5);
		SpawnPlayer(params[1]);
		SetPlayerVirtualWorld(params[1], 0);
  		AnticheatSpam[params[1]] = true;
  		SetTimerEx("PreventACSpam", 7500, false, "i", params[1]);
	}
	else
	{
		format(gString, sizeof gString, "ADMIN: %s has been admin-jailed by %s for %d minutes. [Reason: %s]", GetName(params[1]), GetName(playerid), params[2], reason);
		SendClientMessageToAll(COLOR_RED, gString);
		cInfo[params[1]][cJailed] = 1;
		cInfo[params[1]][cJailTime] = params[2] * 60;
		format(cInfo[params[1]][cJailedBy], 25, GetName(playerid));
		format(cInfo[params[1]][cJailReason], 128, reason);
		SetPlayerPos(params[1], 2524.3831,-1673.9191,14.8585);
		SetPlayerVirtualWorld(params[1], playerid+1);
		new time[3], date[3], lastseen[64];
		getdate(date[2], date[1], date[0]);
		gettime(time[0], time[1], time[2]);
		format(lastseen, 64, "%d/%d/%d %d:%d:%d", date[0], date[1], date[2], time[0], time[1], time[2]);
		format(_query, sizeof(_query), "INSERT INTO `adminlogs`(`cID`, `By`, `Reason`, `Date`, `Type`) VALUES ('%d', '%d', '%s', '%s', '1', '%d')", cInfo[params[1]][SQLID], cInfo[playerid][SQLID], reason, lastseen, params[2]);
		mysql_query(_query);
		cInfo[params[1]][cAdminRecordCount]++;
 		AnticheatSpam[params[1]] = true;
   		SetTimerEx("PreventACSpam", 7500, false, "i", params[1]);
	}
    return 1;
}

CMD:freeze(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params,"u", params[1]))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /freeze (playerid/partofname)");

	if(!IsPlayerConnected(params[1]))
		return Disconnected(playerid);

	TogglePlayerControllable(params[1], false);
	GameTextForPlayer(params[1], "~r~Frozen", 3200, 4);
	format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has frozen [%d] %s", GetName(playerid), params[1], GetName(params[1]));
	SendAdminMessage(-1, gString);
	return 1;
}

CMD:unfreeze(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params,"u", params[1]))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /unfreeze (playerid/partofname)");

	if(!IsPlayerConnected(params[1]))
		return Disconnected(playerid);

	TogglePlayerControllable(params[1], true);
	GameTextForPlayer(params[1], "~g~Unfrozen", 3200, 4);
	format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has unfrozen [%d] %s", GetName(playerid), params[1], GetName(params[1]));
	SendAdminMessage(-1, gString);
	return 1;
}

CMD:slap(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(sscanf(params,"u", params[1]))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /slap (playerid/partofname)");

	if(!IsPlayerConnected(params[1]))
		return Disconnected(playerid);

	new Float:px, Float:py, Float:pz;
	GetPlayerPos(params[1], px, py, pz);
	SetPlayerPos(params[1], px, py, pz+5);
	CPF(params[1], COLOR_GRAY, "Admin has slapped you.");
	format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s has slapped [%d] %s", GetName(playerid), params[1], GetName(params[1]));
	SendAdminMessage(-1, gString);
	return 1;
}

CMD:ban(playerid, params[])
{
    new reason[128],id,plrIP[16],PSerial[128];
	if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
    if(sscanf(params,"us[128]", params[1], reason))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /ban [Player ID] [Reason]");

	if(!IsPlayerConnected(params[1]))
		return Disconnected(playerid);
		
    new targetid;
    if(strcmp(pInfo[targetid][pForum], "Arrow", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Fresh", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    if(strcmp(pInfo[targetid][pForum], "Mr187", true) == 0) return CPF(playerid, COLOR_RED, "DON'T EVEN THINK ABOUT IT!");
    
	if(pInfo[params[1]][AdminLevel] > 2)
	    return 1;

    gpci(id, PSerial, sizeof(PSerial));
    GetPlayerIp(id, plrIP, sizeof(plrIP));
    format(_query, sizeof(_query), "INSERT INTO `serialbans` (`By`, `cID`, `Reason`, `ip`, `Serial`) VALUES ('%d', '%d', '%s', '%s', '%s')", cInfo[playerid][SQLID],cInfo[params[1]][SQLID],reason,plrIP,PSerial);
    mysql_query(_query);
    
	TogglePlayerControllable(params[1], false);
	new time[3], date[3], lastseen[64];
	getdate(date[2], date[1], date[0]);
	gettime(time[0], time[1], time[2]);
	format(lastseen, 64, "%d/%d/%d %d:%d:%d", date[0], date[1], date[2], time[0], time[1], time[2]);
	format(_query, sizeof(_query), "INSERT INTO `adminlogs`(`cID`, `By`, `Reason`, `Date`, `Type`) VALUES ('%d', '%d', '%s', '%s', '3')", cInfo[params[1]][SQLID], cInfo[playerid][SQLID], reason, lastseen);
	mysql_query(_query);
	BanPlayer(params[1], reason, GetName(playerid));
	cInfo[params[1]][cAdminRecordCount]++;
    return 1;
}

CMD:toggleserver(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 5) return NoAdmin(playerid);
	if(ServerLocked == false) {
    	if(sscanf(params,"s[128]", params[0]))
        	return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /toggleserver (reason for lockdown)");

		SendClientMessageToAll(COLOR_RED, "Server has been toggled (Locked)");
		ServerLocked = true;
		format(ServerLockReason, 128, params[0]);
	 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		{
		    if(!IsPlayerConnected(i)) continue;
		    if(pInfo[i][AdminLevel] <= 0) {
				SavePlayer(i, GetName(i));
				SaveCharacter(i, GetName(i));
				SavePlayer(i, cInfo[i][cCreator]);
				Logged[i] = Logged[i] ? false : true;
				KickEx(i);
		    }
		}
	}
	else
 		ServerLocked = false, SendClientMessageToAll(COLOR_RED, "Server has been toggled (Unlocked)");

    return 1;
}

CMD:unban(playerid, params[])
{
    new nome[24];
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	
	new account[25];
    if(sscanf(params,"s[25]", account))
        return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /unban (account name)");
        
    format(_query, sizeof(_query), "SELECT * FROM `players` WHERE `Name` = '%s' and `Banned` ='1'", account);
    mysql_query(_query);
    mysql_store_result();
    
    if(!mysql_num_rows()) return CPF(playerid, -1, ""COL_RED"Syntax Error:"COL_WHITE" Player \"%s\" either cannot be found or is not banned.", account), mysql_free_result();
    mysql_free_result();
    
    format(_query, sizeof(_query), "UPDATE `players` SET `Banned`='0' WHERE `Name` = '%s'", account);
    mysql_query(_query);
    
    format(_query, sizeof(_query), "SELECT * FROM `serialbans` WHERE (`cID` = '%s')", account);
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows() > 0)
 	{
   		format(_query,sizeof(_query),"DELETE FROM `serialbans` WHERE (`cID` = '%s')", nome);
		mysql_query(_query);
  		mysql_free_result();
  		return 1;
    }
    
    format(gString, sizeof gString, "{33aa33}Success:"COL_WHITE"Administrator %s has unbanned %s.", GetName(playerid), account);
    SendAdminMessage(-1, gString);
    return 1;
}

CMD:family(playerid, params[])
{
	new fac = cInfo[playerid][cFaction];
	if(cInfo[playerid][cFaction] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a family.");
	if(fInfo[fac][Chat] == 0 && cInfo[playerid][cLeader] != fac) return CPF(playerid, COLOR_GRAY, "The faction chat is currently disabled.");
	new returnMsg[156];
    if(sscanf(params,"s[156]", returnMsg))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /f(amily) (message)");

	format(gString, sizeof gString, "(( %s %s: %s ))", GetPlayerRank(playerid), GetPlayerNameEx(playerid), returnMsg);

	switch(fInfo[cInfo[playerid][cFaction]][Type])
	{
	    case 1: SendFMessage(cInfo[playerid][cFaction], 0x8D8DFF00, gString);
	    case 2: SendFMessage(cInfo[playerid][cFaction], 0xFF8282AA, gString);
	    default: SendFMessage(cInfo[playerid][cFaction], 0x7BDDA5AA, gString);
	}
	return 1;
}

CMD:fon(playerid, params[])
{
	new gMembers[516], count;
	if(cInfo[playerid][cFaction] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a family.");
 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++) {
	    if(!IsPlayerConnected(i)) continue;
	    if(cInfo[i][cFaction] != cInfo[playerid][cFaction]) continue;
		if(cInfo[i][cLeader] == cInfo[playerid][cFaction]) {
			format(gString, sizeof gString, ""COL_RED"[Leader] "COL_WHITE"(%d) %s\n", i, GetPlayerNameEx(i));
			strcat(gMembers, gString);
		}
		else {
			format(gString, sizeof gString, ""COL_WHITE"(%d) %s\n", i, GetPlayerNameEx(i));
			strcat(gMembers, gString);
		}
	    count++;
	}
	format(gString, sizeof gString, "ON: %s (%d/%d)", fInfo[cInfo[playerid][cFaction]][Name], count, fInfo[cInfo[playerid][cFaction]][TotalMembers]);
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, gString, gMembers, "Okay", "");
	return 1;
}

CMD:factionranks(playerid, params[])
{
	new gRanks[516], fid = cInfo[playerid][cFaction];
    if(cInfo[playerid][cFaction] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a family.");
    format(_query, sizeof(_query), "SELECT * FROM `factions` WHERE `ID` = '%d'", fid);
    mysql_query(_query);
    if(mysql_num_rows())
    {
		format(gString, sizeof gString, ""COL_WHITE"Rank 1: %s\n", fInfo[fid][Rank1]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 2: %s\n", fInfo[fid][Rank2]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 3: %s\n", fInfo[fid][Rank3]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 4: %s\n", fInfo[fid][Rank4]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 5: %s\n", fInfo[fid][Rank5]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 6: %s\n", fInfo[fid][Rank6]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 7: %s\n", fInfo[fid][Rank7]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 8: %s\n", fInfo[fid][Rank8]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 9: %s\n", fInfo[fid][Rank9]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 10: %s\n", fInfo[fid][Rank10]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 11: %s\n", fInfo[fid][Rank11]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 12: %s\n", fInfo[fid][Rank12]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 13: %s\n", fInfo[fid][Rank13]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 14: %s\n", fInfo[fid][Rank14]), strcat(gRanks, gString);
		format(gString, sizeof gString, ""COL_WHITE"Rank 15: %s\n", fInfo[fid][Rank15]), strcat(gRanks, gString);

		format(gString, sizeof gString, "{33aa33}Faction %d Ranks", cInfo[playerid][cFaction]);
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, gString, gRanks, "Okay", "");
    }
    else CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"Could not gather faction database.");
	return 1;
}

CMD:gon(playerid, params[])
{
	new gMembers[516], count;
	if(cInfo[playerid][cOOCGroup] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a group.");
 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++) {
	    if(!IsPlayerConnected(i)) continue;
	    if(cInfo[i][cOOCGroup] != cInfo[playerid][cOOCGroup]) continue;
		if(cInfo[i][cOLeader] == cInfo[playerid][cOOCGroup]) {
			format(gString, sizeof gString, ""COL_RED"(%d) %s\n", i, GetPlayerNameEx(i));
			strcat(gMembers, gString);
		}
		else {
			format(gString, sizeof gString, ""COL_WHITE"(%d) %s\n", i, GetPlayerNameEx(i));
			strcat(gMembers, gString);
		}
	    count++;
	}
	format(gString, sizeof gString, "\n"COL_WHITE"Total Online: %d", count);
	strcat(gMembers, gString);
	format(gString, sizeof gString, ""COL_WHITE"Group %d Online Members", cInfo[playerid][cOOCGroup]);
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, gString, gMembers, "Okay", "");
	return 1;
}

CMD:group(playerid, params[])
{
	new group = cInfo[playerid][cOOCGroup];
	if(cInfo[playerid][cOOCGroup] <= 0) return CPF(playerid, COLOR_GRAY, "You are not apart of a group.");
	if(gInfo[group][Chat] == 0 && cInfo[playerid][cOLeader] != group) return CPF(playerid, COLOR_GRAY, "The group chat is currently disabled.");
	new returnMsg[156];
    if(sscanf(params,"s[156]", returnMsg))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /g(roup) (message)");

	format(gString, sizeof gString, ""COL_RED"(( [GROUP] %s: %s ))", GetPlayerNameEx(playerid), returnMsg);
	SendGroupMessage(cInfo[playerid][cOOCGroup], 0x7BDDA5AA, gString);
	return 1;
}

CMD:dice(playerid, params[])
{
	if(!HaveDice[playerid])
	    return CPF(playerid, COLOR_GRAY, "You don't have a dice.");

	new randdice = RandomEx(1, 7);
	format(gString, sizeof(gString), "* %s rolls the dice and it lands on %d.", GetPlayerNameEx(playerid), randdice);
	ProxDetector(10.0, playerid, gString, -1, -1, -1, -1, -1);
	return 1;
}

CMD:coin(playerid, params[])
{
	format(gString, sizeof(gString), "* %s flips the coin and it lands on %s.", GetPlayerNameEx(playerid), RandomEx(0, 2) ? ("Heads") : ("Tails"));
	ProxDetector(10.0, playerid, gString, -1, -1, -1, -1, -1);
	return 1;
}

CMD:d(playerid, params[])
{
	if(fInfo[cInfo[playerid][cFaction]][Type] == 1 || fInfo[cInfo[playerid][cFaction]][Type] == 2)
	{
	    new ff[12];
		switch(fInfo[cInfo[playerid][cFaction]][Type])
		{
			case 1: ff = "LAW";
			case 2: ff = "EMS";
			default: ff = "NONE";
		}
		new achat[144];
		if(sscanf(params, "s[156]", params[0])) return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /d(epartment) (message)");
		format(achat, sizeof(achat), "** [%s] %s %s: %s **", ff, GetPlayerRank(playerid), GetPlayerNameEx(playerid), params[0]);
		SendFactionMessage(1,0xFF8282AA, achat);
		SendFactionMessage(2,0xFF8282AA, achat);
		for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		{
			if(i == playerid) continue;
			if(IsPlayerInRangeOfPoint(i, 8.0, xa, ya, za)) {
				CPF(i, COLOR_FADE1, "%s says (Radio): %s", GetPlayerNameEx(playerid), params[0]);
			}
		}
	}
	else NoAdmin(playerid);
	return 1;
}

CMD:radio(playerid, params[])
{
	if(!HaveRadio(playerid)) return CPF(playerid, COLOR_GRAY, "You don't have a radio device.");
	if(cInfo[playerid][cRSlot] <= 0) return CPF(playerid, COLOR_GRAY, "You haven't set your radio slot yet, /setslot");
	new ReturnMsg[156];
    if(sscanf(params,"s[156]", ReturnMsg))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /r(adio) (message)");

	new slot = cInfo[playerid][cRSlot];
	if(cInfo[playerid][cRadio][slot] == 0) return CPF(playerid, COLOR_GRAY, "You haven't set a channel to this slot, /setchannel");
	CPF(playerid, -1, "{FFE96E}[C: %d, S: %d] %s: %s", cInfo[playerid][cRadio][slot], cInfo[playerid][cRSlot], GetPlayerNameEx(playerid), ReturnMsg);
	SendRadioMessage(playerid, cInfo[playerid][cRadio][slot], 0xFFE96E00, ReturnMsg);
	GetPlayerPos(playerid, xa, ya, za);
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(i == playerid) continue;
		if(IsPlayerInRangeOfPoint(i, 8.0, xa, ya, za)) {
			CPF(i, COLOR_FADE1, "%s says (Radio): %s", GetPlayerNameEx(playerid), ReturnMsg);
		}
	}
	return 1;
}

CMD:setchannel(playerid, params[])
{
	new fac = cInfo[playerid][cFaction];
	if(!HaveRadio(playerid)) return CPF(playerid, COLOR_GRAY, "You don't have a radio device.");
	new channel, slot;
    if(sscanf(params,"dd", channel, slot))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setchannel (channel) (slot 1-3)");

	if(slot > 3 || slot < 1)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setchannel (channel) (slot 1-3)");

	if(channel == 911 && fInfo[fac][Type] != 1) return CPF(playerid, COLOR_GRAY, "Inserted channel is restricted for the LSPD."), 1;
	if(channel == 912 && fInfo[fac][Type] != 2) return CPF(playerid, COLOR_GRAY, "Inserted channel is restricted for the LSFD."), 1;
	if(channel < 1 || channel > 99999) return CPF(playerid, COLOR_GRAY, "Inserted channel is out of zone (1-99999)");
	if(cInfo[playerid][cRadio][slot] == channel) return CPF(playerid, COLOR_GRAY, "You are already in this channel."), 1;

	cInfo[playerid][cRadio][slot] = channel;
	format(gString, sizeof gString, "{33aa33}Success:"COL_WHITE" Your radio station has been set to %d under slot %d.", channel, slot);
	SendClientMessage(playerid, -1, gString);
	return 1;
}

CMD:setslot(playerid, params[])
{
	if(!HaveRadio(playerid)) return CPF(playerid, COLOR_GRAY, "You don't have a radio device.");
    if(sscanf(params,"i", params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setslot (slot 1-3)");

	if(params[1] >= 4 || params [1] <= 0)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setslot (slot 1-3)");

	cInfo[playerid][cRSlot] = params[1];
	CPF(playerid, -1, "{33aa33}Success:"COL_WHITE" Your radio slot has been set to %d.", params[1]);
	return 1;
}

CMD:siren(playerid, params[])
{
    if(!IsACop(playerid)) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
    new Float:dx, Float:dy, Float:dz;
    new vehicleid = GetPlayerVehicleID(playerid);
    if(vInfo[vehicleid][Faction] != cInfo[playerid][cFaction]) return CPF(playerid, COLOR_GRAY, "You can't place a siren on this vehicle.");
	if(GetVehicleModel(vehicleid) == 560)
    {
        if(siren[vehicleid] == false)
        {
            GetPlayerPos(playerid, dx, dy, dz);
            light[vehicleid] = CreateObject(18646,dx, dy, dz, 0.0, 0.0, 96.0);
            AttachObjectToVehicle(light[vehicleid], vehicleid, -0.35644531250, 0.0388183593, 0.863788605, 0.0, 0.0, 0.0);
            siren[vehicleid] = true;
		}
		else
	    	DestroyObject(light[vehicleid]), siren[vehicleid] = false;

		return 1;
    }
    else if(GetVehicleModel(vehicleid) == 415)
    {
        if(siren[vehicleid] == false)
        {
            GetPlayerPos(playerid, dx, dy, dz);
            light[vehicleid] = CreateObject(18646,dx, dy, dz, 0.0, 0.0, 96.0);
            AttachObjectToVehicle(light[vehicleid], vehicleid, -0.290039062, -0.284179688, 0.631957054, 0.0, 0.0, 0.0);
            siren[vehicleid] = true;
		}
		else
	    	DestroyObject(light[vehicleid]), siren[vehicleid] = false;

		return 1;
    }
    else if(GetVehicleModel(vehicleid) == 426)
    {
	    if(!siren[vehicleid])
	    {
            GetPlayerPos(playerid, dx, dy, dz);
            light[vehicleid] = CreateObject(18646,dx, dy, dz, 0.0, 0.0, 96.0);
            AttachObjectToVehicle(light[vehicleid], vehicleid, -0.455505371, -0.143066406, 0.861475945, 0.0, 0.0, 0.0);
            siren[vehicleid] = true;
	    }
		else
	    	DestroyObject(light[vehicleid]), siren[vehicleid] = false;

		return 1;
    }
    CPF(playerid, COLOR_RED, "Siren canno't be placed on this vehicle.");
    return 1;
}

CMD:pay(playerid, params[])
{
	if(cInfo[playerid][cTotalHours] <= 0) return CPF(playerid, COLOR_GRAY, "You have to play atleast 1 hour to use this command.");
    if(sscanf(params,"ud", params[1], params[2]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /pay (playerid/partofname) (amount)");

	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[1] == playerid) return true;
	if(!IsPlayerInRangeOfPlayer(playerid, params[1], 2.5))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	if(cInfo[playerid][cMoney] < params[2])
	    return CPF(playerid, COLOR_GRAY, "You don't have enough money.");

	if(params[2] <= 0)
	    return CPF(playerid, COLOR_GRAY, "Invalid amount.");

	cInfo[playerid][cMoney] -= params[2];
	cInfo[params[1]][cMoney] += params[2];
	CPF(playerid, COLOR_GRAY, "  You have sent $%d to %s.", params[2], GetPlayerNameEx(params[1]));
	CPF(params[1], COLOR_GRAY, "  You have recieved $%d from %s.", params[2], GetPlayerNameEx(playerid));
	PlayerPlaySound(playerid, 1052, 0, 0, 0);
	format(gString, sizeof(gString), "* %s takes out some cash, and hands it to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(params[1]));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:garbage(playerid, params[])
{
    new action[32];
    if(GARBAGE_MAN_JOB != cInfo[playerid][cJob])
            return NoAdmin(playerid);

    if(sscanf(params, "s[32]", action))
    {
        CPF(playerid, COLOR_GRAY, "Garbage Man");
        SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /garbage (option)");
        SendClientMessage(playerid, -1, "load, drop, empty, stopwork");
        return 1;
    }
    else if(!strcmp("load", action, true))
    {
        new vehicleid, Float:Pos[3];
        if(!CarryingBag[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You are not carrying a trash bag.");
        vehicleid = GetClosestVehicleForPlayer(playerid);
        GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
        new Float:Distance = GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]);
        if(Distance == 5.0)
                return SendClientMessage(playerid, COLOR_GRAY, "Either there is no vehicle in range or this vehicle is not a job vehicle.");
        if(vInfo[vehicleid][Job] != GARBAGE_MAN_JOB)
                return SendClientMessage(playerid, COLOR_GRAY, "You are not able to load trash bags on none-job vehicle.");
        if(vBags[vehicleid] == MAX_VEHICLE_BAGS)
                return SendClientMessage(playerid, COLOR_GRAY, "The vehicle has reached the maximum capacity of trash bags.");

        ApplyAnimation(playerid, "carry", "putdwn", 1, 0, 1, 1, 0, 1000);
        ApplyAnimation(playerid, "carry", "putdwn", 1, 0, 1, 1, 0, 1000);
        RemovePlayerAttachedObject(playerid, 9);
        CarryingBag[playerid] = false;
        vBags[vehicleid]++;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        ClearAnimations(playerid);
		format(gString, sizeof(gString), "* %s loads a trashbag into the Trashmaster.", GetPlayerNameEx(playerid), params[0]);
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        format(szMessage, sizeof(szMessage), "There are %d/%d bags in the vehicle.", vBags[vehicleid], MAX_VEHICLE_BAGS);
        SendClientMessage(playerid, COLOR_GREEN, szMessage);
    }
    else if(!strcmp("drop", action, true))
    {
        if(!CarryingBag[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You are not carrying a trash bag.");
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        RemovePlayerAttachedObject(playerid, 9);
        CarryingBag[playerid] = false;
    }
    else if(!strcmp("stopwork", action, true))
    {
        if(Mission[playerid])
		{
        	StopGarbageMission(playerid);
			CPF(playerid, COLOR_GRAY, "You have stopped working.");
		}
	}
    else if(!strcmp("empty", action, true))
    {
        new vehicleid;
        if(!IsPlayerInAnyVehicle(playerid))
                return SendClientMessage(playerid, -1, "You cannot use this command while being on foot.");
        vehicleid = GetPlayerVehicleID(playerid);
        new Float:Distance = GetPlayerDistanceFromPoint(playerid, GARBAGE_X, GARBAGE_Y, GARBAGE_Z);
        if(Distance > 5.0)
                return SendClientMessage(playerid, COLOR_GRAY, "You are far away from the disposal area.");
        if(vInfo[vehicleid][Job] != GARBAGE_MAN_JOB)
                return SendClientMessage(playerid, COLOR_GRAY, "This is not a job vehicle.");
        if(!vBags[vehicleid])
                return SendClientMessage(playerid, COLOR_GRAY, "This vehicle does not possess any trash bags to dispose.");
        if(Mission[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "Please complete your mission or use \"/garbage stopwork\" before you enter the disposal area.");

        format(szMessage, sizeof(szMessage), "You have collected %d/%d trash-bags and an amount of $%d was added to your paycheck.", vBags[vehicleid], MAX_VEHICLE_BAGS, MONEY_PER_BAG * vBags[vehicleid]);
        SendClientMessage(playerid, -1, szMessage);
        cInfo[playerid][cPaycheck] += MONEY_PER_BAG * vBags[vehicleid];
        vBags[vehicleid] = 0;
    }
    return 1;
}

CMD:cargo(playerid, params[])
{
    new action[32];
    if(DELIVERY_MAN_JOB != cInfo[playerid][cJob])
        return NoAdmin(playerid);

    if(sscanf(params, "s[32]", action))
    {
        CPF(playerid, COLOR_GRAY, "Delivery Man");
        SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /cargo (option)");
        SendClientMessage(playerid, -1, "load, unload, drop, stopwork");
        return 1;
    }
    else if(!strcmp("load", action, true))
    {
		if(LoadingCargo[playerid] == 1)
		        return SendClientMessage(playerid, COLOR_GRAY, "Please wait 2 seconds between each operation.");

        new vehicleid, Float:Pos[3];
        if(!CarryingCrate[playerid])
            return SendClientMessage(playerid, COLOR_GRAY, "You don't have a crate in hands.");

        vehicleid = GetClosestVehicleForPlayer(playerid);
        GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
        new Float:Distance = GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]);

        if(Distance > 5.0)
                return SendClientMessage(playerid, COLOR_GRAY, "Either there is no vehicle in range or this vehicle is not a job vehicle.");
        if(vInfo[vehicleid][Job] != DELIVERY_MAN_JOB)
                return SendClientMessage(playerid, COLOR_GRAY, "You are not able to load trash bags on none-job vehicle.");
        if(vBags[vehicleid] == MAX_VEHICLE_CRATES)
                return SendClientMessage(playerid, COLOR_GRAY, "The vehicle has reached the maximum capacity of crates.");

        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        ClearAnimations(playerid);
        ApplyAnimation(playerid, "carry", "putdwn", 1, 0, 1, 1, 0, 1000);
        ApplyAnimation(playerid, "carry", "putdwn", 1, 0, 1, 1, 0, 1000);
        RemovePlayerAttachedObject(playerid, 9);
        CarryingCrate[playerid] = false;
        vCrates[vehicleid]++;
		format(gString, sizeof(gString), "* %s loads a cargo into the Burrito.", GetPlayerNameEx(playerid), params[0]);
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        format(szMessage, sizeof(szMessage), "There are %d/%d crates in the Burrito.", vCrates[vehicleid], MAX_VEHICLE_CRATES);
        SendClientMessage(playerid, 0x33AA33FF, szMessage);
		SetTimerEx("CargoTimer", 2000, false, "i", playerid);
		LoadingCargo[playerid] = 1;
    }
    else if(!strcmp("unload", action, true))
    {
        new vehicleid, Float:Pos[3];
        if(CarryingCrate[playerid])
            return SendClientMessage(playerid, COLOR_GRAY, "You alredy have a crate.");
        vehicleid = GetClosestVehicleForPlayer(playerid);
        GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
        new Float:Distance = GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]);
        if(Distance > 5.0)
                return SendClientMessage(playerid, COLOR_GRAY, "Either there is no vehicle in range or this vehicle is not a job vehicle.");
        if(vInfo[vehicleid][Job] != DELIVERY_MAN_JOB)
                return SendClientMessage(playerid, COLOR_GRAY, "You are not able to load trash bags on none-job vehicle.");
        if(vBags[vehicleid] == MAX_VEHICLE_CRATES)
                return SendClientMessage(playerid, COLOR_GRAY, "The vehicle has no crates to unload.");
		if(vCrates[vehicleid] <= 0) return SendClientMessage(playerid, COLOR_GRAY, "There are no more crates in this truck.");

        ClearAnimations(playerid);
        ApplyAnimation(playerid, "carry", "liftup", 1, 0, 1, 1, 0, 1000);
        ApplyAnimation(playerid, "carry", "liftup", 1, 0, 1, 1, 0, 1000);
        SetPlayerAttachedObject( playerid, 9, 1271, 1, 0.3, 0.520760, 0.0, 0.000000, 84.217391, 0.000000, 1.000000, 1.000000, 1.000000 );
        CarryingCrate[playerid] = true;
        vCrates[vehicleid]--;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
        GameTextForPlayer(playerid, "~g~Crate has been unloaded!", 3000, 6);
        format(szMessage, sizeof(szMessage), "There are %d/%d crates in the vehicle.", vCrates[vehicleid], MAX_VEHICLE_CRATES);
        SendClientMessage(playerid, 0x33AA33FF, szMessage);
    }
    else if(!strcmp("drop", action, true))
    {
        if(CarryingCrate[playerid])
        {
		    RemovePlayerAttachedObject(playerid, 9);
		    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            Crates--;
            CarryingCrate[playerid] = false;
			format(gString, sizeof(gString), "* %s drops the crate on the ground.", GetPlayerNameEx(playerid));
			ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		}
    }
    else if(!strcmp("stopwork", action, true))
    {
        if(Mission[playerid])
        {
            DestroyDynamicCP(Mission_CP[playerid]);
            RemovePlayerMapIcon( playerid, 1 );
            PlayerTextDrawHide(playerid, TD_BIZ_NAME[playerid]);
            PlayerTextDrawHide(playerid, TD_BIZ_ADRESS[playerid]);
            PlayerTextDrawHide(playerid, TD_CRATES[playerid]);
            Mission[playerid] = false;
            PlayerCrates[playerid] = 0;
            CPF(playerid, COLOR_GRAY, "You have stopped working.");
        }
        if(CarryingCrate[playerid])
        {
		    RemovePlayerAttachedObject(playerid, 9);
		    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            Crates -= PlayerCrates[playerid];
            CarryingCrate[playerid] = false;
		}
    }
    return 1;
}

CMD:unarrest(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
    if(sscanf(params,"u", params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /unarrest (playerid/partofname)");

    if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
    cInfo[params[1]][cPrison] = 0;
    cInfo[params[1]][cPrisonTime] = 0;
    cInfo[params[1]][cPrisonCell] = 0;
	format(gString, sizeof(gString), "ADMIN: Admin %s has just released %s from police jail.", GetName(playerid), GetName(params[1]));
	SendClientMessageToAll(COLOR_RED, gString);
	SpawnPlayer(params[1]);
	SetPlayerVirtualWorld(params[1], 0);
	return 1;
}

CMD:arrest(playerid, params[])
{
	if(!IsACop(playerid)) return NoAdmin(playerid);
	if(!OnDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on duty.");
    if(sscanf(params,"ud", params[1], params[2]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /arrest (playerid/partofname) (time in minutes)");

	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[1] == playerid) return true;
	if(!IsPlayerInRangeOfPlayer(playerid, params[1], 2.5))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	if(IsPlayerInRangeOfPoint(playerid, 2.5, 215.6489,113.7221,999.0156))
	{
	    format(gString, sizeof(gString), "[Jail] %s %s has just arrested %s for %d minutes.", GetPlayerRank(playerid), GetName(playerid), GetName(params[1]), params[2]);
	    SendClientMessageToAll(COLOR_RED, gString);
	    cInfo[params[1]][cPrison] = 1;
	    cInfo[params[1]][cPrisonTime] = params[2] * 60;
	    cInfo[params[1]][cPrisonCell] = 1;
	    SetPlayerPos(params[1], 216.0588,111.6941,999.0156);
        format(g_szMessage, sizeof(g_szMessage), "UPDATE `charges` SET `outstanding` = '0' WHERE `id` = '%d'", cInfo[params[1]][SQLID]);
        mysql_query(g_szMessage);
	    return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2.5, 219.4612,114.0273,999.0156))
	{
	    format(gString, sizeof(gString), "[Jail] %s %s has just arrested %s for %d minutes.", GetPlayerRank(playerid), GetName(playerid), GetName(params[1]), params[2]);
	    SendClientMessageToAll(COLOR_RED, gString);
	    cInfo[params[1]][cPrison] = 1;
	    cInfo[params[1]][cPrisonTime] = params[2] * 60;
	    cInfo[params[1]][cPrisonCell] = 2;
	    SetPlayerPos(params[1], 220.0588,111.6941,999.0156);
        format(g_szMessage, sizeof(g_szMessage), "UPDATE `charges` SET `outstanding` = '0' WHERE `id` = '%d'", cInfo[params[1]][SQLID]);
        mysql_query(g_szMessage);
	    return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2.5, 223.5392,114.1613,999.0156))
	{
	    format(gString, sizeof(gString), "[Jail] %s %s has just arrested %s for %d minutes.", GetPlayerRank(playerid), GetName(playerid), GetName(params[1]), params[2]);
	    SendClientMessageToAll(COLOR_RED, gString);
	    cInfo[params[1]][cPrison] = 1;
	    cInfo[params[1]][cPrisonTime] = params[2] * 60;
	    cInfo[params[1]][cPrisonCell] = 3;
	    SetPlayerPos(params[1], 224.0047,111.1394,999.0156);
        format(g_szMessage, sizeof(g_szMessage), "UPDATE `charges` SET `outstanding` = '0' WHERE `id` = '%d'", cInfo[params[1]][SQLID]);
        mysql_query(g_szMessage);
	    return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 2.5, 227.4574,114.0844,999.0156))
	{
	    format(gString, sizeof(gString), "[Jail] %s %s has just arrested %s for %d minutes.", GetPlayerRank(playerid), GetName(playerid), GetName(params[1]), params[2]);
	    SendClientMessageToAll(COLOR_RED, gString);
	    cInfo[params[1]][cPrison] = 1;
	    cInfo[params[1]][cPrisonTime] = params[2] * 60;
	    cInfo[params[1]][cPrisonCell] = 4;
	    SetPlayerPos(params[1], 228.0047,110.8394,999.0156);
        format(g_szMessage, sizeof(g_szMessage), "UPDATE `charges` SET `outstanding` = '0' WHERE `id` = '%d'", cInfo[params[1]][SQLID]);
        mysql_query(g_szMessage);
	    return 1;
	}
	CPF(playerid, COLOR_GRAY, "You are not near the prison cells.");
	return 1;
}

CMD:frisk(playerid, params[])
{
    if (sscanf(params, "u", params[1]))
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /frisk (playerid/partofname)");

	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[1] == playerid) return true;
	if(!IsPlayerInRangeOfPlayer(playerid, params[1], 2.5))
	    return CPF(playerid, COLOR_GRAY, "Given player ID is not in range.");

	CPF(playerid, COLOR_GRAY, "Frisk offer has been sent to %s, please wait for him to respond.", GetName(params[1]));
	CPF(params[1], COLOR_RED, "%s wants to frisk you, \"/acceptfrisk\" to accept or \"/denyfrisk\" to deny!", GetName(playerid));
	FriskOffer[params[1]] = playerid;
    return 1;
}

CMD:denyfrisk(playerid, params[])
{
	if(FriskOffer[playerid] < 0)
	    return CPF(playerid, COLOR_GRAY, "You don't have pending frisk offers.");

	CPF(playerid, COLOR_RED, "You have declined the frisk offer.");
	CPF(FriskOffer[playerid], COLOR_RED, "%s has declined the frisk offer.", GetName(playerid));
	FriskOffer[playerid] = -1;
	return 1;
}

CMD:acceptfrisk(playerid, params[])
{
	if(FriskOffer[playerid] < 0)
	    return CPF(playerid, COLOR_GRAY, "You don't have pending frisk offers.");

    new aweapons[13][2], toAdd[1024];
    format(gString, sizeof gString, "{77d830}[LEGAL] "COL_WHITE"ID Card (%s)\n", GetName(playerid));
    strcat(toAdd, gString);
    if(cInfo[playerid][cPhone] != 0)
	{
		format(gString, sizeof gString, "{77d830}[LEGAL] "COL_WHITE"Cellphone (%d)\n", cInfo[playerid][cPhone]);
	    strcat(toAdd, gString);
    }
	for (new i = 0; i < 13; i++)
	{
	    GetPlayerWeaponData(playerid, i, aweapons[i][0], aweapons[i][1]);
		if(aweapons[i][0] > 0)
		{
		    format(gString, sizeof gString, "{d83030}[ILLEGAL] "COL_WHITE"%s (Ammo: %d)\n", WeaponNames[aweapons[i][0]], aweapons[i][1]);
		    strcat(toAdd, gString);
		}
		else continue;
	}
	new titleString[64];
	format(titleString, 64, "Frisk [%s]", GetName(playerid));
	ShowPlayerDialog(FriskOffer[playerid], 0, DIALOG_STYLE_MSGBOX, titleString, toAdd, "Close", "");
	CPF(playerid, 0x33AA33FF, "You have accepted the frisk offer.");
	CPF(FriskOffer[playerid], 0x33AA33FF, "%s has accepted your frisk offer.", GetName(playerid));
	FriskOffer[playerid] = -1;
	return 1;
}

CMD:my(playerid, params[])
{
    if (sscanf(params, "s[44]", params))
    {
        SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /my (option)");
        CPF(playerid, -1, "weapons, houses, bizzes");
        return 1;
    }
    if(!strcmp(params, "weapons", true, 7))
    {
        CPF(playerid, 0x33aa33FF, "My Weapons:");
        new aweapons[13][2], count = 0;
		for (new i = 0; i < 13; i++)
		{
		    GetPlayerWeaponData(playerid, i, aweapons[i][0], aweapons[i][1]);
			if(aweapons[i][0] > 0)
			{
			    count++;
				CPF(playerid, COLOR_GRAY, "%s (Ammo: %d)", WeaponNames[aweapons[i][0]], aweapons[i][1]);
			}
			else continue;
		}
		if(count <= 0) CPF(playerid, COLOR_GRAY, "You have no weapons.");
    }
    else if(!strcmp(params, "houses", true, 6))
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
    else if(!strcmp(params, "bizzes", true, 6))
	{
	    new count = 0;
	    CPF(playerid, 0x33aa33FF, "My Businesses:");
	 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
	 	{
	 	    if(bInfo[i][ID] <= 0) continue;
			if(bInfo[i][Owner] != cInfo[playerid][SQLID]) continue;
			count++;
			CPF(playerid, COLOR_GRAY, "%d. Name: [%s], Address: [%s], Fee: [$%d], Bank: [$%d]", count, bInfo[i][Name], bInfo[i][Address], bInfo[i][Fee], bInfo[i][Bank]);
		}
		if(count <= 0) CPF(playerid, COLOR_GRAY, "You have no businesses.");
	}
	return 1;
}

CMD:take(playerid, params[])
{
	if(cInfo[playerid][cFaction] <= 0) return NoAdmin(playerid);
	new targetid = strval ( params ), aweapons[13][2], count = 0, Float:p[3];
    if (sscanf(params, "s[44]u", params, targetid))
    {
        SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /take (option) (playerid/partofname)");
        CPF(playerid, -1, "weapons");
        return 1;
    }
	GetPlayerPos(targetid, p[0], p[1], p[2]);
	if(!IsPlayerInRangeOfPoint(targetid, 3.0, p[0], p[1], p[2])) return CPF(playerid, COLOR_GRAY, "Given playerid/partofname is not in range.");
    if(!strcmp(params, "weapons", true, 7))
    {
        if(fInfo[cInfo[playerid][cFaction]][Type] != 1) return NoAdmin(playerid);
		for (new i = 0; i < 13; i++)
		{
		    GetPlayerWeaponData(targetid, i, aweapons[i][0], aweapons[i][1]);
			if(aweapons[i][0] > 0)
			{
				count++;
				RemovePlayerWeapon(targetid, aweapons[i][0]);
			}
			else continue;
		}
		if(count != 0)
		{
		    CPF(playerid, -1, "You have taken %s weapons.", GetName(targetid));
		    CPF(targetid, -1, "Officer %s has taken your weapons.", GetName(playerid));
		}
		else SendClientMessage(playerid, COLOR_GRAY, "Given playerid/partofname has no weapons.");
	}
	return 1;
}

CMD:tazer(playerid, params[])
{
	if(!IsACop(playerid)) return NoAdmin(playerid);
	if(!OnDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on duty.");
	new string[128];
	if(TazerHolster[playerid] == 1)
	{
		GivePlayerWeaponEx(playerid, 23, 100);
		PlayerHasTazer[playerid] = 1;
		TazerHolster[playerid] = 0;
		format(string, sizeof(string), "* %s unholsters his/her tazer.", GetPlayerNameEx(playerid));
		ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else if(TazerHolster[playerid] == 0)
	{
		GivePlayerWeaponEx(playerid, 24, 100);
		PlayerHasTazer[playerid] = 0;
		TazerHolster[playerid] = 1;
		format(string, sizeof(string), "* %s holsters his/her tazer.", GetPlayerNameEx(playerid));
		ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}

CMD:cuff(playerid, params[])
{
	if(!IsACop(playerid)) return NoAdmin(playerid);
	if(!OnDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on duty.");
    if(sscanf(params,"u", params[1]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /cuff (playerid/partofname)");

	if(!IsPlayerConnected(params[1])) return Disconnected(playerid);
	if(params[1] == playerid) return true;
	if(!IsPlayerInRangeOfPlayer(playerid, params[1], 2.5))
	    return CPF(playerid, COLOR_GRAY, "Given playerid is not in range.");

	if(GetPlayerSpecialAction(params[1]) == SPECIAL_ACTION_NONE)
	{
	    SetPlayerAttachedObject(params[1], 0, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
	    SetPlayerSpecialAction(params[1], SPECIAL_ACTION_CUFFED);
	    CPF(playerid, -1, "You cuffed %s.", GetPlayerNameEx(params[1]));
	    CPF(params[1], -1, "%s %s has cuffed you.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
		Cuffed[playerid] = true;
	}
	else
	{
	    RemovePlayerAttachedObject(params[1], 0);
	    ClearAnimations(params[1]);
		SetPlayerSpecialAction(params[1], SPECIAL_ACTION_NONE);
	    CPF(playerid, -1, "You uncuffed %s.", GetPlayerNameEx(params[1]));
	    CPF(params[1], -1, "%s %s has uncuffed you.", GetPlayerRank(playerid), GetPlayerNameEx(playerid));
	    Cuffed[playerid] = false;
	}
	return 1;
}

CMD:megaphone(playerid, params[])
{
	if(!IsACop(playerid)) return NoAdmin(playerid);
	if(!OnDuty[playerid]) return CPF(playerid, COLOR_GRAY, "You are not on duty.");
    if(sscanf(params,"s[256]", params))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /m(egaphone) (message)");

	if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
	if(vInfo[GetPlayerVehicleID(playerid)][Faction] != cInfo[playerid][cFaction]) return CPF(playerid, COLOR_GRAY, "This vehicle does not have a megaphone.");
	format(gString, sizeof gString, ""COL_YELLOW"[%s(megaphone): %s]", GetPlayerNameEx(playerid), params);
	ProxDetector(25.0, playerid, gString, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW, COLOR_YELLOW);
	return 1;
}

CMD:getbizzid(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
	return CPF(playerid, -1, "Closest business ID: %d", GetBizID(playerid));
}

CMD:gethouseid(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
	return CPF(playerid, -1, "Closest house ID: %d", GetHouseID(playerid));
}

CMD:bizzlist(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
    CPF(playerid, -1, "{33aa33}________ TYPE LIST ________");
    CPF(playerid, COLOR_FADE2, "(1) 24/7, (2) Ammounation, (3) Gas Station, (4) Tool Shop");
    CPF(playerid, COLOR_FADE2, "(5) GYM, (6) Fastfood, (7) Club, (8) Bank, (9) Pay`N`Spray");
    CPF(playerid, COLOR_FADE2, "(10) Advertisement, (11) Liquor Bar, (12) Cellphone, (13) Clothing");
	return 1;
}

CMD:binteriors(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
    new helpstr[1600];
    for(new i = 0,j = sizeof(bInterior); i < j; i ++)
    {
        format(gString, sizeof(gString), "%d. %s (INT: %d)\n", i, bInterior[i][INT_NAME], bInterior[i][INT_ID]);
        strcat(helpstr, gString);
    }
    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "Business Interiors", helpstr, "CLOSE", "");
    return 1;
}

CMD:interiors(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
    new intPack[1024];
    for(new i = 0,j = sizeof(Interior); i < j; i ++)
    {
        format(gString, sizeof(gString), "%d. %s (INT: %d)\n", i, Interior[i][INT_NAME], Interior[i][INT_ID]);
        strcat(intPack, gString);
    }
    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "House Interiors", intPack, "CLOSE", "");
    return 1;
}

CMD:create_bizz(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	new price = strval ( params ),
			intid = strval ( params ), type = strval ( params );

    if(sscanf(params,"ddd", price, intid, type))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_bizz (price) (interior id /binteriors) (type /bizlist)");

	if(intid <= -1 || intid > 37 || price < 0)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_bizz (price) (interior id /binteriors) (type /bizlist)");

	if(type <= 0 || type >= 14)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_bizz (price) (interior id /binteriors) (type /bizlist)");

	CreateBizz(playerid, intid, price, type);
	return 1;
}

CMD:create_house(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	new price = strval ( params ),
			intid = strval ( params );

    if(sscanf(params,"dd", price, intid))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_house (price) (interior id /interiors)");

	if(intid < 0 || intid > 36 || price <= 0)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_house (price) (interior id /interiors)");

	CreateHouse(playerid, intid, price);
	return 1;
}

CMD:create_faction(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	new type = strval ( params );

    if(sscanf(params,"is[128]", type, params[1]))
	{
	    SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_faction (type) (name)");
	    CPF(playerid, -1, "Type 1: [Law], Type 2: [Medical], Type 3: [Legal Family], Type 4: [Illegal Family]");
	    return 1;
	}

	if(type <= 0 || type > 4)
	    return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /create_faction (name) (type)");

	CreateFaction(playerid, params[1], type);
	return 1;
}

CMD:delete_house(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	for(new i = 0; i < MAX_HOUSES; i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT]))
	    {
			format(gString, sizeof gString, ""COL_WHITE"Are you sure you want to delete house ID %02d?", i);
			ShowPlayerDialog(playerid, DELETE_HOUSE, DIALOG_STYLE_MSGBOX, "Confirmation", gString, "Yes", "No");
			break;
		}
 	}
	return 1;
}

CMD:delete_bizz(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	for(new i = 0; i < MAX_BIZZES; i++)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.5, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
	    {
			format(gString, sizeof gString, ""COL_WHITE"Are you sure you want to delete business ID %02d?", i);
			ShowPlayerDialog(playerid, DELETE_BIZZ, DIALOG_STYLE_MSGBOX, "Confirmation", gString, "Yes", "No");
			break;
		}
 	}
	return 1;
}

/*CMD:grouplist(playerid, params[])
{
	new toAdd[1024], count;
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	for(new i = 1;i <= MAX_GROUPS;i++)
	{
     	if(gInfo[i][ID] <= 0) continue;
	    format(gString, sizeof gString, ""COL_WHITE"[%d] Created on %s\n", i, gInfo[i][CreationDate]);
	    strcat(toAdd, gString);
	    count++;
	}
	if(count <= 0) return CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"There are no OOC groups.");
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Faction List", toAdd, "Close", "");
	return 1;
}

CMD:factionlist(playerid, params[])
{
	new toAdd[1024], count = 0, typetext[32], nametext[128];
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	for(new i = 1;i < MAX_FACTIONS;i++)
    {
        if(fInfo[i][ID] <= 0) continue;
		format(nametext, 128, fInfo[i][Name]);
 		count++;
	    switch(fInfo[i][Type])
	    {
	        case 1: typetext = "LAW";
	        case 2: typetext = "EMS";
	        case 3: typetext = "CRIME";
	        case 4: typetext = "FAMILY";
	    }
	    format(gString, sizeof gString, ""COL_WHITE"[%d] %s (%s)\n", i, nametext, typetext);
	    strcat(toAdd, gString);
	    count++;
	}
	if(count <= 0) return CPF(playerid, -1, ""COL_RED"Error: "COL_WHITE"There are no factions.");
	ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Faction List", toAdd, "Close", "");
	return 1;
}*/

CMD:pddown(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1564.8969,-1667.0015,28.3956)) // Roof
	{
	    SetPlayerPos(playerid, 215.4946,126.7358,1003.2188);
	    SetPlayerInterior(playerid, 10);
	    SetPlayerVirtualWorld(playerid, 3);
	    InInterior[playerid] = 3;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 215.4946,126.7358,1003.2188)) // Lobby
	{
	    SetPlayerPos(playerid, 1524.4851,-1677.9384,6.2188);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 0);
	    InInterior[playerid] = 0;

	}
	return 1;
}

CMD:pdup(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 215.4946,126.7358,1003.2188)) // Roof
	{
	    SetPlayerPos(playerid, 1564.8969,-1667.0015,28.3956);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 0);
	    InInterior[playerid] = 0;
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1524.4851,-1677.9384,6.2188)) // Lobby
	{
	    SetPlayerPos(playerid, 215.4946,126.7358,1003.2188);
	    SetPlayerInterior(playerid, 10);
	    SetPlayerVirtualWorld(playerid, 3);
	    InInterior[playerid] = 3;
	}
	return 1;
}

CMD:enter(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1144.9574,-1322.9579,13.5840) && cInfo[playerid][cFaction] == 2)
	{
	    SetPlayerPos(playerid, 17.5954,0.0282,999.0019);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 5);
	}
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
		if(hInfo[i][ID] > 0 && IsPlayerInRangeOfPoint(playerid, 1.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT]))
		{
		    if(hInfo[i][Locked] == 1)
		        return GameTextForPlayer(playerid, "~r~Door is locked", 3200, 6);

            Streamer_UpdateEx(playerid, hInfo[i][X_IN], hInfo[i][Y_IN], hInfo[i][Z_IN], hInfo[i][VirtualWorld], hInfo[i][INT]);
		    SetPlayerPos(playerid, hInfo[i][X_IN], hInfo[i][Y_IN], hInfo[i][Z_IN]);
		    SetPlayerInterior(playerid, hInfo[i][INT]);
		    SetPlayerVirtualWorld(playerid, hInfo[i][VirtualWorld]);
		    InHouse[playerid] = i;
		    if(HouseLights[InHouse[playerid]] == false)
		    {
		        CPF(playerid, COLOR_YELLOW, "House lights are currently off, type /lights to turn them on.");
		        TextDrawShowForPlayer(playerid, LightTD);
		    }
		    mysql_free_result();
		    SetPlayerFacingAngle(playerid, 0);
		    SetCameraBehindPlayer(playerid);
		    break;
		}
 	}
 	for(new i = 0,j = MAX_INTERIORS; i < j; i ++)
 	{
		if(iInfo[i][ID] > 0 && IsPlayerInRangeOfPoint(playerid, 1.5, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ]))
		{
		    Streamer_UpdateEx(playerid, iInfo[i][inX], iInfo[i][inY], iInfo[i][inZ], iInfo[i][ID], iInfo[i][InteriorID]);
	        SetPlayerPos(playerid, iInfo[i][inX], iInfo[i][inY], iInfo[i][inZ]);
	        SetPlayerInterior(playerid, iInfo[i][InteriorID]);
	        SetPlayerVirtualWorld(playerid, iInfo[i][ID]);
	        InInterior[playerid] = i;
		    mysql_free_result();
		    SetPlayerFacingAngle(playerid, 0);
		    SetCameraBehindPlayer(playerid);
		    TogglePlayerControllable(playerid, false);
		    SetTimerEx("Unfreeze", 1500, false, "i", playerid);
		    break;
		}
 	}
 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
 	{
 	    if(bInfo[i][ID] <= 0) continue;
 	    if(IsPlayerInRangeOfPoint(playerid, 6.0, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
 	    {
			switch(bInfo[i][Type])
			{
			    case 3, 10: return true;
			    case 9:
			    {
					if(bInfo[i][Products] <= 0)
			 			return GameTextForPlayer(playerid, "~r~Out of stock!", 3200, 1);

				    if(!IsPlayerInAnyVehicle(playerid))
				        return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");

				 	if(sscanf(params,"dd", params[1], params[2]))
				 		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /enter (color 1) (color 2) 0 - 255");

				 	if(params[1] > 255 || params[1] < 0 || params[2] > 255 || params[2] < 0) return CPF(playerid, COLOR_GRAY, "Selected vehicle colors are invalid (0-255)");
				 	payColor1[playerid] = params[1];
				 	payColor2[playerid] = params[2];
				    InBiz[playerid] = i;
				    SetPos(playerid, bInfo[i][X_IN], bInfo[i][Y_IN], bInfo[i][Z_IN]);
				    if(cInfo[playerid][SQLID] != bInfo[i][Owner]) cInfo[playerid][cMoney] -= bInfo[i][Fee], bInfo[InBiz[playerid]][Bank] += bInfo[i][Fee];
				    TogglePlayerControllable(playerid, false);
				    CPF(playerid, 0x33AA33FF, "You will moving out in 10 seconds.");
				    SetTimerEx("FixVehicle", 10*1000, false, "i", playerid);
				    cInfo[playerid][cMoney] -= bInfo[i][Fee];
				    SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.0);
				    SetCameraBehindPlayer(playerid);
				    break;
			    }
				default:
				{
					if(bInfo[i][Locked] == 1)
				        return GameTextForPlayer(playerid, "~r~door is locked", 3200, 6);

					if(bInfo[i][Fee] > 0 && cInfo[playerid][cMoney] < bInfo[i][Fee] && cInfo[playerid][SQLID] != bInfo[i][Owner])
						return GameTextForPlayer(playerid, "~r~You don't have money to enter!", 3200, 4);

					Streamer_UpdateEx(playerid, bInfo[i][X_IN], bInfo[i][Y_IN], bInfo[i][Z_IN], bInfo[i][ID], bInfo[i][INT]);
			        SetPlayerPos(playerid, bInfo[i][X_IN], bInfo[i][Y_IN], bInfo[i][Z_IN]);
			        SetPlayerInterior(playerid, bInfo[i][INT]);
			        SetPlayerVirtualWorld(playerid, bInfo[i][ID]);
			        InBiz[playerid] = i;
			        if(cInfo[playerid][SQLID] != bInfo[i][Owner]) cInfo[playerid][cMoney] -= bInfo[i][Fee], bInfo[InBiz[playerid]][Bank] += bInfo[i][Fee];
			        CPF(playerid, 0xff00deFF, "Business");
			        CPF(playerid, -1, "Commands: %s", GetBizCommands(bInfo[InBiz[playerid]][Type]));
					mysql_free_result();
					SetPlayerFacingAngle(playerid, 0);
					SetCameraBehindPlayer(playerid);
					break;
				}
			}
 	    }
 	}
	return 1;
}

CMD:down(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1161.6750,-1330.1428,31.4927) && cInfo[playerid][cFaction] == 2)
	{
	    SetPlayerPos(playerid, 17.5954,0.0282,999.0019);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 5);
	}
	return 1;
}

CMD:up(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1144.9564,-1322.8942,13.5840) && cInfo[playerid][cFaction] == 2)
    {
	    SetPlayerPos(playerid, 1161.6750,-1330.1428,31.4927);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 0);
    }
    return 1;
}

CMD:exit(playerid, params[])
{
	new p = InHouse[playerid];
	new i = InInterior[playerid];
	new b = InBiz[playerid];
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 17.5954,0.0282,999.0019) && cInfo[playerid][cFaction] == 2)
	{
	    SetPlayerPos(playerid, 1144.9564,-1322.8942,13.5840);
	    SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 0);
	}
	else
	{
	 	if(p > 0)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, hInfo[p][X_IN], hInfo[p][Y_IN], hInfo[p][Z_IN]))
			{
				SetPlayerPos(playerid, hInfo[p][X_OUT], hInfo[p][Y_OUT], hInfo[p][Z_OUT]);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				InHouse[playerid] = 0;
				SetPlayerFacingAngle(playerid, 0);
				SetCameraBehindPlayer(playerid);
				TextDrawHideForPlayer(playerid, LightTD);
			}
		}
		else if(i > 0)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, iInfo[i][inX], iInfo[i][inY], iInfo[i][inZ]))
			{
				SetPlayerPos(playerid, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ]+1.5);
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				InInterior[playerid] = 0;
				SetPlayerFacingAngle(playerid, 0);
				SetCameraBehindPlayer(playerid);
			}
		}
		else if(b > 0)
		{
			SetPlayerPos(playerid, bInfo[b][X_OUT], bInfo[b][Y_OUT], bInfo[b][Z_OUT]);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			InBiz[playerid] = 0;
			SetPlayerFacingAngle(playerid, 0);
			SetCameraBehindPlayer(playerid);
		}
	}
	return 1;
}

CMD:buylist(playerid, params[])
{
	SendClientMessage(playerid, COLOR_GRAY, "_________________ Vehicle List [model id] [model name] [price] _________________");
	for(new i = 0; i < sizeof(CarsPrices); i++)
	{
		format(gString, 256, "[ %d. %s ($%d) ] [ %d. %s ($%d) ] [ %d. %s ($%d) ] [ %d. %s ($%d) ]", CarsPrices[i][VEHID], CarsPrices[i][NAME], CarsPrices[i][PRICE], CarsPrices[i][VEHID], CarsPrices[i+1][NAME], CarsPrices[i+1][PRICE], CarsPrices[i+2][VEHID], CarsPrices[i+2][NAME], CarsPrices[i+2][PRICE], CarsPrices[i+3][VEHID], CarsPrices[i+3][NAME], CarsPrices[i+3][PRICE]);
		if(i % 4 == 0) SendClientMessage(playerid, -1, gString);
	}
	CPF(playerid, 0xFCF87FFF, "USAGE: /v buy [model id] [color 1] [color 2]");
	return 1;
}

CMD:lock(playerid, params[])
{
	if(InHouse[playerid] > 0)
	{
		new Float:oPos[3], Float:oRot[3];
		new Float:fAngle;
		GetPlayerFacingAngle(playerid, fAngle);
		for(new i = 0,j = MAX_FURNITURES; i < j; i ++)
		{
		    if(Furn[i][ID] <= 0) continue;
		    if(Furn[i][HouseID] != InHouse[playerid]) continue;
		    if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID]) return NoAdmin(playerid);
		    GetDynamicObjectPos(Furn[i][Object], oPos[0], oPos[1], oPos[2]);
		    GetDynamicObjectRot(Furn[i][Object], oRot[0], oRot[1], oRot[2]);
		    if(!IsPlayerInRangeOfPoint(playerid, 3.0, oPos[0], oPos[1], oPos[2])) continue;
		    else
		    {
		        if(Furn[i][Locked] == 1)
		        {
		            Furn[i][Locked] = 0;
		            GameTextForPlayer(playerid, "~w~Door ~g~Unlocked", 2500, 4);
		        }
		        else
		        {
		            GameTextForPlayer(playerid, "~w~Door ~r~Locked", 2500, 4);
		            Furn[i][Locked] = 1;
		        }
		        break;
		    }
		}
	}
	else
	{
		new
			iEngine, iLights, iAlarm,
			iDoors, iBonnet, iBoot,
			iObjective;

	 	new car = GetClosestVehicleForPlayer(playerid);
		new koshi[128];
		if(!ProxDetectorV(4, playerid, car)) return SendClientMessage(playerid, COLOR_GRAY, "Either there are no vehicles around to lock/unlock or this vehicle is not owned by you.");
		if(AdminVehicle[car] == true) return 1;
		if(AdminDuty[playerid])
		{
			if(vInfo[car][Locked] == 1)
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 0, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~g~UNLOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 0;
			}
			else
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 1, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~r~LOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 1;
			}
		}
		else
		{
		    if(vInfo[car][Faction] == 0 && vInfo[car][Job] == 0 && vInfo[car][Server] == 0 && cInfo[playerid][SQLID] != vInfo[car][Owner])
	            return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Faction] > 0 && cInfo[playerid][cFaction] != vInfo[car][Faction] && vInfo[car][Faction] < 99 || vInfo[car][Faction] == 99 && !DLic[playerid][TookTest])
		        return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Job] > 0 && cInfo[playerid][cJob] != vInfo[car][Job])
	        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

			if(vInfo[car][Locked] == 1)
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 0, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~g~UNLOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 0;
			}
			else
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 1, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~r~LOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 1;
			}
		}
	}
	return 1;
}

CMD:sms(playerid, params[])
{
	if(cInfo[playerid][cPhone] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You do not possess a cellphone.");

    if(cInfo[playerid][cPhoneCredits] <= 0)
        return CPF(playerid, COLOR_GRAY, "You have no credits left.");

    if(sscanf(params, "s[64]ds[128]", params, params[1], params[2])) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /phone sms (number) (text)");
	format(gString, sizeof(gString), "* %s uses his cellphone.", GetPlayerNameEx(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    if(!Logged[i]) continue;
	    if(cInfo[i][cPhone] != params[1]) continue;
        if(InCall[i] >= 0)
        {
            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

            break;
        }
        else
        {
            CPF(playerid, -1, ""COL_YELLOW"(SMS) Sent to %d (%s): %s", params[1], GetPlayerNameEx(i), params[2]);
            CPF(i, -1, ""COL_YELLOW"* (SMS) Sent from %d (%s): %s", cInfo[playerid][cPhone], GetPlayerNameEx(playerid), params[2]);
            GameTextForPlayer(playerid, "~r~-2 credits", 2500, 1);
            cInfo[playerid][cPhoneCredits] -= 2;
            break;
        }
	}
	return 1;
}

CMD:call(playerid, params[])
{
	if(cInfo[playerid][cPhone] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You do not possess a cellphone.");

    if(cInfo[playerid][cPhoneCredits] <= 0)
        return CPF(playerid, COLOR_GRAY, "You have no credits left.");

	if(Calling[playerid] == 1)
	    return CPF(playerid, COLOR_GRAY, "You already dialing to a number.");

	new pObject;
    if(sscanf(params, "d", params[1])) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /call (number)");
    if(params[1] == cInfo[playerid][cPhone])
        return CPF(playerid, COLOR_GRAY, "You can't call to yourself.");

    switch(cInfo[playerid][cPhoneType])
    {
        case 1: pObject = 18874;
        case 2: pObject = 18870;
        case 3: pObject = 18871;
		case 4: pObject = 18872;
		case 5: pObject = 18873;
		case 6: pObject = 18868;
    }
	format(gString, sizeof(gString), "* %s uses his cellphone.", GetPlayerNameEx(playerid));
	ProxDetector(10.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	SetPlayerAttachedObject(playerid, 1, pObject, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	switch(params[1])
	{
	    case 911:
	    {
	        InCall[playerid] = 911;
	        callingEm[playerid] = 1;
	        CPF(playerid, COLOR_POLICE, "Emergency Line: Hello, is this an emergency call (Yes or No)?");
	    }
	    case 554:
	    {
	        InCall[playerid] = 554;
            taxicall[playerid] = 1;
            CPF(playerid, COLOR_GREEN, "Dispatcher says: Hello there sir, you got Los Santos taxi service center. Please tell us your location.");
	    }
	    default:
	    {
			new count = 0;
		 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
			{
			    if(!IsPlayerConnected(i)) continue;
			    if(!Logged[i]) continue;
			    if(cInfo[i][cPhone] == params[1])
			    {
			        count++;
			        if(InCall[i] >= 0)
			        {
			            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
		                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
						format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
						ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
						RemovePlayerAttachedObject(playerid, 1);
			        }
			        else
			        {
			            CPF(playerid, -1, ""COL_YELLOW"Dialing to %d ..", params[1]);
			            CPF(i, -1, ""COL_YELLOW"* A cellphone call is being received from %d, (/phone answer) to answer or (/phone decline) to decline.", cInfo[playerid][cPhone]);
			            CallOffer[i] = playerid;
						Calling[playerid] = 1;
						format(gString, sizeof(gString), "* %s phone begins to ring.", GetPlayerNameEx(i));
						ProxDetector(15.0, i, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			            CallTimer[i] = SetTimerEx("PhoneRing", 5000, 1, "d", i);
			        }
		        }
			}
	        if(count <= 0)
	        {
	            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
	            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				RemovePlayerAttachedObject(playerid, 1);
				ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
	        }
	    }
	}
	return 1;
}

CMD:phone(playerid, params[])
{
	if(cInfo[playerid][cPhone] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You do not possess a cellphone.");

    if(sscanf(params,"s[64]", params))
    {
        SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /phone (option)");
        SendClientMessage(playerid, -1, "call, sms, credits, hangup, decline");
        return 1;
	}
 	if(!strcmp(params, "call", true, 4))
	{
	    if(cInfo[playerid][cPhoneCredits] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You have no credits left.");

		if(Calling[playerid] == 1)
		    return CPF(playerid, COLOR_GRAY, "You already dialing to a number.");

		new pObject;
	    if(sscanf(params, "s[64]d", params, params[1])) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /phone call (number)");
	    if(params[1] == cInfo[playerid][cPhone])
	        return CPF(playerid, COLOR_GRAY, "You can't call to yourself.");

	    switch(cInfo[playerid][cPhoneType])
	    {
	        case 1: pObject = 18874;
	        case 2: pObject = 18870;
	        case 3: pObject = 18871;
			case 4: pObject = 18872;
			case 5: pObject = 18873;
			case 6: pObject = 18868;
	    }
		format(gString, sizeof(gString), "* %s uses his cellphone.", GetPlayerNameEx(playerid));
		ProxDetector(10.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		SetPlayerAttachedObject(playerid, 1, pObject, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		switch(params[1])
		{
		    case 911:
		    {
		        InCall[playerid] = 911;
		        callingEm[playerid] = 1;
		        CPF(playerid, COLOR_POLICE, "Emergency Line: Hello, is this an emergency call (Yes or No)?");
		    }
		    case 554:
		    {
		        InCall[playerid] = 554;
                taxicall[playerid] = 1;
                CPF(playerid, COLOR_GREEN, "Dispatcher says: Hello there sir, you got Los Santos taxi service center. Please tell us your location.");
		    }
		    default:
		    {
				new count = 0;
			 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
				{
				    if(!IsPlayerConnected(i)) continue;
				    if(!Logged[i]) continue;
				    if(cInfo[i][cPhone] == params[1])
				    {
				        count++;
				        if(InCall[i] >= 0)
				        {
				            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
			                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
							format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
							ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
							RemovePlayerAttachedObject(playerid, 1);
				        }
				        else
				        {
				            CPF(playerid, -1, ""COL_YELLOW"Dialing to %d ..", params[1]);
				            CPF(i, -1, ""COL_YELLOW"* A cellphone call is being received from %d, (/phone answer) to answer or (/phone decline) to decline.", cInfo[playerid][cPhone]);
				            CallOffer[i] = playerid;
							Calling[playerid] = 1;
							format(gString, sizeof(gString), "* %s phone begins to ring.", GetPlayerNameEx(i));
							ProxDetector(15.0, i, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				            CallTimer[i] = SetTimerEx("PhoneRing", 5000, 1, "d", i);
				        }
			        }
				}
		        if(count <= 0)
		        {
		            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
		            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					RemovePlayerAttachedObject(playerid, 1);
					ClearAnimations(playerid), ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
		        }
		    }
		}
	}
 	else if(!strcmp(params, "sms", true, 3))
	{
	    if(cInfo[playerid][cPhoneCredits] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You have no credits left.");

	    if(sscanf(params, "s[64]ds[128]", params, params[1], params[2])) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /phone sms (number) (text)");
		format(gString, sizeof(gString), "* %s uses his cellphone.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		{
		    if(!IsPlayerConnected(i)) continue;
		    if(!Logged[i]) continue;
		    if(cInfo[i][cPhone] != params[1]) continue;
	        if(InCall[i] >= 0)
	        {
	            CPF(playerid, COLOR_GRAY, " .. You have just received a busy tone.");
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

                break;
	        }
	        else
	        {
	            CPF(playerid, -1, ""COL_YELLOW"(SMS) Sent to %d (%s): %s", params[1], GetPlayerNameEx(i), params[2]);
	            CPF(i, -1, ""COL_YELLOW"* (SMS) Sent from %d (%s): %s", cInfo[playerid][cPhone], GetPlayerNameEx(playerid), params[2]);
	            GameTextForPlayer(playerid, "~r~-2 credits", 2500, 1);
	            cInfo[playerid][cPhoneCredits] -= 2;
	            break;
	        }
		}
	}
	else if(!strcmp(params, "answer", true, 5))
	{
	    if(CallOffer[playerid] < 0)
	        return CPF(playerid, COLOR_GRAY, "You do not have any pending calls.");

		if(!IsPlayerConnected(CallOffer[playerid]))
			return CPF(playerid, COLOR_GRAY, "Caller could not be found."), CallOffer[playerid] = -1;

		InCall[playerid] = CallOffer[playerid];
		InCall[CallOffer[playerid]] = playerid;
		Calling[CallOffer[playerid]] = 0;
		CallOffer[CallOffer[playerid]] = -1;
		Calling[playerid] = 0;
		CallOffer[playerid] = -1;
		CPF(playerid, COLOR_GRAY, "You have answered the phone call.");
		CPF(playerid, COLOR_GRAY, "HINT: (/phone hangup) to end the call.");
		CPF(InCall[playerid], COLOR_GRAY, "They picked up.");
		ReduceCredits[InCall[playerid]] = SetTimerEx("ReducePhoneCredits", 2000, 1, "d", InCall[playerid]);
		new pObject;
	    switch(cInfo[playerid][cPhoneType])
	    {
	        case 1: pObject = 18874;
	        case 2: pObject = 18870;
	        case 3: pObject = 18871;
			case 4: pObject = 18872;
			case 5: pObject = 18873;
			case 6: pObject = 18868;
	    }
		format(gString, sizeof(gString), "* %s answers to his cellphone.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		SetPlayerAttachedObject(playerid, 1, pObject, 6, 0.086043, 0.027719, 0.003817, 95.232246, 178.651031, 1.691840, 1.002077, 1.000000, 1.000000);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	}
	else if(!strcmp(params, "decline", true, 7))
	{
	    if(CallOffer[playerid] <= -1)
	        return CPF(playerid, COLOR_GRAY, "You don't have any pending calls.");

	    if(!Logged[CallOffer[playerid]])
	        return CPF(playerid, COLOR_GRAY, "Caller could not be found."), CallOffer[playerid] = -1;

		CPF(playerid, COLOR_GRAY, "You have declined the phone call.");
		CPF(CallOffer[playerid], COLOR_GRAY, "They declined the call.");
		Calling[playerid] = 0;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		RemovePlayerAttachedObject(playerid, 1);

        SetPlayerSpecialAction(CallOffer[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
		format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(CallOffer[playerid]));
		ProxDetector(15.0, CallOffer[playerid], gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		RemovePlayerAttachedObject(CallOffer[playerid], 1);

		Calling[CallOffer[playerid]] = 0;
		CallOffer[CallOffer[playerid]] = -1;
		InCall[CallOffer[playerid]] = -1;
		CallOffer[playerid] = -1;
		InCall[playerid] = -1;
	}
	else if(!strcmp(params, "hangup", true, 6))
	{
	    if(InCall[playerid] == -1)
	        return CPF(playerid, COLOR_GRAY, "You are not in a call.");

		if(InCall[playerid] != 911)
		{
			if(!Logged[InCall[playerid]])
				return CPF(playerid, COLOR_GRAY, "Caller could not be found."), InCall[playerid] = -1;
		}

		CPF(playerid, -1, "You have hanged up the call.");
		Calling[playerid] = 0;
		switch(InCall[playerid])
		{
		    case 911:
			{
				CallOffer[playerid] = -1;
				InCall[playerid] = -1;
				callingEm[playerid] = 0;
		    }
		    default:
		    {
		        CPF(InCall[playerid], COLOR_GRAY, "The other line has hanged up.");
		        SetPlayerSpecialAction(InCall[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
				format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(InCall[playerid]));
				ProxDetector(15.0, InCall[playerid], gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
				RemovePlayerAttachedObject(InCall[playerid], 1);
				Calling[InCall[playerid]] = 0;
				CallOffer[InCall[playerid]] = -1;
				InCall[InCall[playerid]] = -1;
				CallOffer[playerid] = -1;
				InCall[playerid] = -1;
				callingEm[playerid] = 0;
		    }
		}
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		format(gString, sizeof(gString), "* %s pockets his cellphone.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		RemovePlayerAttachedObject(playerid, 1);
	}
	else if(!strcmp(params, "credits", true, 7))
	{
		CPF(playerid, -1, "You have %d phone credits left.", cInfo[playerid][cPhoneCredits]);
	}
	return 1;
}

CMD:buy(playerid, params[])
{
	if(InBiz[playerid] <= 0)
		return CPF(playerid, COLOR_GRAY, "You are not inside a business.");

	if(bInfo[InBiz[playerid]][Products] <= 0)
	    return GameTextForPlayer(playerid, "~r~Out of stock!", 2500, 1);

	switch(bInfo[InBiz[playerid]][Type])
	{
	    case 1: Show247Dialog(playerid);
	    case 6: FoodDialog(playerid);
	    case 12: PhoneDialog(playerid);
	    case 13: ShowPlayerDialog(playerid, DIALOG_CLOTHES, DIALOG_STYLE_INPUT, "Clothes", ""COL_WHITE"Enter your desired skin (1-299):\n{33AA33}Price: $250", "Buy", "Close");
	}
    return 1;
}

CMD:buyhouse(playerid, params[])
{
    new count = 0;
 	for(new i = 0,j = MAX_HOUSES; i < j; i ++)
 	{
 	    if(hInfo[i][ID] <= 0) continue;
	    if(IsPlayerInRangeOfPoint(playerid, 1.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT]))
	    {
	        count++;
	        if(hInfo[i][Owner] <= 0)
	        {
			    if(cInfo[playerid][cMoney] < hInfo[i][Price]) return CPF(playerid, COLOR_RED, "You can't afford this house.");
				hInfo[i][Owner] = cInfo[playerid][SQLID];
				UpdateHouse(i);
				CPF(playerid, -1, "{33aa33}You have successfully bought this house (%s) for $%d.", hInfo[i][Address], hInfo[i][Price]);
				CPF(playerid, COLOR_FADE1, "NOTE: You can now use /house.");
				cInfo[playerid][cMoney] -= hInfo[i][Price];
				break;
	        }
	        else CPF(playerid, COLOR_RED, "This house is not buyable.");
        }
	}
	if(count <= 0) CPF(playerid, COLOR_GRAY, "Either there are no houses in range or this house in not buyable.");
	return 1;
}

CMD:buybizz(playerid, params[])
{
	new count = 0;
	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
	{
	    if(hInfo[i][ID] <= 0) continue;
	    if(IsPlayerInRangeOfPoint(playerid, 1.5, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
	    {
	        count++;
	        if(bInfo[i][Owner] <= 0)
	        {
			    if(cInfo[playerid][cMoney] < bInfo[i][Price]) return CPF(playerid, COLOR_RED, "You can't afford this business.");
				bInfo[i][Owner] = cInfo[playerid][SQLID];
				UpdateBizz(i);
				CPF(playerid, -1, "{33aa33}You have successfully bought this business (%s) for $%d.", bInfo[i][Address], bInfo[i][Price]);
				CPF(playerid, COLOR_FADE1, "NOTE: You can now use /bizz.");
				cInfo[playerid][cMoney] -= bInfo[i][Price];
				mysql_store_result();
				break;
	        }
	        else CPF(playerid, COLOR_RED, "This business is not buyable.");
	    }
	}
	if(count <= 0) CPF(playerid, COLOR_GRAY, "Either there are no businesses in range or this business in not buyable.");
	return 1;
}

CMD:bizz(playerid, params[])
{
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /bizz (option)");
 		CPF(playerid, -1, "lock | withdraw | fee | sell");
 		return 1;
    }
  	if(!strcmp(params, "lock", true, 4))
	{
		for(new i = 0,j = MAX_BIZZES; i < j; i ++)
		{
		    if(bInfo[i][ID] <= 0) continue;
		    if(!IsPlayerInRangeOfPoint(playerid, 2.5, bInfo[i][X_IN], bInfo[i][Y_IN], bInfo[i][Z_IN]) && !IsPlayerInRangeOfPoint(playerid, 2.5, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT])) continue;
			if(bInfo[i][Owner] != cInfo[playerid][SQLID])
		    	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

			if(hInfo[i][Locked] == 1)
		    {
		        bInfo[i][Locked] = 0;
		        GameTextForPlayer(playerid, "~w~Door ~g~Unlocked", 2500, 6);
		    }
			else
			{
			    bInfo[i][Locked] = 1;
			   	GameTextForPlayer(playerid, "~w~Door ~r~Locked", 2500, 6);
			}
			break;
		}
	}
  	else if(!strcmp(params, "fee", true, 3))
	{
	    if(InBiz[playerid] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You are not inside a business.");

    	if(bInfo[InBiz[playerid]][Owner] != cInfo[playerid][SQLID])
        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bizz fee ($0 - $1000)");

		if(params[1] > 1000 || params[1] < 0)
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bizz fee ($0 - $1000)");

		bInfo[InBiz[playerid]][Fee] = params[1];
		CPF(playerid, 0x33AA33FF, "Business fee has been set to $%d.", params[1]);
		UpdateBizz(InBiz[playerid]);
	}
  	else if(!strcmp(params, "sell", true, 4))
	{
	    if(InBiz[playerid] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You are not inside a business.");

    	if(bInfo[InBiz[playerid]][Owner] != cInfo[playerid][SQLID])
        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

	    if(sscanf(params, "s[64]s[12]", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bizz sell (confirm)");

		if(strcmp(params[1], "confirm", false) == 0)
		{
			if(InBiz[playerid] > 0 && bInfo[InBiz[playerid]][Owner] == cInfo[playerid][SQLID])
			{
			    new price = bInfo[InBiz[playerid]][Price] - ((bInfo[InBiz[playerid]][Price]/100)*25);
			    format(gString, sizeof(gString), "~g~Business sold for $%d", price);
	            GameTextForPlayer(playerid, gString, 3500, 4);
	            cInfo[playerid][cMoney] = cInfo[playerid][cMoney] + price;
	            bInfo[InBiz[playerid]][Owner] = 0;
	            UpdateBizz(InBiz[playerid]);
	            return 1;
			}
		}
		else
		    SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bizz sell (confirm)");
	}
  	else if(!strcmp(params, "withdraw", true, 8))
	{
	    if(InBiz[playerid] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You are not inside a business.");

    	if(bInfo[InBiz[playerid]][Owner] != cInfo[playerid][SQLID])
        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

	    if(sscanf(params, "s[64]d", params, params[1]))
	    {
			CPF(playerid, COLOR_GRAY, "Current balance: $%d", bInfo[InBiz[playerid]][Bank]);
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bizz withdraw (value)");
		}
		if((bInfo[InBiz[playerid]][Bank] < params[1]) || (params[1] <= 0))
		    return CPF(playerid, COLOR_GRAY, "Invalid amount.");

		bInfo[InBiz[playerid]][Bank] -= params[1];
		cInfo[playerid][cMoney] += params[1];
		CPF(playerid, 0x33AA33FF, "You have withdrawed $%d from business bank.", params[1]);
	}
	else CPF(playerid, COLOR_GRAY, "Invalid parameter.");
	return 1;
}

CMD:renthouse(playerid, params[])
{
	new count = 0;
 	for(new i = 0,j = MAX_INTERIORS; i < j; i ++)
 	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, iInfo[i][outX], iInfo[i][outY], iInfo[i][outZ]))
		{
		    if(hInfo[i][Owner] == cInfo[playerid][SQLID]) return CPF(playerid, COLOR_GRAY, "You can't rent in your own house.");
			if(hInfo[i][Rentable] == 0) return CPF(playerid, COLOR_GRAY, "This house is not rentable.");
			if(cInfo[playerid][cBank] < hInfo[i][RentPrice]) return CPF(playerid, COLOR_GRAY, "You don't have enough money in your bank account.");
			cInfo[playerid][cRenting] = i;
			CPF(playerid, 0x33AA33FF, "You are now renting in this house!");
		    break;
		}
	}
	if(count <= 0) CPF(playerid, COLOR_GRAY, "You are not in range of any house.");
	return 1;
}

CMD:unrent(playerid, params[])
{
	if(cInfo[playerid][cRenting] <= 0) return CPF(playerid, COLOR_GRAY, "You are not renting in any house.");
	CPF(playerid, 0x33AA33FF, "You are not renting anymore.");
	cInfo[playerid][cRenting] = 0;
	return 1;
}

CMD:donation(playerid, params[])
{
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, "{F2C200}Usage: /donation (option)");
 		CPF(playerid, COLOR_GRAY, "information, changename, changenumber");
 		return 1;
    }
  	if(!strcmp(params, "information", true, 11))
	{
	    if(cInfo[playerid][cDonator] <= 0)
	    {
	        CPF(playerid, COLOR_GRAY, "You are not a donator.");
	    }
	    else
	    {
	        CPF(playerid, 0xF2C200FF, "Donation Information");
	        switch(cInfo[playerid][cDonator])
	        {
	            case 1: CPF(playerid, -1, "Bronze Donator");
	            case 2: CPF(playerid, -1, "Silver Donator");
	            case 3: CPF(playerid, -1, "Gold Donator");
	        }
	        CPF(playerid, -1, "Number changes left: %d", cInfo[playerid][cNumberchanges]);
	        CPF(playerid, -1, "Name changes left: %d", cInfo[playerid][cNamechanges]);
	    }
	}
	else if(!strcmp(params, "changename", true, 10))
	{
	    if(cInfo[playerid][cNamechanges] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You don't have any name changes left.");

	    if(sscanf(params, "s[64]s[25]", params, params[1]))
			return SendClientMessage(playerid, -1, "{F2C200}Usage: /donation changename (name)");

		if(!IsRPName(params[1]))
		    return CPF(playerid, COLOR_GRAY, "The name you have entered is not in the right roleplay format.");

		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Name` = '%s'", params[1]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		    return CPF(playerid, COLOR_GRAY, "The name you have entered is already in use by someone else.");

		else
		{
		    if(strcmp(pInfo[playerid][pCharacter1], GetName(playerid), false) == 0)
				format(pInfo[playerid][pCharacter1], 25, params[1]);

		    else if(strcmp(pInfo[playerid][pCharacter2], GetName(playerid), false) == 0)
			    format(pInfo[playerid][pCharacter2], 25, params[1]);

			else if(strcmp(pInfo[playerid][pCharacter3], GetName(playerid), false) == 0)
			    format(pInfo[playerid][pCharacter3], 25, params[1]);

		    CPF(playerid, COLOR_GRAY, "{F2C200}Your name has been changed to %s, you do not have to relog.", params[1]);
		    SetPlayerName(playerid, params[1]);
		    cInfo[playerid][cNamechanges] -= 1;
		}
		mysql_free_result();
	}
	else if(!strcmp(params, "changenumber", true, 12))
	{
	    if(cInfo[playerid][cNamechanges] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You don't have any number changes left.");

	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, -1, "{F2C200}Usage: /donation changenumber (number)");

		if(strlen(params[1]) <= 3 || strlen(params[1]) > 10)
		    return CPF(playerid, COLOR_GRAY, "You have entered a number that exceeds the limit of numbers (4-10)");

		format(_query, sizeof(_query), "SELECT * FROM `characters` WHERE `Phone` = '%d'", params[1]);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		    return CPF(playerid, COLOR_GRAY, "The number you have entered is already in use by someone else.");

		else
		{
		    cInfo[playerid][cPhone] = params[1];
		    CPF(playerid, COLOR_GRAY, "{F2C200}Your number has been changed to %d.", params[1]);
		    cInfo[playerid][cNumberchanges] -= 1;
		}
		mysql_free_result();
	}
	return 1;
}

CMD:licenses(playerid, params[])
{
    if(sscanf(params, "u", params[0]))
		return SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /licenses (playerid/partofname)");

	if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(!IsPlayerInRangeOfPlayer(playerid, params[0], 2.5) && params[0] != playerid)
	    return CPF(playerid, COLOR_GRAY, "Given playerid/partofname is not in range.");

	format(gString, sizeof(gString), "* %s shows his licenses to %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(params[0]));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	CPF(params[0], 0x33AA33FF, "_________ LICENSES OF %s _________", GetName(playerid));
	CPF(params[0], COLOR_GRAY, "Driving License: %s", cInfo[playerid][cDrivingLicense] ? ("Yes") : ("No"));
	CPF(params[0], COLOR_GRAY, "Weapon License: %s", cInfo[playerid][cWeaponLicense] ? ("Yes") : ("No"));
	CPF(params[0], 0x33AA33FF, "__________________________________");
	return 1;
}

CMD:licenseexam(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, -2033.4346,-117.4764,1035.1719))
        return CPF(playerid, COLOR_GRAY, "You are not at the driving school.");

	ShowPlayerDialog(playerid, DIALOG_LICENSE, DIALOG_STYLE_LIST, "Driving School", "Driving Test\t$500", "Select", "Close");
	return 1;
}

CMD:options(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] > 0)
        format(gString, sizeof(gString), "Toggle HUD\nToggle Family chat\nToggle admin chat");
	else
	    format(gString, sizeof(gString), "Toggle HUD\nToggle Family chat");
	ShowPlayerDialog(playerid, DIALOG_OPTIONS, DIALOG_STYLE_LIST, "Game Options", gString, "Select", "Close");
    return 1;
}

CMD:lights(playerid, params[])
{
	if(InHouse[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You are not in a House.");
	if(HouseLights[InHouse[playerid]] == false)
	{
	    HouseLights[InHouse[playerid]] = true;
		format(gString, sizeof(gString), "* %s turns on the house lights.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	}
	else
	{
		format(gString, sizeof(gString), "* %s turns off the house lights.", GetPlayerNameEx(playerid));
		ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	    HouseLights[InHouse[playerid]] = false;
	}
	return 1;
}

CMD:bagitem(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 6) return NoAdmin(playerid);
    if(sscanf(params, "dd", params[0], params[1]))
	{
 		SendClientMessage(playerid, COLOR_RED, "/bagitem [itemID] [itemAmount]");
		return 1;
	}
	if(GetBagItemCount(playerid) >= MAX_ITEMS) return CPF(playerid, COLOR_RED, "Can't");
	_AddDatabaseItem(params[0], params[1], cInfo[playerid][SQLID]);
	LoadPlayerBag(playerid);
	CPF(playerid, COLOR_GREEN, "Added");
	return 1;
}

CMD:pickup(playerid, params[])
{
	return _PickItem(playerid);
}

CMD:items(playerid, params[])
{
    if(GetBagItemCount(playerid) <= 0) return CPF(playerid, COLOR_GRAY, "You do not possess any items.");
    Bag_Page[playerid] = 0;
    ShowBag(playerid);
	return 1;
}

CMD:furniture(playerid, params[])
{
	if(InHouse[playerid] <= 0) return CPF(playerid, COLOR_GRAY, "You are not inside a House.");
	if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_RED, "You are not the owner of this house.");

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

CMD:house(playerid, params[])
{
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /house (option)");
 		CPF(playerid, -1, "lock | sell | setrent");
 		return 1;
    }
  	if(!strcmp(params, "lock", true, 4))
	{
	    new count = 0;
		for(new i = 0,j = MAX_HOUSES; i < j; i ++)
		{
		    if(hInfo[i][ID] <= 0) continue;
		    if(!IsPlayerInRangeOfPoint(playerid, 2.5, hInfo[i][X_IN], hInfo[i][Y_IN], hInfo[i][Z_IN]) && !IsPlayerInRangeOfPoint(playerid, 2.5, hInfo[i][X_OUT], hInfo[i][Y_OUT], hInfo[i][Z_OUT])) continue;
			count++;
			if(hInfo[i][Owner] != cInfo[playerid][SQLID] && cInfo[playerid][cRenting] != i)
		    	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

			if(hInfo[i][Locked] == 1)
		    {
		        hInfo[i][Locked] = 0;
		        GameTextForPlayer(playerid, "~w~Door ~g~Unlocked", 2500, 6);
		    }
			else
			{
			    hInfo[i][Locked] = 1;
			   	GameTextForPlayer(playerid, "~w~Door ~r~Locked", 2500, 6);
			}
			break;
		}
		if(count <= 0) CPF(playerid, COLOR_GRAY, "You are not in range of any house.");
	}
  	else if(!strcmp(params, "setrent", true, 7))
	{
	    if(InHouse[playerid] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You are not inside a house.");

		if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID])
		    return NoAdmin(playerid);

	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
			return SendClientMessage(playerid, COLOR_GREEN, "Usage:"COL_WHITE" /house setrent (rent price $10 - $10000) (rent ability 0/1)");

	    if(params[1] > 10000 || params[1] < 10 || params[2] > 1 || params[2] < 0)
	        return SendClientMessage(playerid, COLOR_GREEN, "Usage:"COL_WHITE" /house setrent (rent price $10 - $10000) (rent ability 0/1)");

		hInfo[InHouse[playerid]][Rentable] = params[2];
		hInfo[InHouse[playerid]][RentPrice] = params[1];
		UpdateHouse(InHouse[playerid]);
		CPF(playerid, 0x33AA33FF, "Rent has been toggled to \"%s\" and price has been set to $%d.", hInfo[InHouse[playerid]][Rentable] ? ("Rentable") : ("Unrentable"), hInfo[InHouse[playerid]][RentPrice]);
	}
  	else if(!strcmp(params, "sell", true, 4))
	{
	    if(InHouse[playerid] <= 0)
	        return CPF(playerid, COLOR_GRAY, "You are not inside a house.");

		if(hInfo[InHouse[playerid]][Owner] != cInfo[playerid][SQLID])
		    return NoAdmin(playerid);

	    if(sscanf(params, "s[64]s[12]", params, params[1]))
			return SendClientMessage(playerid, COLOR_GREEN, "Usage:"COL_WHITE" /house sell (confirm)");

		if(strcmp(params[1], "confirm", false) == 0)
		{
			if(InHouse[playerid] > 0 && hInfo[InHouse[playerid]][Owner] == cInfo[playerid][SQLID])
			{
			    new price = hInfo[InHouse[playerid]][Price] - ((hInfo[InHouse[playerid]][Price]/100)*25);
			    format(gString, sizeof(gString), "~g~House sold for $%d", price);
	            GameTextForPlayer(playerid, gString, 3500, 4);
	            cInfo[playerid][cMoney] = cInfo[playerid][cMoney] + price;
	            hInfo[InHouse[playerid]][Owner] = 0;
	            UpdateHouse(InHouse[playerid]);
				return 1;
			}
		}
		else
		    SendClientMessage(playerid, 0xFCF87FFF, "Usage: /house sell (confirm)");
	}
	else CPF(playerid, COLOR_GRAY, "Invalid parameter.");
	return 1;
}

CMD:destroyveh(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
	new veh = GetPlayerVehicleID(playerid);
	if(!AdminVehicle[veh]) return CPF(playerid, COLOR_GRAY, "You are not in an admin vehicle.");

	DestroyVehicle(veh);
	CPF(playerid, COLOR_YELLOW, "Admin vehicle has been destroyed.");
	AdminVehicle[veh] = false;
	return 1;
}

CMD:destroyall(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
	new count = 0;
 	for(new i = 0; i < MAX_VEHICLES; i++)
 	{
 	    if(AdminVehicle[i] == true)
		{
	 	    count++;
			DestroyVehicle(i);
			AdminVehicle[i] = false;
		}
 	}
 	CPF(playerid, COLOR_YELLOW, "%d admin vehicles have been destroyed.", count);
 	return 1;
}

CMD:cvo(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
	if(vInfo[GetPlayerVehicleID(playerid)][Server] != 1) return CPF(playerid, COLOR_GRAY, "This is not a server vehicle.");
 	if(sscanf(params, "s[64]", params))
 	{
 	    SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /cvo (type)");
		return SendClientMessage( playerid, COLOR_FADE1, "faction, job, rental");
	}
  	if(!strcmp(params, "faction", true, 7))
	{
	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "{33aa33}Usage: "COL_WHITE"/cvo faction (factionID)");

		if(!FactionExists(params[1])) return CPF(playerid, COLOR_GRAY, "Given factionID does not exist.");
		vInfo[GetPlayerVehicleID(playerid)][Faction] = params[1];
		vInfo[GetPlayerVehicleID(playerid)][Job] = 0;
		vInfo[GetPlayerVehicleID(playerid)][Rentable] = 0;
		CPF(playerid, 0x33AA33FF, "Vehicle has been set to faction %d.", params[1]);
	}
  	else if(!strcmp(params, "job", true, 3))
	{
	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "{33aa33}Usage: "COL_WHITE"/cvo job (jobID)");

		vInfo[GetPlayerVehicleID(playerid)][Faction] = 0;
		vInfo[GetPlayerVehicleID(playerid)][Job] = params[1];
		vInfo[GetPlayerVehicleID(playerid)][Rentable] = 0;
		CPF(playerid, 0x33AA33FF, "Vehicle has been set to job %d.", params[1]);
	}
  	else if(!strcmp(params, "rental", true, 6))
	{
	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "{33aa33}Usage: "COL_WHITE"/cvo rental (rentPrice)");

		vInfo[GetPlayerVehicleID(playerid)][Faction] = 0;
		vInfo[GetPlayerVehicleID(playerid)][Job] = 0;
		vInfo[GetPlayerVehicleID(playerid)][Rentable] = 1;
		vInfo[GetPlayerVehicleID(playerid)][RentPrice] = params[1];
		CPF(playerid, 0x33AA33FF, "Vehicle has been set to rental at price $%d.", params[1]);
	}
  	else if(!strcmp(params, "licenses", true, 8))
	{
		vInfo[GetPlayerVehicleID(playerid)][Faction] = 99;
		vInfo[GetPlayerVehicleID(playerid)][Job] = 0;
		vInfo[GetPlayerVehicleID(playerid)][Rentable] = 0;
		vInfo[GetPlayerVehicleID(playerid)][RentPrice] = 0;
		CPF(playerid, 0x33AA33FF, "Vehicle has been set to driving licenses.", params[1]);
	}
	return 1;
}

CMD:bank(playerid, params[])
{
	if(InBiz[playerid] <= 0 || bInfo[InBiz[playerid]][Type] != 8)
	    return CPF(playerid, COLOR_GRAY, "You are not inside the bank.");

 	if(sscanf(params, "s[64]", params))
 	{
 	    SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /bank (option)");
		return SendClientMessage( playerid, COLOR_FADE1, "balance, withdraw, deposit, savings");
	}
  	if(!strcmp(params, "withdraw", true, 8))
	{
	    if(cInfo[playerid][cSavings] > 0)
	        return CPF(playerid, COLOR_RED, "Your bank operations are temporarily disabled due to your savings progress.");

	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bank withdraw (amount)");

		if((cInfo[playerid][cBank] < params[1]) || (params[1] <= 0))
		    return CPF(playerid, COLOR_GRAY, "Invalid amount.");

		CPF(playerid, 0x33AA33FF, "Withdrawed $%d from your account.", params[1]);
		CPF(playerid, COLOR_GRAY, "Old Balance: $%d", cInfo[playerid][cBank]);
		CPF(playerid, COLOR_GRAY, "Current Balance: $%d", cInfo[playerid][cBank] - params[1]);
		cInfo[playerid][cBank] -= params[1];
		cInfo[playerid][cMoney] += params[1];
	}
  	else if(!strcmp(params, "deposit", true, 7))
	{
	    if(cInfo[playerid][cSavings] > 0)
	        return CPF(playerid, COLOR_RED, "Your bank operations are temporarily disabled due to your savings progress.");

	    if(sscanf(params, "s[64]d", params, params[1]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /bank deposit (amount)");

		if((cInfo[playerid][cMoney] < params[1]) || (params[1] <= 0))
		    return CPF(playerid, COLOR_GRAY, "Invalid amount.");

		CPF(playerid, 0x33AA33FF, "Deposited $%d from your account.", params[1]);
		CPF(playerid, COLOR_GRAY, "Old Balance: $%d", cInfo[playerid][cBank]);
		CPF(playerid, COLOR_GRAY, "Current Balance: $%d", cInfo[playerid][cBank] + params[1]);
		cInfo[playerid][cBank] += params[1];
		cInfo[playerid][cMoney] -= params[1];
	}
  	else if(!strcmp(params, "savings", true, 7))
	{
		if(cInfo[playerid][cSavings] > 0)
		{
		    if(sscanf(params, "s[64]s[64]", params, params[1]))
		 	{
		 	    CPF(playerid, COLOR_GRAY, "You have $%d in your savings account.", cInfo[playerid][cSavings]);
				CPF(playerid, COLOR_RED, "To withdraw savings: /bank savings (confirm)");
		 	    return 1;
		 	}
		 	if(strcmp(params[1], "confirm", false) == 0)
		 	{
			    CPF(playerid, COLOR_GRAY, "You had $%d in your savings.", cInfo[playerid][cSavings]);
			    CPF(playerid, COLOR_GRAY, "You have withdrawed your savings.");
			    CPF(playerid, COLOR_GRAY, "You now have $0 in your savings.");
			    cInfo[playerid][cMoney] += cInfo[playerid][cSavings];
			    cInfo[playerid][cSavings] = 0;
		    }
		}
		else
		{
		    if(sscanf(params, "s[64]d", params, params[1]))
		 	{
		 	    SendClientMessage(playerid, COLOR_RED, "To put in savings: /bank savings ($50000 - $100000)");
				CPF(playerid, COLOR_RED, "To withdraw savings: /bank savings");
		 	    return 1;
		 	}
			if(params[1] <= 0) return CPF(playerid, COLOR_GRAY, "Invalid amount.");
		 	if(params[1] > 100000 || params[1] < 50000)
		 	{
		 	    SendClientMessage(playerid, COLOR_RED, "To put in savings: /bank savings ($50000 - $100000)");
				CPF(playerid, COLOR_RED, "To withdraw savings: /bank savings");
		 	    return 1;
		 	}
		 	if(cInfo[playerid][cMoney] < params[1]) return CPF(playerid, COLOR_GRAY, "You don't have enough money.");
		 	cInfo[playerid][cMoney] -= params[1];
		 	cInfo[playerid][cSavings] = params[1];
		 	CPF(playerid, 0x33AA33FF, "$%d were put into your savings account.", params[1]);
		 	CPF(playerid, COLOR_GRAY, "All bank operations are now disabled till your withdraw your savings.");
	 	}
	}
  	else if(!strcmp(params, "balance", true, 7))
	{
	    CPF(playerid, 0x33AA33FF, "_________ BALANCE _________");
	    CPF(playerid, COLOR_FADE1, "Bank: $%d", cInfo[playerid][cBank]);
	    CPF(playerid, COLOR_FADE1, "Savings: $%d", cInfo[playerid][cSavings]);
	}
	return 1;
}

CMD:edit_bizz(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);

 	if(sscanf(params, "s[64]", params))
 	{
 	    SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /edit_bizz (option)");
		return SendClientMessage( playerid, COLOR_FADE1, "xyzinterior, interior, exterior, type, price, name");
	}
  	if(!strcmp(params, "xyzinterior", true, 11))
	{
	    new Float:intPos[3];
	    if(sscanf(params, "s[64]dfffd", params, params[1], intPos[0], intPos[1], intPos[2], params[2]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /edit_bizz interior (bizzID) (enterX) (enterY) (enterZ) (intID)");

  		if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");

		bInfo[params[1]][X_IN] = intPos[0];
	    bInfo[params[1]][Y_IN] = intPos[1];
	    bInfo[params[1]][Z_IN] = intPos[2];
	    bInfo[params[1]][INT] = params[2];
	    UpdateBizz(params[1]);
	    CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "exterior", true, 8))
	{
	    if(sscanf(params, "s[64]ds[22]", params, params[1], params[2]))
	    {
	        CPF(playerid, COLOR_GRAY, "Once confirming the business will move to your exact position.");
			return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz exterior (bizzID) (confirm)");
		}
		if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");
		if(strcmp(params[2], "confirm", false) == 0)
		{
		    new Float:plPos[3];
			GetPlayerPos(playerid, plPos[0], plPos[1], plPos[2]);
			bInfo[params[1]][X_OUT] = plPos[0];
			bInfo[params[1]][Y_OUT] = plPos[1];
			bInfo[params[1]][Z_OUT] = plPos[2];
			UpdateBizz(params[1]);
			CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
		}
	}
  	else if(!strcmp(params, "interior", true, 8))
	{
	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz interior (bizzID) (interior /binteriors)");

        if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");

	    if(params[2] < 0 || params[2] > 37)
            return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz interior (bizzID) (interior /binteriors)");

		bInfo[params[1]][X_IN] = bInterior[params[2]][INT_POS][0];
		bInfo[params[1]][Y_IN] = bInterior[params[2]][INT_POS][1];
		bInfo[params[1]][Z_IN] = bInterior[params[2]][INT_POS][2];
		bInfo[params[1]][INT] = bInterior[params[2]][INT_ID];
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "type", true, 4))
	{
	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz type (bizzID) (typeID 1-13)");

        if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");

	    if(params[2] <= 0 || params[2] > 13)
            return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz type (bizzID) (typeID 1-13)");

		bInfo[params[1]][Type] = params[2];
		UpdateBizz(params[1]);
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "name", true, 4))
	{
	    if(sscanf(params, "s[64]ds[128]", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz name (bizzID) (name)");

        if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");

	    format(bInfo[params[1]][Name], 128, "%s", params[2]);
		UpdateBizz(params[1]);
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "price", true, 5))
	{
	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_bizz price (bizzID) (value)");

        if(bInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "Business ID does not exist.");

	    bInfo[params[1]][Price] = params[2];
		UpdateBizz(params[1]);
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE"Business %d has been updated.", params[1]);
	}
	return 1;
}

CMD:edit_house(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);

 	if(sscanf(params, "s[64]", params))
 	{
 	    SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /edit_house (option)");
		return SendClientMessage( playerid, COLOR_FADE1, "xyzinterior, interior, exterior, price");
	}
  	if(!strcmp(params, "xyzinterior", true, 11))
	{
	    new Float:intPos[3];
	    if(sscanf(params, "s[64]dfffd", params, params[1], intPos[0], intPos[1], intPos[2], params[2]))
			return SendClientMessage(playerid, 0xFCF87FFF, "Usage: /edit_house interior (houseID) (enterX) (enterY) (enterZ) (intID)");

  		if(hInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "House ID does not exist.");

		hInfo[params[1]][X_IN] = intPos[0];
	    hInfo[params[1]][Y_IN] = intPos[1];
	    hInfo[params[1]][Z_IN] = intPos[2];
	    hInfo[params[1]][INT] = params[2];
	    UpdateHouse(params[1]);
	    CPF(playerid, -1, "{33aa33}Success: "COL_WHITE" House %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "exterior", true, 8))
	{
	    if(sscanf(params, "s[64]ds[22]", params, params[1], params[2]))
	    {
	        CPF(playerid, COLOR_GRAY, "Once confirming the business will move to your exact position.");
			return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_house exterior (houseID) (confirm)");
		}
		if(hInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "House ID does not exist.");
		if(strcmp(params[2], "confirm", false) == 0)
		{
		    new Float:plPos[3];
			GetPlayerPos(playerid, plPos[0], plPos[1], plPos[2]);
			hInfo[params[1]][X_OUT] = plPos[0];
			hInfo[params[1]][Y_OUT] = plPos[1];
			hInfo[params[1]][Z_OUT] = plPos[2];
			UpdateHouse(params[1]);
			CPF(playerid, -1, "{33aa33}Success: "COL_WHITE" House %d has been updated.", params[1]);
		}
	}
  	else if(!strcmp(params, "interior", true, 8))
	{
	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_house interior (houseID) (interior /interiors)");

        if(hInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "House ID does not exist.");

	    if(params[2] < 0 || params[2] > 37)
            return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_house interior (houseID) (interior /interiors)");

		hInfo[params[1]][X_IN] = Interior[params[2]][INT_POS][0];
		hInfo[params[1]][Y_IN] = Interior[params[2]][INT_POS][1];
		hInfo[params[1]][Z_IN] = Interior[params[2]][INT_POS][2];
		hInfo[params[1]][INT] = Interior[params[2]][INT_ID];
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE" House %d has been updated.", params[1]);
	}
  	else if(!strcmp(params, "price", true, 5))
	{
	    if(sscanf(params, "s[64]dd", params, params[1], params[2]))
   	 		return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /edit_house price (houseID) (value)");

        if(hInfo[params[1]][ID] <= 0) return CPF(playerid, COLOR_GRAY, "House ID does not exist.");

		hInfo[params[1]][Price] = params[2];
		UpdateHouse(params[1]);
		CPF(playerid, -1, "{33aa33}Success: "COL_WHITE" House %d has been updated.", params[1]);
	}
	return 1;
}

CMD:clearcp(playerid, params[])
{
    DisablePlayerCheckpoint(playerid), ShowCP[playerid] = false;
	GameTextForPlayer(playerid, "~r~CHECKPOINTS REMOVED", 3000, 4);
	return 1;
}

CMD:ad(playerid, params[])
{
	if(GetBizID(playerid) <= 0 || bInfo[GetBizID(playerid)][Type] != 10)
	    return CPF(playerid, COLOR_GRAY, "You are not near the Advertisement Center.");

	if(cInfo[playerid][cPhone] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You do not possess a cellphone.");

	if(Advertable == false)
	    return CPF(playerid, COLOR_RED, "Please wait 60 seconds after the last advertisement before posting.");

    if(sscanf(params, "s[256]", params))
    	return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /ad (message) "COL_RED"$1 per letter");

	new topay = strlen(params) * 1;
	if(cInfo[playerid][cMoney] < topay)
	    return CPF(playerid, COLOR_GRAY, "You don't have enough money, you need $%d.", topay);

	format(gString, sizeof(gString), "[Advertisement] %s, Contact: %s, Ph: [%d]", params, GetName(playerid), cInfo[playerid][cPhone]);
	SendClientMessageToAll(0x00cc00FF, gString);
	format(gString, sizeof(gString), "~r~-$%d", topay);
	GameTextForPlayer(playerid, gString, 2500, 1);
	bInfo[GetBizID(playerid)][Bank] += topay;
	cInfo[playerid][cMoney] -= topay;
	Advertable = false;
	AdvertTimer = SetTimer("Advert", 60*1000, false);
	return 1;
}

CMD:cad(playerid, params[])
{
	if(GetBizID(playerid) <= 0 || bInfo[GetBizID(playerid)][Type] != 10)
	    return CPF(playerid, COLOR_GRAY, "You are not near the Advertisement Center.");

	if(cInfo[playerid][cPhone] <= 0)
	    return CPF(playerid, COLOR_GRAY, "You do not possess a cellphone.");

	if(Advertable == false)
	    return CPF(playerid, COLOR_RED, "Please wait 60 seconds after the last advertisement before posting.");

    if(sscanf(params, "s[256]", params))
    	return CPF(playerid, 0x33AA33FF, "Usage:"COL_WHITE" /cad (message) "COL_RED"$2 per letter");

	new topay = strlen(params) * 2;
	if(cInfo[playerid][cMoney] < topay)
	    return CPF(playerid, COLOR_GRAY, "You don't have enough money, you need $%d.", topay);

	format(gString, sizeof(gString), "[Company Advertisement] %s", params);
	SendClientMessageToAll(0x00cc00FF, gString);
	format(gString, sizeof(gString), "~r~-$%d", topay);
	GameTextForPlayer(playerid, gString, 2500, 1);
	bInfo[GetBizID(playerid)][Bank] += topay;
	cInfo[playerid][cMoney] -= topay;
	format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: [%d] %s has just made a company advertisement.", playerid, GetName(playerid));
	SendAdminMessage(-1, gString);
	Advertable = false;
	AdvertTimer = SetTimer("Advert", 60*1000, false);
	return 1;
}

CMD:v(playerid, params[])
{ // v trunk
    if(sscanf(params, "s[64]", params))
	{
 		SendClientMessage(playerid, 0xFCF87FFF, "Usage: /v(ehicle) (option)");
 		CPF(playerid, -1, "buy, get, info, list, buyinsurance, lock, buypark, park, engine, lights");
 		CPF(playerid, -1, "bonnet, hood, fill, find");
 		return 1;
    }
 	if(!strcmp(params, "find", true, 4))
	{
	    if(!IsVehicleSpawned(cInfo[playerid][cVehicle1]) && !IsVehicleSpawned(cInfo[playerid][cVehicle2]) && !IsVehicleSpawned(cInfo[playerid][cVehicle3]))
			return CPF(playerid, COLOR_GRAY, "You have no vehicle spawned.");
		new Float:_vPos[ 3 ],
			vehicleName[32];

	 	if(IsVehicleSpawned(cInfo[playerid][cVehicle1]))
		{
		    new veh = GetVehicleID(cInfo[playerid][cVehicle1]);
		    GetVehiclePos(veh, _vPos[0], _vPos[1], _vPos[2]);
	 	    format(vehicleName, 32, "%s", VehicleNames[vInfo[veh][Model]-400]);
		}
	 	else if(IsVehicleSpawned(cInfo[playerid][cVehicle2]))
		{
		    new veh = GetVehicleID(cInfo[playerid][cVehicle2]);
		    GetVehiclePos(veh, _vPos[0], _vPos[1], _vPos[2]);
	 	    format(vehicleName, 32, "%s", VehicleNames[vInfo[veh][Model]-400]);
		}
	 	else if(IsVehicleSpawned(cInfo[playerid][cVehicle3]))
		{
		    new veh = GetVehicleID(cInfo[playerid][cVehicle3]);
		    GetVehiclePos(veh, _vPos[0], _vPos[1], _vPos[2]);
	 	    format(vehicleName, 32, "%s", VehicleNames[vInfo[veh][Model]-400]);
		}
	 	SetPlayerCheckpoint(playerid, _vPos[0], _vPos[1], _vPos[2], 5.0);
	 	ShowCP[playerid] = true;
	 	CPF(playerid, 0xff00deFF, "Your %s has been marked on the map.", vehicleName);
	}
 	else if(!strcmp(params, "fill", true, 4))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	        return CPF(playerid, COLOR_GRAY, "You are not inside a vehicle.");

		new count = 0;
	 	for(new i = 0,j = MAX_BIZZES; i < j; i ++)
	 	{
	 	    if(bInfo[i][ID] <= 0) continue;
		    if(bInfo[i][Type] != 3) continue;
	        if(IsPlayerInRangeOfPoint(playerid, 10.0, bInfo[i][X_OUT], bInfo[i][Y_OUT], bInfo[i][Z_OUT]))
	        {
	            count ++;
		    	if(cInfo[playerid][cMoney] < 500) return CPF(playerid, COLOR_GRAY, "You don't have enough money.");
		    	cInfo[playerid][cMoney] -= 500;
       			bInfo[i][Products] -= 1;
			    TogglePlayerControllable(playerid, false);
			    CountDown[playerid] = 30;
			    GameTextForPlayer(playerid, "~g~Setting up", 1000, 4);
			    CountDownTimer[playerid] = SetTimerEx("CountdownFuel", 1000, true, "i", playerid);
			    SetTimerEx("FillVehicle", 30*1000, false, "i", playerid);
		 	}
		}
		if(count <= 0 && HaveGasCan[playerid])
		{
		    TogglePlayerControllable(playerid, false);
		    CountDown[playerid] = 30;
		    GameTextForPlayer(playerid, "~g~Setting up", 1000, 4);
		    CountDownTimer[playerid] = SetTimerEx("CountdownFuel", 1000, true, "i", playerid);
		    SetTimerEx("FillVehicle", 30*1000, false, "i", playerid);
		}
		else
            CPF(playerid, COLOR_GRAY, "Either you are not at a gas station or don't have a gas can.");
	}
 	else if(!strcmp(params, "get", true, 3))
	{
	    new slot;
	    if(sscanf(params, "s[64]d", params, slot)) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /v(ehicle) get (slot 1-3)");
	    if(slot < 1 || slot > 3) return CPF(playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /v(ehicle) get (slot 1-3)");
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 2000, false, "i", playerid);
		new v1 = cInfo[playerid][cVehicle1], v2 = cInfo[playerid][cVehicle2], v3 = cInfo[playerid][cVehicle3];
	 	for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
	 	{
	 	    if(!IsValidVehicle(i)) continue;
	 	    if(vInfo[i][ID] == v1 && VehicleSpawned[i])
	 	        return CPF(playerid, COLOR_GRAY, "You have already spawned one of your vehicles.");

	 	    if(vInfo[i][ID] == v2 && VehicleSpawned[i])
	 	        return CPF(playerid, COLOR_GRAY, "You have already spawned one of your vehicles.");

	 	    if(vInfo[i][ID] == v3 && VehicleSpawned[i])
	 	        return CPF(playerid, COLOR_GRAY, "You have already spawned one of your vehicles.");
	 	}
	    SpawnVehicle(playerid, slot);
	}
	else if(!strcmp(params, "list", true, 4))
	{
		if(cInfo[playerid][cVehicle1] <= 0 && cInfo[playerid][cVehicle2] <= 0 && cInfo[playerid][cVehicle3] <= 0)
		    return CPF(playerid, COLOR_GRAY, "You have no vehicles.");

		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 2000, false, "i", playerid);

		CPF(playerid, -1, "{33aa33}_____________ %s Vehicles _____________", GetPlayerNameEx(playerid));
		ShowVehicleList(playerid);
	}
	else if(!strcmp(params, "park", true, 4))
	{
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		new vid = GetPlayerVehicleID(playerid);
		if(cInfo[playerid][SQLID] != vInfo[vid][Owner])
			return CPF(playerid, COLOR_GRAY, "You are not the owner of this vehicle."), 1;

		if(!IsPlayerInRangeOfPoint(playerid, 5.0, vInfo[vid][X], vInfo[vid][Y], vInfo[vid][Z]))
		{
			SetPlayerCheckpoint(playerid, vInfo[vid][X], vInfo[vid][Y], vInfo[vid][Z], 5.0);
			ShowCP[playerid] = true;
			CPF(playerid, COLOR_GRAY, "This is not the parking place of this vehicle (Marked on the map).");
		    return 1;
		}

  		SaveVehicle(vid);
		ClearVehStats(vid);
		DestroyVehicle(vid);
		new ss[32];
		GetPlayer2DZone(playerid, ss, 32);
		CPF(playerid, -1, "{33aa33}Vehicle despawned (%s)", ss);
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 2000, false, "i", playerid);
	}
	else if(!strcmp(params, "buypark", true, 7))
	{
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 3000, false, "i", playerid);
	    new vid = GetPlayerVehicleID(playerid);
		if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		if(cInfo[playerid][SQLID] != vInfo[vid][Owner]) return CPF(playerid, COLOR_GRAY, "You are not the owner of this vehicle.");
		if(IsPlayerInRangeOfPoint(playerid, 3.0, vInfo[vid][X], vInfo[vid][Y], vInfo[vid][Z]))
		    return CPF(playerid, COLOR_GRAY, "You are already parking in here.");

		if(cInfo[playerid][cMoney] < 1500) return CPF(playerid, COLOR_GRAY, "You don't have enough money ($1500)");
		new vehicleID = vInfo[vid][ID];
		GetPlayerPos(playerid, xa, ya, za);
		new Float:angle;
		GetVehicleZAngle(GetPlayerVehicleID(playerid), angle);
		format(_query, sizeof _query, "SELECT * FROM `vehicles` WHERE `ID` = '%d'", vehicleID);
		mysql_query(_query);
		mysql_store_result();
		if(mysql_num_rows())
		{
			format(_query, sizeof(_query), "UPDATE `vehicles` SET `X`  = '%f', `Y`  = '%f', `Z`  = '%f', `A`  = '%f' WHERE `ID` = '%d'", xa, ya, za, angle, vehicleID);
			mysql_query(_query);
			new ss[32];
			GetPlayer2DZone(playerid, ss, 32);
			CPF(playerid, -1, "{33aa33}You have bought this parking place for $2500 (%s)", ss);
			cInfo[playerid][cMoney] -= 1500;
			vInfo[vid][X] = xa;
			vInfo[vid][Y] = ya;
			vInfo[vid][Z] = za;
			vInfo[vid][A] = angle;
			DisablePlayerCheckpoint(playerid);
		}
		else CPF(playerid, -1, ""COL_RED"Error:"COL_WHITE" Could not park vehicle.");
		mysql_free_result();
	}
	else if(!strcmp(params, "lock", true, 4))
	{
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 3000, false, "i", playerid);
		new
			iEngine, iLights, iAlarm,
			iDoors, iBonnet, iBoot,
			iObjective;

	 	new car = GetClosestVehicleForPlayer(playerid);
		new koshi[128];
		if(!ProxDetectorV(4, playerid, car)) return SendClientMessage(playerid, COLOR_GRAY, "Either there are no vehicles around to lock/unlock or this vehicle is not owned by you.");
		if(AdminVehicle[car] == true) return 1;
		if(AdminDuty[playerid])
		{
			if(vInfo[car][Locked] == 1)
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 0, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~g~UNLOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 0;
			}
			else
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 1, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~r~LOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 1;
			}
		}
		else
		{
		    if(vInfo[car][Faction] == 0 && vInfo[car][Job] == 0 && vInfo[car][Server] == 0 && cInfo[playerid][SQLID] != vInfo[car][Owner])
	            return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Faction] > 0 && cInfo[playerid][cFaction] != vInfo[car][Faction] && vInfo[car][Faction] < 99 || vInfo[car][Faction] == 99 && !DLic[playerid][TookTest])
		        return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Job] > 0 && cInfo[playerid][cJob] != vInfo[car][Job])
	        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

			if(vInfo[car][Locked] == 1)
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 0, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~g~UNLOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 0;
			}
			else
			{
				GetVehicleParamsEx(car, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
				SetVehicleParamsEx(car, iEngine, iLights, iAlarm, 1, iBonnet, iBoot, iObjective);
				format(koshi, sizeof(koshi), "~w~%s ~r~LOCKED!", VehicleNames[GetVehicleModel(car)-400]);
				GameTextForPlayer(playerid, koshi, 2000, 4);
				PlayerPlaySound(playerid, 1052, 0, 0, 0);
				vInfo[car][Locked] = 1;
			}
		}
	}
	else if(!strcmp(params, "lights", true, 6))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		new
			iEngine, iLights, iAlarm,
			iDoors, iBonnet, iBoot,
			iObjective;

		GetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
		if(iLights <= 0)
		    SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, 1, iAlarm, iDoors, iBonnet, iBoot, iObjective);

		else
			SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, 0, iAlarm, iDoors, iBonnet, iBoot, iObjective);

		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 3000, false, "i", playerid);
	}
 	else if(!strcmp(params, "bonnet", true, 6))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		new
			iEngine, iLights, iAlarm,
			iDoors, iBonnet, iBoot,
			iObjective;

		GetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
		if(iBoot <= 0)
		    SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, iBonnet, 1, iObjective);

		else
		    SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, iBonnet, 0, iObjective);
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 3000, false, "i", playerid);
	}
 	else if(!strcmp(params, "hood", true, 4))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		if(VehicleSpam[playerid] == true) return SendClientMessage(playerid, 0xFCF87FFF, "Please wait 2 seconds before each vehicle operation.");
		new
			iEngine, iLights, iAlarm,
			iDoors, iBonnet, iBoot,
			iObjective;

		GetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
        if(iBonnet <= 0)
            SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, 1, iBoot, iObjective);

		else
		    SetVehicleParamsEx(GetPlayerVehicleID(playerid), iEngine, iLights, iAlarm, iDoors, 0, iBoot, iObjective);
		VehicleSpam[playerid] = true;
		SetTimerEx("PreventVSpam", 3000, false, "i", playerid);
	}
 	else if(!strcmp(params, "buyinsurance", true, 12))
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1472.6603,-1670.0081,15.1903))
	        return CPF(playerid, COLOR_GRAY, "You are not at a dealership.");

	    if(!IsPlayerInAnyVehicle(playerid)) return CPF(playerid, COLOR_GRAY, "You are not in a vehicle.");
		new vid = GetPlayerVehicleID(playerid);
		if(vInfo[vid][Owner] != cInfo[playerid][SQLID]) return CPF(playerid, COLOR_GRAY, "You are not the owner of this vehicle.");
		if(vInfo[vid][Insurances] >= 6) return CPF(playerid, COLOR_GRAY, "This vehicle already has 6 insurances.");
		if(cInfo[playerid][cMoney] < 1500) return CPF(playerid, COLOR_GRAY, "You don't have enough money ($1500)");
		vInfo[vid][Insurances] += 1;
		cInfo[playerid][cMoney] -= 1500;
		SendClientMessage(playerid, COLOR_RED,"You bought an insurance for your vehicle for $1500.");
		SendClientMessage(playerid, COLOR_RED,"Use /v park as soon as possible for your insurances to save!");
		return 1;
	}
	else if(!strcmp(params, "buy", true, 3))
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1472.6603,-1670.0081,15.1903))
	        return CPF(playerid, COLOR_GRAY, "You are not at a dealership.");

	    new car, color1, color2;
	    if(sscanf(params, "s[64]ddd", params, car, color1, color2)) {
			SendClientMessage(playerid, COLOR_GRAY, "                  VEHICLE LIST [Model ID] [Model Name] [Price]                  ");
			for(new i = 0; i < 73; i++)
			{
				format(gString, 256, "[ %d. %s ($%d) ] [ %d. %s ($%d) ] [ %d. %s ($%d) ] [ %d. %s ($%d) ]", CarsPrices[i][VEHID], CarsPrices[i][NAME], CarsPrices[i][PRICE], CarsPrices[i+1][VEHID], CarsPrices[i+1][NAME], CarsPrices[i+1][PRICE], CarsPrices[i+2][VEHID], CarsPrices[i+2][NAME], CarsPrices[i+2][PRICE], CarsPrices[i+3][VEHID], CarsPrices[i+3][NAME], CarsPrices[i+3][PRICE]);
				if(i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20 || i == 24 || i == 28 || i == 32 || i == 36 || i == 40 || i == 44 || i == 48 || i == 52 || i == 56 || i == 60 || i == 64 || i == 68 || i == 72 || i == 76) SendClientMessage(playerid, -1, gString);
			}
			CPF(playerid, 0xFCF87FFF, "USAGE: /v buy [model id] [color 1] [color 2]");
			return 1;
	    }
	    BuyVehicle(playerid, car, color1, color2);
	    return 1;
	}
	return 1;
}

CMD:refundstamp(playerid, params[])
{
	new gDate[6];
	getdate(gDate[0], gDate[1], gDate[2]);
	gettime(gDate[3], gDate[4], gDate[5]);
	CPF(playerid, COLOR_YELLOW, "Refund stamp @ %s (%d-%d-%d - %d:%d:%d)", GetName(playerid), gDate[0], gDate[1], gDate[2], gDate[3], gDate[4], gDate[5]);
 	CPF(playerid, COLOR_YELLOW, "Forum: %s", pInfo[playerid][pForum]);
	return 1;
}

// MDC
CMD:wanted(playerid, params[])
{
        if(cInfo[playerid][cFaction] != 1)
                return NoAdmin(playerid);
        if(!OnDuty[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You cannot use this command while being off duty.");
        new
                targetid,
                charge[64];
        if(sscanf(params, "us[64]", targetid, charge))
                return SendClientMessage(playerid, COLOR_GRAY, "USAGE: /wanted [PlayerID/PartOfName] [Charge]");
        if(!IsPlayerConnected(targetid))
                return SendClientMessage(playerid, COLOR_GRAY, "Given PlayerID is not connected.");
        format(g_szMessage, sizeof(g_szMessage), "[WANTED] Suspect: %s Reporter: %s Crime: %s", PlayerName[targetid], PlayerName[playerid], charge);
        SendFactionMessage(1, COLOR_POLICE, g_szMessage);
        format(g_szMessage, sizeof(g_szMessage), "INSERT INTO `charges` (`id`, `charge`, `byname`, `outstanding`, `timestamp`) VALUES ('%d', '%s', '%s', '1', '%s')", cInfo[targetid][SQLID], charge, PlayerName[playerid], GetDate());
        mysql_query(g_szMessage);
		return 1;
}

CMD:claimreward(playerid, params[])
{
	if(cInfo[playerid][cEvent]) return SendClientMessage(playerid, -1, "You are not eligible to receive the prize. Sorry.");
	cInfo[playerid][cTotalHours] += 1;
	cInfo[playerid][cEvent] = 1;
	SendClientMessage(playerid, COLOR_YELLOW, "Prize claimed! You've received:");
	SendClientMessage(playerid, -1, "+1 Total Hours Played!");
	SendClientMessage(playerid, COLOR_GRAY, "HINT: New rewards will be given once in a while!");
	return 1;
}

CMD:time(playerid, params[])
{
	new mon,hor,soc;
	gettime(hor,mon,soc);
	new string[32];
	format(string, 32, "~w~%d:%d", hor, mon);
	GameTextForPlayer(playerid, string, 1500, 1);
	format(gString, sizeof(gString), "* %s glances to %s wrist and checking what is the time.", GetPlayerNameEx(playerid), GetPlayerGender(playerid));
	ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
	return 1;
}

CMD:fixmyhours(playerid, params[])
{
	new addp=0;
	addp +=cInfo[playerid][cEXP];
	if(cInfo[playerid][cLevel] > 1)
	{
	    for(new i = 1; i < cInfo[playerid][cLevel]; i++)
	    {
	        addp += ((i+1)*4);
	    }
	}
	if(addp == 0)
	{
		CPF(playerid, -1, "Hours untouched");
		return 1;
	}
	CPF(playerid, -1, "Hours set to %d", addp);
	cInfo[playerid][cTotalHours] = addp;
	return 1;
}

CMD:newreward(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] < 6) return NoAdmin(playerid);
	foreach(new i : Player) cInfo[i][cEvent] = 0;
	mysql_query("UPDATE `characters` SET `Event` = 0 WHERE `Event` = 1");
	SendClientMessageToAll(COLOR_YELLOW, "New reward has kicked in! Type /claimreward to claim your prize(s).");
	return 1;
}

CMD:apb(playerid, params[])
{
        new
                sub;
        if(cInfo[playerid][cFaction] != 1)
                return NoAdmin(playerid);
        if(!OnDuty[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You cannot use this command while being off duty.");
        if(sscanf(params, "s[12]", true))
                return SendClientMessage(playerid, COLOR_RED, "USAGE: /apb <Option>"),
                           SendClientMessage(playerid, COLOR_RED, "create, clear, details, modify, list");

        if(!sscanf(params, "'clear'", true, 5))
        {
                if(!sscanf(params[6], "i(-1)", sub))
                {
                        if(_APB[sub][ID] <= 0)
                                return SendClientMessage(playerid, COLOR_RED, "Invalid APB ID.");

                        format(g_szMessage, sizeof(g_szMessage), "APB: All Points Bulletin %d has been cleared by %s %s.", _APB[sub][ID], GetPlayerRank(playerid), PlayerName[playerid]);
                        SendFactionMessage(1, COLOR_RED, g_szMessage);
                        _APB[sub][ID] = 0;
                }
                else SendClientMessage(playerid, COLOR_RED, "USAGE: /apb clear <Number>");
        }
        else if(!sscanf(params, "'details'", true, 7))
        {
                if(!sscanf(params[8], "i(-1)", sub))
                {
                        if(_APB[sub][ID] <= 0)
                                return SendClientMessage(playerid, COLOR_RED, "Invalid APB ID.");
                        new
                                szString[64],
                                szString1[256];
                        format(szString1, sizeof(szString1), "{FF6347}APB: {FFFFFF}%s\n{FF6347}CHARGES: {FFFFFF}%s\n{FF6347}ISSUED BY: {FFFFFF}%s\n{FF6347}MODIFIED BY: {FFFFFF}%s", _APB[sub][APB], _APB[sub][Charge], _APB[sub][Creator], _APB[sub][Modified]);
                        format(szString, sizeof(szString), "%s - All Points Bulletin %d", DIALOG_APB_TITLE, sub);
                        ShowPlayerDialog(playerid, DIALOG_APB_DETAILS, DIALOG_STYLE_MSGBOX, szString, szString1, "Print", "Cancel");
                        SetPVarInt(playerid, "APBid", sub);
                }
                else SendClientMessage(playerid, COLOR_RED, "USAGE: /apb details <Number>");
        }
        else if(!sscanf(params, "'modify'", true, 6))
        {
                if(!sscanf(params[7], "i(-1)", sub))
                {
                        if(_APB[sub][ID] <= 0)
                                return SendClientMessage(playerid, COLOR_RED, "Invalid APB ID.");
                        new
                                szString[64];
                        format(szString, sizeof(szString), "%s - Modify All Points Bulletin %d", DIALOG_APB_TITLE, sub);
                        ShowPlayerDialog(playerid, DIALOG_APB_MODIFY, DIALOG_STYLE_LIST, szString, "1.  Edit APB\n2.   Edit Charges", "Select", "Cancel");
                        SetPVarInt(playerid, "APBid", sub);
                }
                else SendClientMessage(playerid, COLOR_RED, "USAGE: /apb modify <Number>");
        }
        else if(!sscanf(params, "'list'", true, 4))
        {
                new Msg[64], count = 0;
                for(new i = 1; i < MAX_SERVER_APB; i++)
                {
                    if(_APB[i][ID] <= 0) continue;
                    else
                   	{
                   	    count ++;
                        format(Msg, sizeof(Msg), "%s[%d] ", Msg, i);
                    }
                }
                if(count <= 0) CPF(playerid, COLOR_GRAY, "There are no active APBs.");
                else
                {
	                format(g_szMessage, sizeof(g_szMessage), "Active APBs are: %s", Msg);
	                SendClientMessage(playerid, COLOR_RED, g_szMessage);
                }
        }
        else if(!sscanf(params, "'create'", true, 6))
        {
                ShowPlayerDialog(playerid, DIALOG_APB_CREATE_1, DIALOG_STYLE_INPUT, DIALOG_APB_TITLE" - Create", "     Write below the APB you want to issue out", "Next", "Cancel");
        }
        return 1;
}

CMD:mdc(playerid, params[])
{
        if(cInfo[playerid][cFaction] != 1)
                return NoAdmin(playerid);
        if(!OnDuty[playerid])
                return SendClientMessage(playerid, COLOR_GRAY, "You cannot use this command while being off duty.");
        /*if(!IsPlayerInAnyVehicle(playerid))
                return SendClientMessage(playerid, COLOR_GRAY, "You cannot use this while being on foot.");
        new
                vehicleid = GetPlayerVehicleID(playerid);
        if(vInfo[vehicleid][Faction] != 1)
                return SendClientMessage(playerid, COLOR_GRAY, "You can use MDC on police vehicle only.");*/
        ShowPlayerDialog(playerid, DIALOG_MDC_MAIN, DIALOG_STYLE_LIST, DIALOG_MDC_TITLE, "Name Search\nPlate Search (( playerID ))\nPlate Search (( Plate ))", "Select", "Cancel");
		if(IsPlayerInAnyVehicle(playerid))
		{
			format(gString, sizeof(gString), "* %s logs on an MDC", GetPlayerNameEx(playerid));
			ProxDetector(15.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		}
		return 1;
}

CMD:moderators(playerid, params[])
{
	new count;
   	SendClientMessage(playerid, COLOR_WHITE, "__________________________________________________");
    SendClientMessage(playerid, COLOR_WHITE, "                           Moderation team:");
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(pInfo[i][AdminLevel] > 1 || pInfo[i][AdminLevel] <= 0) continue;
		count++;
		CPF(playerid, -1, "%sModerator %s: %s (ID %d)", ModeratorDuty[i]?("{A52A2A}"):("{A8A8A8}"), pInfo[i][pForum], GetName(i), playerid);
	}
	if(count <= 0) SendClientMessage(playerid, COLOR_GRAY, "There are no moderators online at the moment.");
	SendClientMessage(playerid, COLOR_WHITE, "__________________________________________________");
	return 1;
}

CMD:admins(playerid, params[])
{
	new admin_rank[32], count;
   	SendClientMessage(playerid, COLOR_WHITE, "__________________________________________________");
    SendClientMessage(playerid, COLOR_WHITE, "                           Administration team:");
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(pInfo[i][AdminLevel] <= 1) continue;
		count++;
		switch(pInfo[i][AdminLevel])
		{
		    case 1: admin_rank = "Unknown Rank";
		    case 2: admin_rank = "Administrator";
		    case 3: admin_rank = "Level 2 Administrator";
		    case 4: admin_rank = "Level 3 Administrator";
		    case 5: admin_rank = "Lead Administrator";
		    case 6: admin_rank = "Management";
		    default: admin_rank = "Unknown Rank";
		}

		if(pInfo[i][AdminLevel] == 1)
		{
		    CPF(playerid, -1, "%s %s %s: %s (ID %d)", ModeratorDuty[i]?("{33AA33}"):("{A8A8A8}"), admin_rank, pInfo[i][pForum], GetPlayerNameEx(i), i);
		}
		else if(pInfo[i][AdminLevel] > 1)
		{
      		CPF(playerid, -1, "%s %s %s: %s (ID %d)", AdminDuty[i]?("{33AA33}"):("{A8A8A8}"), admin_rank, pInfo[i][pForum], GetPlayerNameEx(i), i);
		}
	}
	if(count <= 0) SendClientMessage(playerid, COLOR_GRAY, "There are no administrators online at the moment.");
	SendClientMessage(playerid, COLOR_WHITE, "__________________________________________________");
	return 1;
}

CMD:engine(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAY,"You are not in a vehicle.");
	new carid = GetPlayerVehicleID(playerid);
	if(IsABike(carid)) return true;
	if(GetPlayerVehicleSeat(playerid) != 0) return true;
	GetVehicleParamsEx(carid,vEngine,vLights,vAlarm,vDoors,vBonnet,vBoot,vObjective);
	if(Engine[carid] == false)
	{
	    if(AdminDuty[playerid])
	    {
	        if(vInfo[carid][Fuel] <= 0) return GameTextForPlayer(playerid, "~r~Vehicle has no fuel!", 3500, 4);
			SetVehicleParamsEx(carid,1,1,vAlarm,vDoors,vBonnet,vBoot,vObjective);
			format(gString, sizeof(gString), "* %s starts the engine of %s.", GetPlayerNameEx(playerid), VehicleNames[GetVehicleModel(carid)-400]);
			ProxDetector(12.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			Engine[carid] = true;
			if(EngineTimer[carid])
			{
			    KillTimer(EngineTimer[carid]);
			    EngineTimer[carid] = 0;
			}
			EngineTimer[carid] = SetTimerEx("ReduceFuel", 120*1000, true, "d", carid);
	    }
	    else
	    {
	        new car = carid;
		    if(vInfo[car][Faction] == 0 && vInfo[car][Job] == 0 && vInfo[car][Server] == 0 && cInfo[playerid][SQLID] != vInfo[car][Owner])
	            return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Faction] > 0 && cInfo[playerid][cFaction] != vInfo[car][Faction] && vInfo[car][Faction] < 99 || vInfo[car][Faction] == 99 && !DLic[playerid][TookTest])
		        return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    else if(vInfo[car][Job] > 0 && cInfo[playerid][cJob] != vInfo[car][Job])
	        	return GameTextForPlayer(playerid, "~r~You don't have a key", 3200, 6);

		    if(vInfo[carid][Fuel] <= 0) return GameTextForPlayer(playerid, "~r~Vehicle has no fuel!", 3500, 4);
			SetVehicleParamsEx(carid,1,1,vAlarm,vDoors,vBonnet,vBoot,vObjective);
			format(gString, sizeof(gString), "* %s starts the engine of %s.", GetPlayerNameEx(playerid), VehicleNames[GetVehicleModel(carid)-400]);
			ProxDetector(12.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
			Engine[carid] = true;
			if(EngineTimer[carid])
			{
			    KillTimer(EngineTimer[carid]);
			    EngineTimer[carid] = 0;
			}
			EngineTimer[carid] = SetTimerEx("ReduceFuel", 120*1000, true, "d", carid);
		}
	}
	else
	{
		SetVehicleParamsEx(carid,0,0,vAlarm,vDoors,vBonnet,vBoot,vObjective);
		format(gString, sizeof(gString), "* %s stops the engine of %s.", GetPlayerNameEx(playerid), VehicleNames[GetVehicleModel(carid)-400]);
		ProxDetector(12.0, playerid, gString, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
		Engine[carid] = false;
		KillTimer(Engine[carid]);
	}
	return 1;
}

CMD:settime(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
 	if(sscanf( params, "d", params[0]))
		return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /settime (0-23)");

	SetWorldTime(params[0]);
	format(gString ,sizeof(gString), "ADMIN: Time has been set to %d", params[0]);
	SendClientMessageToAll(COLOR_GRAY, gString);
	return 1;
}

CMD:setweather(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
 	if(sscanf( params, "d", params[0]))
		return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /setweather (0-20)");

	SetWeather(params[0]);
	format(gString ,sizeof(gString), "ADMIN: Weather has been set to %d", params[0]);
	SendClientMessageToAll(COLOR_GRAY, gString);
	return 1;
}

CMD:veh(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
 	if ( sscanf( params, "s[128]", params[ 0 ] ) )
		return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /veh (vehicleid or name)");

	if(IsPlayerInAnyVehicle(playerid) || GetVehicleModelIDFromName(params[0]) == -1 || GetVehicleModelIDFromName(params[0]) == 520) return true;
	new car, Float:a;
	GetPlayerFacingAngle(playerid, a);
	new Float:oldposx, Float:oldposy, Float:oldposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	car = CreateVehicle(GetVehicleModelIDFromName(params[0]),oldposx,oldposy,oldposz,0,0,0,-1);
	SetVehicleVirtualWorld(car, GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid,car,0);
	AdminVehicle[car] = true;
	Engine[car] = true;
	SetVehicleParamsEx(car,1,1,0,0,0,0,0);
	SetVehicleNumberPlate(car, "{c8a000}Admin Veh");
	return 1;
}

CMD:apark(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid))
        return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");

    new vid = GetPlayerVehicleID(playerid);
	new Float:avPos[4];
	GetVehiclePos(vid, avPos[0], avPos[1], avPos[2]);
	GetVehicleZAngle(vid, avPos[3]);
	vInfo[vid][X] = avPos[0];
	vInfo[vid][Y] = avPos[1];
	vInfo[vid][Z] = avPos[2];
	vInfo[vid][A] = avPos[3];
    CPF(playerid, COLOR_YELLOW, "ADMIN: You have admin parked this vehicle (ID: %d)", vid);
	return 1;
}

CMD:acolors(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid))
        return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");

 	if ( sscanf( params, "dd", params[1], params[2] ) )
		return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /acolors (color 1) (color 2)");

    if(params[1] > 255 || params[1] < 0 || params[2] > 255 || params[2] < 0) return CPF(playerid, COLOR_GRAY, "Selected vehicle colors are invalid (0-255)");
    new vid = GetPlayerVehicleID(playerid);
	vInfo[vid][Color1] = params[1];
	vInfo[vid][Color2] = params[2];
	ChangeVehicleColor(vid, params[1], params[2]);
    CPF(playerid, COLOR_YELLOW, "ADMIN: You have changed this vehicle colors to %d, %d (ID: %d)", params[1], params[2], vid);
	return 1;
}

CMD:despawn(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid))
        return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");

    new vid = GetPlayerVehicleID(playerid);
    if(AdminVehicle[vid] || vInfo[vid][Server] >= 1)
        return CPF(playerid, COLOR_GRAY, "You canno't despawn this vehicle.");

  	SaveVehicle(vid);
	ClearVehStats(vid);
	DestroyVehicle(vid);
	CPF(playerid, COLOR_YELLOW, "Vehicle despawned.");
	return 1;
}

CMD:respawncar(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid))
        return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");

    new vid = GetPlayerVehicleID(playerid);
    if(AdminVehicle[vid])
        return CPF(playerid, COLOR_GRAY, "You can't respawn an admin vehicle.");

    RespawnVeh(vid);
    CPF(playerid, COLOR_YELLOW, "ADMIN: You have respawned this vehicle (ID: %d)", vid);
	return 1;
}

CMD:fillcar(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
    if(!IsPlayerInAnyVehicle(playerid))
        return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");

    new vid = GetPlayerVehicleID(playerid);
    if(AdminVehicle[vid])
        return CPF(playerid, COLOR_GRAY, "You can't re-fill an admin vehicle.");

	CPF(playerid, COLOR_YELLOW, "ADMIN: You have re-filled this vehicle (ID: %d)", vid);
	vInfo[vid][Fuel] = 100;
	return 1;
}

CMD:respawn(playerid, params[])
{

	return 1;
}

CMD:boombox(playerid, params[])
{
    new cmd[14], volume;
    sscanf(params, "s[14]d", cmd, volume);
    if(isnull(cmd))
    {
        SendClientMessage(playerid, 0x33AA33FF, "Usage: "COL_WHITE"/boombox (option)");
        SendClientMessage(playerid, COLOR_GRAY, "place | pickup | setstation | setvolume | take");
        if(pInfo[playerid][AdminLevel] > 1)SendClientMessage(playerid, COLOR_RED, "Admin: remove, getid");
        return 1;
    }
    if(strcmp(cmd, "place", true) == 0)
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAY, "You must be onfoot to place a boombox down.");
        if(BoomboxModel[playerid] != 2103 && BoomboxModel[playerid] != 2226)return SendClientMessage(playerid, COLOR_GRAY, "You dont have a boombox on you.");
        for(new i = 0; i < MAX_BOOMBOX; i++)
        {
            if(i == MAX_BOOMBOX - 1)return SendClientMessage(playerid, COLOR_GRAY, "Server reached the maximum placed boomboxes.");

            if(isnull(Boombox[i][Bowner]))
	        {
	            for(new j = 0; j < MAX_BOOMBOX; j++)if(IsPlayerInRangeOfPoint(playerid, 50, Boombox[j][Bpos][0], Boombox[j][Bpos][1], Boombox[j][Bpos][2])) return SendClientMessage(playerid, COLOR_GRAY, "You are too close to other boombox.");
	            if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK) return SendClientMessage(playerid, COLOR_GRAY, "You must be crouched to place the boombox down.");
				new Float: a;
	            GetPlayerPos(playerid, Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2]);
	    		GetPlayerFacingAngle(playerid, a);

	            BoomboxID[playerid] = i;
	            Boombox[i][Bmodel] = BoomboxModel[playerid]; //2103 , 2226

	            Boombox[i][Brotation][2] = -atan2(Boombox[i][Bpos][0] - Boombox[i][Bpos][0] + (1 * floatsin(-a, degrees)), Boombox[i][Bpos][1] - Boombox[i][Bpos][1] + (1 * floatcos(-a, degrees)));
	            Boombox[i][Bpos][0] += (0.9 * floatsin(-a, degrees));
	            Boombox[i][Bpos][1] += (0.9 * floatcos(-a, degrees));
	            Boombox[i][Bpos][2] = Boombox[i][Bpos][2] - 1;

	        	Boombox[i][Bareaid] = CreateDynamicSphere(Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2], 26, -1, -1);
	        	format(Boombox[i][Bowner], 24, "%s", GetName(playerid));

	            Boombox[i][Bvolume] = 10;

	            Boombox[i][Bstationurl] = EOS;

	            RemovePlayerAttachedObject(playerid, 9);
	            BoomboxModel[playerid] = EOS;

	            Boombox[i][Bobjectid] = CreateDynamicObject(Boombox[i][Bmodel], Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2], Boombox[i][Brotation][0], Boombox[i][Brotation][1], Boombox[i][Brotation][2]);
	           	EditDynamicObject(playerid, Boombox[i][Bobjectid]);
	           	break;
            }
        }
    }
    else if(strcmp(cmd, "take", true) == 0)
    {
    	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAY, "You must be onfoot to take a boombox.");
        for(new i = 0; i < MAX_BOOMBOX; i++)
        {
            if(!isnull(Boombox[i][Bowner]))
            {
                if(IsPlayerInRangeOfPoint(playerid, 1.5, Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2]))
                {
                    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK) return SendClientMessage(playerid, COLOR_GRAY, "You must be crouched to take the boombox.");
                    if(strcmp(Boombox[i][Bowner], GetName(playerid), false) == 0)
                    {
                        foreach(Player, j)
                        {
                            if(IsPlayerInDynamicArea(j, Boombox[i][Bareaid]))
                            {
                                if(!IsPlayerInAnyVehicle(j))StopAudioStreamForPlayer(j);
                            }
                        }

                        BoomboxModel[playerid] = Boombox[i][Bmodel];
                    	if(Boombox[i][Bmodel] == 2226)SetPlayerAttachedObject(playerid, 9, Boombox[i][Bmodel], 6, 0.4, 0, 0, 0, 270, 180);
                        else if(Boombox[i][Bmodel] == 2103)SetPlayerAttachedObject(playerid, 9, Boombox[i][Bmodel], 6, 0.54, 0, 0, 0, 270, 180);

                        Boombox[i][Bmodel] = EOS;
                        Boombox[i][Bpos] = EOS;
                        Boombox[i][Brotation] = EOS;

                        Boombox[i][Bowner] = EOS;
                        Boombox[i][Bstationurl] = EOS;

                        DestroyDynamicArea(Boombox[i][Bareaid]);
                        DestroyDynamicObject(Boombox[i][Bobjectid]);
						Boombox[i][Bareaid] = EOS;
                        Boombox[i][Bobjectid] = EOS;

                        return SendClientMessage(playerid, COLOR_GRAY, "You are now holding your boombox.");
                    }
                    else return SendClientMessage(playerid, COLOR_GRAY, "You are not the owner of this boombox.");
                }
            }
            if(i == MAX_BOOMBOX - 1) return SendClientMessage(playerid, COLOR_GRAY, "There is no boombox near you.");
        }
    }
    else if(strcmp(cmd, "setstation", true) == 0)
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAY, "You must be onfoot to set a boombox station.");
        for(new i = 0; i < MAX_BOOMBOX; i++)
        {
            if(!isnull(Boombox[i][Bowner]))
            {
                if(IsPlayerInRangeOfPoint(playerid, 1.5, Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2]))
                {
                    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK) return SendClientMessage(playerid, COLOR_GRAY, "You must be crouched to set the boombox station.");
                    if(strcmp(Boombox[i][Bowner], GetName(playerid), false) == 0)
                    {
                        BoomboxID[playerid] = i;
                        return ShowPlayerDialog(playerid, DIALOG_BOOMBOX, DIALOG_STYLE_LIST, "Radio List", BOOMBOXLIST, "Select", "Cancel");
                    }
                    else return SendClientMessage(playerid, COLOR_GRAY, "You are not the owner of this boombox.");
                }
            }
            if(i == MAX_BOOMBOX-1) return SendClientMessage(playerid, COLOR_GRAY, "There is no boombox near you.");
        }
    }
    else if(strcmp(cmd, "setvolume", true) == 0)
    {
        if(volume == EOS)return SendClientMessage(playerid, COLOR_GRAY, ""COL_FADE"USAGE:"COL_WHITE" /boombox setvolume (1 - 10)");
        if(volume < 1 || volume > 10)return SendClientMessage(playerid, COLOR_GRAY, ""COL_FADE"USAGE:"COL_WHITE" /boombox setvolume (1 - 10)");

        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAY, "You must be onfoot to set a boombox volume.");
        for(new i = 0; i < MAX_BOOMBOX; i++)
        {
            if(!isnull(Boombox[i][Bowner]))
            {
                if(IsPlayerInRangeOfPoint(playerid, 1.5, Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2]))
                {
                    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK) return SendClientMessage(playerid, COLOR_GRAY, "You must be crouched to set the boombox volume.");
                    if(strcmp(Boombox[i][Bowner], GetName(playerid), false) == 0)
                    {
                        Boombox[i][Bvolume] = volume;

                        DestroyDynamicArea(Boombox[i][Bareaid]);
                        Boombox[i][Bareaid] = CreateDynamicSphere(Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2], volume * 2.5 + 1, -1, -1);
                        return 1;
                    }
                    else return SendClientMessage(playerid, COLOR_GRAY, "You are not the owner of this boombox.");
                }
            }
            if(i == MAX_BOOMBOX-1) return SendClientMessage(playerid, COLOR_GRAY, "There is no boombox near you.");
		}
    }
    else if(strcmp(cmd, "throw", true) == 0)
    {
        if(BoomboxModel[playerid] == 2103 || BoomboxModel[playerid] == 2226)
        {
            BoomboxModel[playerid] = EOS;
            RemovePlayerAttachedObject(playerid, 9);
            return SendClientMessage(playerid, COLOR_GRAY, "You have thrown your boombox.");
        }
        else return SendClientMessage(playerid, COLOR_GRAY, "You don't have a boombox.");
    }
    else if(strcmp(cmd, "remove", true) == 0)
    {
        if(pInfo[playerid][AdminLevel] > 1)
        {
            if(volume < 0)return 1;
            if(!isnull(Boombox[volume][Bowner]))
            {
                foreach(Player, j)
                {
                    if(IsPlayerInDynamicArea(j, Boombox[volume][Bareaid]))
                    {
                    	if(!IsPlayerInAnyVehicle(j))StopAudioStreamForPlayer(j);
                    }
                }

                Boombox[volume][Bmodel] = EOS;
                Boombox[volume][Bpos] = EOS;
                Boombox[volume][Brotation] = EOS;

                Boombox[volume][Bowner] = EOS;
                Boombox[volume][Bstationurl] = EOS;

                DestroyDynamicArea(Boombox[volume][Bareaid]);
                DestroyDynamicObject(Boombox[volume][Bobjectid]);
        		Boombox[volume][Bareaid] = EOS;
                Boombox[volume][Bobjectid] = EOS;

                new a[100];
                format(a, 100, "Boombox id %d removed.", volume);
                return SendClientMessage(playerid, COLOR_RED, a);
            }
        }
    }
    else if(strcmp(cmd, "getid", true) == 0)
    {
        if(pInfo[playerid][AdminLevel] > 1)
        {
            for(new i = 0; i < MAX_BOOMBOX; i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 5.0, Boombox[i][Bpos][0], Boombox[i][Bpos][1], Boombox[i][Bpos][2]))
                {
                    new a[100];
                    format(a, 100, "Boombox id: %d.", i);
                    return SendClientMessage(playerid, COLOR_RED, a);
                }
            }
        }
    }
    else
	{
        SendClientMessage(playerid, 0x33AA33FF, "Usage: "COL_WHITE"/boombox (option)");
        SendClientMessage(playerid, COLOR_GRAY, "place | pickup | setstation | setvolume | take");
        if(pInfo[playerid][AdminLevel] > 1)SendClientMessage(playerid, COLOR_RED, "Admin: remove, getid");
	}
    return 1;
}

CMD:respawncars(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
    for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
 	{
 	    if(!IsValidVehicle(i)) continue;
 	    if(AdminVehicle[i]) continue;
 	    if(IsVehicleOccupied(i)) continue;
		RespawnVeh(i);
	}
	format(gString, sizeof(gString), "Admin %s has respawned all spawned vehicles.", GetName(playerid));
	SendClientMessageToAll(COLOR_GRAY, gString);
	return 1;
}

CMD:fillcars(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 4) return NoAdmin(playerid);
    for(new i = 0,j = MAX_VEHICLES; i < j; i ++)
 	{
 	    if(!IsValidVehicle(i)) continue;
 	    if(AdminVehicle[i]) continue;
		vInfo[i][Fuel] = 100;
	}
	format(gString, sizeof(gString), "Admin %s has re-filled all spawned vehicles.", GetName(playerid));
	SendClientMessageToAll(COLOR_GRAY, gString);
	return 1;
}

CMD:flipcar(playerid, params[])
{
	if(pInfo[playerid][AdminLevel] <= 1) return NoAdmin(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return CPF(playerid, COLOR_GRAY, "You are not in any vehicle.");
    new currentveh;
    new Float:angle;
    currentveh = GetPlayerVehicleID(playerid);
    GetVehicleZAngle(currentveh, angle);
    SetVehicleZAngle(currentveh, angle);
    SendClientMessage(playerid, COLOR_YELLOW, "Your vehicle has been flipped.");
	return 1;
}

CMD:repairveh(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 2) return NoAdmin(playerid);
 	if(sscanf(params, "u", params[0]))
	 	return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /repairveh (playerid/partofname)");

	if(!IsPlayerConnected(params[0])) return Disconnected(playerid);
	if(!IsPlayerInAnyVehicle(params[0])) return CPF(playerid, COLOR_GRAY, "Given playerid/partofname is not in a vehicle.");
	new vid = GetPlayerVehicleID(params[0]);
	SetVehicleHealth(vid, 1000.0);
	RepairVehicle(vid);
	CPF(params[0], 0xFCF87FFF, "Admin %s has repaired your vehicle.", GetName(playerid));
	return 1;
}

CMD:createveh(playerid, params[])
{
    if(pInfo[playerid][AdminLevel] < 5) return NoAdmin(playerid);
    new modelid, color1, color2;
 	if(sscanf(params, "ddd", modelid, color1, color2))
	 	return SendClientMessage( playerid, -1, ""COL_FADE"USAGE:"COL_WHITE" /createveh (model id) (color 1) (color 2)");

	if(color1 > 255 || color1 < 0 || color2 > 255 || color2 < 0) return CPF(playerid, COLOR_GRAY, "Selected vehicle colors are invalid (0-255)"), 0;
	new plt[64], randnumb = 1000 + random(8999);
	format(plt, 64,"LS-%d", randnumb);
	new Float:myp[3];
	GetPlayerPos(playerid, myp[0], myp[1], myp[2]);
	format(_query, sizeof(_query), "INSERT INTO `vehicles`(`Model`, `Owner`, `Server`, `Color1`, `Color2`, `Plate`, `X`, `Y`, `Z`, `A`) VALUES (%d, 0, 1, %d, %d, '%s', '%f', '%f', '%f', '0.0')", modelid, color1, color2, plt, myp[0], myp[1], myp[2]);
	mysql_query(_query);
	format(_query, sizeof(_query), "SELECT * FROM `vehicles` WHERE `ID` = %d", mysql_insert_id());
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
	    new spawnedcar = CreateVehicle(Info[1], vpos[0], vpos[1], vpos[2], vpos[3], Info[7], Info[8], 0);
		vInfo[spawnedcar][ID] = Info[0];
		vInfo[spawnedcar][Model] = Info[1];
		vInfo[spawnedcar][Owner] = Info[2];
		vInfo[spawnedcar][Locked] = Info[3];
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
        vInfo[spawnedcar][Fuel] = 100;
		SetVehicleZAngle(spawnedcar, vInfo[spawnedcar][A]);
		format(gString, sizeof(gString), ""COL_YELLOW"ADMIN: %s created a server vehicle - %s with colors %d, %d.", GetName(playerid), VehicleNames[modelid-400], color1, color2);
		SendAdminMessage(-1, gString);
		VehicleSpawned[spawnedcar] = true;
		Engine[spawnedcar] = false;
		SetVehicleParamsEx(spawnedcar, 0, 0, 0, 1, 0, 0, 0);
		SetVehicleNumberPlate(spawnedcar, vInfo[spawnedcar][Plate]);
	}
	mysql_free_result();
    return 1;
}
