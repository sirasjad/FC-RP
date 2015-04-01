/*
	OnPlayerAirbreak(playerid);

	This include is one of the only accurate airbreak detecting
	methods developed in SA-MP.

	Created by Emmet on Wednesday, November 6, 2013.
*/
static g_AB_LastTick[MAX_PLAYERS];
static Float:g_AB_LastPosition[MAX_PLAYERS][3];

forward OnPlayerAirbreak(playerid);

public OnFilterScriptInit()
{
	for (new i = 0; i < MAX_PLAYERS; i ++)
	{
		if (!IsPlayerConnected(i) || GetPlayerState(i) != PLAYER_STATE_ONFOOT) continue;
		AB_StorePos(i, 3);
		continue;
	}
	return CallLocalFunction("AB_OnFilterScriptInit", "");
}

public OnPlayerConnect(playerid)
{
	AB_StorePos(playerid, 1);
	return CallLocalFunction("AB_OnPlayerConnect", "d", playerid);
}

public OnPlayerSpawn(playerid)
{
    AB_StorePos(playerid, 3);
	return CallLocalFunction("AB_OnPlayerSpawn", "d", playerid);
}

public OnPlayerDeath(playerid, killerid, reason)
{
    AB_StorePos(playerid, 3);
 	return CallLocalFunction("AB_OnPlayerDeath", "ddd", playerid, killerid, reason);
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (oldstate == PLAYER_STATE_SPECTATING)
	{
	    AB_StorePos(playerid);
	}
	return CallLocalFunction("AB_OnPlayerStateChange", "ddd", playerid, newstate, oldstate);
}

public OnPlayerUpdate(playerid)
{
	AB_Detect(playerid);
	return CallLocalFunction("AB_OnPlayerUpdate", "d", playerid);
}

stock AB_Detect(playerid)
{
	if (IsPlayerNPC(playerid) || GetPlayerState(playerid) == 0 || GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3 || GetPlayerState(playerid) == 7 || GetPlayerState(playerid) == 9)
	{
        AB_StorePos(playerid, 1);
	 	return 0;
	}
	if (IsPlayerConnected(playerid) && !IsPlayerInAnyVehicle(playerid))
	{
		if ((gettime() - g_AB_LastTick[playerid]) >= 1)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

		    if (floatabs(g_AB_LastPosition[playerid][2] - z) < 1.0)
		    {
				new Float:distance = GetPlayerDistanceFromPoint(playerid, g_AB_LastPosition[playerid][0], g_AB_LastPosition[playerid][1], g_AB_LastPosition[playerid][2]);
				if (floatabs(distance) >= 65.0 && (floatabs(g_AB_LastPosition[playerid][1] - y) >= 45.0 || floatabs(g_AB_LastPosition[playerid][0] - x) >= 45.0))
				{
					CallLocalFunction("OnPlayerAirbreak", "d", playerid);
				}
		    }
			AB_StorePos(playerid);
		}
	}
	return 1;
}

stock AB_StorePos(playerid, extra=0)
{
 	if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
	{
	 	GetPlayerPos(playerid, g_AB_LastPosition[playerid][0], g_AB_LastPosition[playerid][1], g_AB_LastPosition[playerid][2]);
	}
	g_AB_LastTick[playerid] = gettime() + extra;
	return 1;
}

stock AB_SetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
	AB_StorePos(playerid, 3);
	return SetPlayerPos(playerid, x, y, z);
}

stock AB_PutPlayerInVehicle(playerid, vehicleid, seatid)
{
	AB_StorePos(playerid, 3);
	return PutPlayerInVehicle(playerid, vehicleid, seatid);
}

stock AB_SetPlayerPosFindZ(playerid, Float:x, Float:y, Float:z)
{
    AB_StorePos(playerid, 3);
	return SetPlayerPosFindZ(playerid, x, y, z);
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif

#if defined _ALS_SetPlayerPos
	#undef SetPlayerPos
#else
	#define _ALS_SetPlayerPos
#endif

#if defined _ALS_SetPlayerPosFindZ
	#undef SetPlayerPosFindZ
#else
	#define _ALS_SetPlayerPosFindZ
#endif

#if defined _ALS_PutPlayerInVehicle
	#undef PutPlayerInVehicle
#else
	#define _ALS_PutPlayerInVehicle
#endif

#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif

#define OnPlayerConnect 	AB_OnPlayerConnect
#define OnPlayerSpawn 		AB_OnPlayerSpawn
#define OnPlayerDeath 		AB_OnPlayerDeath
#define OnPlayerUpdate 		AB_OnPlayerUpdate
#define OnFilterScriptInit  AB_OnFilterScriptInit
#define OnPlayerStateChange	AB_OnPlayerStateChange

#define SetPlayerPos        AB_SetPlayerPos
#define SetPlayerPosFindZ   AB_SetPlayerPosFindZ
#define PutPlayerInVehicle  AB_PutPlayerInVehicle

forward AB_OnFilterScriptInit();
forward AB_OnPlayerConnect(playerid);
forward AB_OnPlayerSpawn(playerid);
forward AB_OnPlayerUpdate(playerid);
forward AB_OnPlayerDeath(playerid, killerid, reason);
forward AB_OnPlayerStateChange(playerid, newstate, oldstate);