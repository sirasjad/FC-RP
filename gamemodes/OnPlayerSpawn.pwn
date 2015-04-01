==============================================================================
== OnPlayerSpawn
==============================================================================*/

public OnPlayerSpawn(playerid)
{
    CallRemoteFunction("FadeScreen","ii",playerid, 2);
    TogglePlayerSpectating(playerid, 0);
    SetCameraBehindPlayer(playerid);
    
    TextDrawShowForPlayer(playerid,MoneyDraw2);
    TextDrawShowForPlayer(playerid,ServerDraw);
    for(new i = 0; i < 8; i++)
    {
    	if(i != 0) { TextDrawShowForPlayer(playerid, Text:PlayerHud[i]); }
    }
    
    MoneyDraw[playerid] = TextDrawCreate(497.000000, 78.000000, "~g~$00000000");
    TextDrawBackgroundColor(MoneyDraw[playerid], 100);
    TextDrawFont(MoneyDraw[playerid], 2);
    TextDrawLetterSize(MoneyDraw[playerid], 0.469999, 2.000000);
    TextDrawColor(MoneyDraw[playerid], -1);
	TextDrawSetOutline(MoneyDraw[playerid], 1);
 	TextDrawSetProportional(MoneyDraw[playerid], 1);
 	
 	PlayerHudS[1][playerid] = TextDrawCreate(551.000000, 29.000000, " ");
  	TextDrawBackgroundColor(PlayerHudS[1][playerid], 100);
  	TextDrawFont(PlayerHudS[1][playerid], 2);
   	TextDrawLetterSize(PlayerHudS[1][playerid], 0.470000, 2.000000);
    TextDrawColor(PlayerHudS[1][playerid], -1);
    TextDrawSetOutline(PlayerHudS[1][playerid], 1);
    TextDrawSetProportional(PlayerHudS[1][playerid], 1);
    
    PlayerHudS[2][playerid] = TextDrawCreate(551.000000, 29.000000, " ");
    TextDrawBackgroundColor(PlayerHudS[2][playerid], 100);
    TextDrawFont(PlayerHudS[2][playerid], 2);
    TextDrawLetterSize(PlayerHudS[2][playerid], 0.470000, 2.000000);
    TextDrawColor(PlayerHudS[2][playerid], -1);
    TextDrawSetOutline(PlayerHudS[2][playerid], 1);
    TextDrawSetProportional(PlayerHudS[2][playerid], 1);
    
    PlayerHudS[3][playerid] = TextDrawCreate(551.000000, 47.000000, " ");
    TextDrawBackgroundColor(PlayerHudS[3][playerid], 100);
    TextDrawFont(PlayerHudS[3][playerid], 2);
    TextDrawLetterSize(PlayerHudS[3][playerid], 0.470000, 2.000000);
    TextDrawColor(PlayerHudS[3][playerid], -1);
    TextDrawSetOutline(PlayerHudS[3][playerid], 1);
    TextDrawSetProportional(PlayerHudS[3][playerid], 1);
    
    PlayerHudS[4][playerid] = TextDrawCreate(551.000000, 47.000000, " ");
    TextDrawBackgroundColor(PlayerHudS[4][playerid], 100);
    TextDrawFont(PlayerHudS[4][playerid], 2);
    TextDrawLetterSize(PlayerHudS[4][playerid], 0.470000, 2.000000);
    TextDrawColor(PlayerHudS[4][playerid], -1);
    TextDrawSetOutline(PlayerHudS[4][playerid], 1);
    TextDrawSetProportional(PlayerHudS[4][playerid], 1);
    
    for(new i = 0; i < 5; i++)
    {
    	if(i != 0) { TextDrawShowForPlayer(playerid, PlayerHudS[i][playerid]); }
    }
    TextDrawShowForPlayer(playerid,MoneyDraw[playerid]);
    FadeColorForPlayer(playerid,0,0,0,255,0,0,0,0,15,0);
    StopPlayerFade(playerid);
    BoomboxID[playerid] = -1;
    BoomboxModel[playerid] = EOS;
    ChosenStyle[playerid] = 0;
    Offer[playerid] = -1;
/*	if(!IsValidDynamic3DTextLabel(playerNametag[playerid]))
	{
		new Float:ghealth, Float:garmour;
		GetPlayerHealth(playerid, ghealth);
		GetPlayerArmour(playerid, garmour);
		format(playerTag[playerid], 128, "(( %s ))\n[%02d HP] - [%02d AP]", GetPlayerNameEx(playerid), ghealth, garmour);
		playerNametag[playerid] = CreateDynamic3DTextLabel(playerTag[playerid], GetPlayerColor(playerid), 0.0, 0.0, 0.2, 15.0, playerid);
	}*/
    PreloadAllAnimLibs(playerid);
    SetTimerEx("RealSpawn",500,false,"i",playerid);
    ResetPlayerMoney(playerid);
	SetPlayerSkin(playerid, cInfo[playerid][cSkin]);
	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
	{
	    if(HaveMask[i])
	   		ShowPlayerNameTagForPlayer(playerid, i, 0);
	}
	if(cInfo[playerid][cJailed] == 1)
	{
	    if(strcmp(cInfo[playerid][cJailedBy], "SYSTEM", false))
	    {
	        format(cInfo[playerid][cJailedBy], 25, "None");
			format(gString, sizeof gString, "ADMIN: %s has been admin-jailed by SYSTEM for %d minutes. [Reason: %s]", GetName(playerid), ((cInfo[playerid][cJailTime])/60), cInfo[playerid][cJailReason]);
			SendClientMessageToAll(COLOR_RED, gString);
			SetPlayerPos(playerid, 2524.3831,-1673.9191,14.8585);
			SetPlayerVirtualWorld(playerid, playerid+1);
		}
		else
		{
			SetPlayerPos(playerid, 2524.3831,-1673.9191,14.8585);
			SetPlayerVirtualWorld(playerid, playerid+1);
		}
		return 1;
	}
	else if(cInfo[playerid][cPrison] == 1)
	{
	    switch(cInfo[playerid][cPrisonCell])
	    {
	        case 1: SetPlayerPos(playerid, 216.0588,111.6941,999.0156);
	        case 2: SetPlayerPos(playerid, 220.0588,111.6941,999.0156);
	        case 3: SetPlayerPos(playerid, 224.0047,111.1394,999.0156);
	        case 4: SetPlayerPos(playerid, 228.0047,110.8394,999.0156);
	    }
	    SetPlayerInterior(playerid, 10);
	    return 1;
	}
	else if(Dead[playerid] == true)
	{
 		SetPlayerPos(playerid, DeathPos[playerid][0], DeathPos[playerid][1], DeathPos[playerid][2]);
 		SetPlayerVirtualWorld(playerid, deathVW[playerid]);
		SetPlayerInterior(playerid, deathInt[playerid]);
		SetPlayerFacingAngle(playerid,182.5439);
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid,"PED","KO_shot_face",4.0,0,1,1,1,0);
		ApplyAnimation(playerid,"PED","KO_shot_face",4.0,0,1,1,1,0);
		GameTextForPlayer(playerid, "~r~Dead", 4500, 3);
		SetPlayerHealth(playerid, 25);
		CPF(playerid, COLOR_RED, "You are brutally wounded, you have the ability to choose whether to \"/accept death\" or wait for the Paramedics to arrive.");
		return 1;
	}
	else if(cInfo[playerid][cCrashed] >= 1)
	{
	    SetPlayerPos(playerid, cInfo[playerid][cCrashPos][0], cInfo[playerid][cCrashPos][1], cInfo[playerid][cCrashPos][2]);
	    SetPlayerVirtualWorld(playerid, cInfo[playerid][cCrashVW]);
		SetPlayerInterior(playerid, cInfo[playerid][cCrashINT]);
		cInfo[playerid][cCrashed] = 0;
		GameTextForPlayer(playerid, "~r~Crashed~n~~w~Returned to last pos", 2500, 1);
	    return 1;
	}
	else if(cInfo[playerid][cRenting] > 0)
	{
	    new h = cInfo[playerid][cRenting];
	    SetPlayerPos(playerid, hInfo[h][X_IN], hInfo[h][Y_IN], hInfo[h][Z_IN]);
	    SetPlayerVirtualWorld(playerid, hInfo[h][VirtualWorld]);
		SetPlayerInterior(playerid, hInfo[h][INT]);
	    return 1;
	}
	SetPlayerPos(playerid, cInfo[playerid][cSpawn][0], cInfo[playerid][cSpawn][1], cInfo[playerid][cSpawn][2]);
	SetPlayerFacingAngle(playerid, 0);
	SetCameraBehindPlayer(playerid);
	return 1;
}
