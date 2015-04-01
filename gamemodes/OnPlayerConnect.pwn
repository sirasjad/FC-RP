==============================================================================
== OnPlayerConnect
==============================================================================*/

public OnPlayerConnect(playerid)
{
    checkserialban(playerid);
    
	// Dealership Textdraw
	dTextdraw[playerid][0] = CreatePlayerTextDraw(playerid, 0.000000, 338.000000, ".");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][0], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][0], 0.500000, 13.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][0], 255);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][0], 1);
	PlayerTextDrawUseBox(playerid, dTextdraw[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, dTextdraw[playerid][0], 255);
	PlayerTextDrawTextSize(playerid, dTextdraw[playerid][0], 750.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][0], 0);

	dTextdraw[playerid][1] = CreatePlayerTextDraw(playerid, 533.000000, 432.000000, "Buy");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][1], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][1], 0.270000, 1.299999);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][1], 1);
	PlayerTextDrawUseBox(playerid, dTextdraw[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, dTextdraw[playerid][1], 1117657343);
	PlayerTextDrawTextSize(playerid, dTextdraw[playerid][1], 645.000000, 56.000000);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][1], 1);

	dTextdraw[playerid][2] = CreatePlayerTextDraw(playerid, 607.000000, 341.000000, "Exit");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][2], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][2], 0.270000, 1.299999);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][2], 1);
	PlayerTextDrawUseBox(playerid, dTextdraw[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, dTextdraw[playerid][2], -485617921);
	PlayerTextDrawTextSize(playerid, dTextdraw[playerid][2], 599.000000, 56.000000);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][2], 1);

	dTextdraw[playerid][3] = CreatePlayerTextDraw(playerid, 53.000000, 350.000000, "~g~Model: ~w~Buffalo");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][3], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][3], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][3], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][3], 0);

	dTextdraw[playerid][4] = CreatePlayerTextDraw(playerid, 53.000000, 375.000000, "~g~Price: ~w~$52,000");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][4], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][4], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][4], 0);

	dTextdraw[playerid][5] = CreatePlayerTextDraw(playerid, 53.000000, 400.000000, "~g~Seats: ~w~2");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][5], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][5], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][5], 0);

	dTextdraw[playerid][6] = CreatePlayerTextDraw(playerid, 124.000000, 350.000000, "~>~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][6], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][6], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][6], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][6], 1);

	dTextdraw[playerid][7] = CreatePlayerTextDraw(playerid, 43.000000, 350.000000, "~<~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][7], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][7], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][7], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][7], 1);

	dTextdraw[playerid][8] = CreatePlayerTextDraw(playerid, 160.000000, 363.000000, "~g~Color 1: ~w~155");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][8], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][8], 0.210000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][8], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][8], 0);

	dTextdraw[playerid][9] = CreatePlayerTextDraw(playerid, 215.000000, 363.000000, "~>~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][9], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][9], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][9], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][9], 1);

	dTextdraw[playerid][10] = CreatePlayerTextDraw(playerid, 150.000000, 363.000000, "~<~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][10], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][10], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][10], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][10], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][10], 1);

	dTextdraw[playerid][11] = CreatePlayerTextDraw(playerid, 160.000000, 390.000000, "~g~Color 2: ~w~20");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][11], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][11], 0.210000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][11], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][11], 0);

	dTextdraw[playerid][12] = CreatePlayerTextDraw(playerid, 150.000000, 390.000000, "~<~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][12], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][12], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][12], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][12], 1);

	dTextdraw[playerid][13] = CreatePlayerTextDraw(playerid, 214.000000, 390.000000, "~>~");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][13], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][13], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][13], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][13], -1);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][13], 1);

	dTextdraw[playerid][14] = CreatePlayerTextDraw(playerid, 0.000000, -2.000000, ".");
	PlayerTextDrawBackgroundColor(playerid, dTextdraw[playerid][14], 255);
	PlayerTextDrawFont(playerid, dTextdraw[playerid][14], 1);
	PlayerTextDrawLetterSize(playerid, dTextdraw[playerid][14], 0.500000, 13.000000);
	PlayerTextDrawColor(playerid, dTextdraw[playerid][14], 255);
	PlayerTextDrawSetOutline(playerid, dTextdraw[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, dTextdraw[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, dTextdraw[playerid][14], 1);
	PlayerTextDrawUseBox(playerid, dTextdraw[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, dTextdraw[playerid][14], 255);
	PlayerTextDrawTextSize(playerid, dTextdraw[playerid][14], 750.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid, dTextdraw[playerid][14], 0);

	// In OnGameModeInit
	LocationName[playerid] = CreatePlayerTextDraw(playerid, 10.000000, 435.000000, "Idlewood");
	PlayerTextDrawBackgroundColor(playerid, LocationName[playerid], 255);
	PlayerTextDrawFont(playerid, LocationName[playerid], 2);
	PlayerTextDrawLetterSize(playerid, LocationName[playerid], 0.260000, 1.000000);
	PlayerTextDrawColor(playerid, LocationName[playerid], -1);
	PlayerTextDrawSetOutline(playerid, LocationName[playerid], 1);
	PlayerTextDrawSetProportional(playerid, LocationName[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, LocationName[playerid], 0);

    AttachingWeapon[playerid] = -1;
    Bag_Page[playerid] = 0;
    for(new i = 0,j = MAX_ITEMS; i < j; i ++)
    {
        Bag[playerid][bagItemID][i] = 0;
        Bag[playerid][bagItem][i] = 0;
        Bag[playerid][bagItemAmount][i] = 0;
        Bag[playerid][bagItemLoaded][i] = 0;
        Bag[playerid][bagItemLoadAmount][i] = 0;
        Bag[playerid][bagItemAttached][i] = 0;
    }
	InHouse[playerid] = 0;
    TextDrawHideForPlayer(playerid, LightTD);
    Tutorial[playerid] = 0;
    EditingFurn[playerid] = false;
    BuyingFurn[playerid] = false;
	JobPos[playerid][0] = 0.0;
	JobPos[playerid][1] = 0.0;
	JobPos[playerid][2] = 0.0;
    SeeHUD[playerid] = true;
    Tutorial[playerid] = 0;
    FadePlayerConnect(playerid);
    BoomboxID[playerid] = -1;
    BoomboxModel[playerid] = EOS;
    KillTimer(TaxiTimer[playerid]);
    TaxiCount[playerid] = 0;
	TaxiTarget[playerid] = -1;
    TaxiFare[playerid] = 0;
    TaxiDuty[playerid] = false;
    RequestedTaxi[playerid] = false;
	Downed[playerid] = false;
    KillTimer(CountDownTimer[playerid]);
    KillTimer(DownTimer[playerid]);
 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		BlockedPM[playerid][i] = false;

    ShowPM[playerid] = false;
    Offer[playerid] = -1;
    KillTimer(AFKTimer[playerid]);
    if(IsValidDynamic3DTextLabel(playerNametag[playerid]))
	{
 		DestroyDynamic3DTextLabel(playerNametag[playerid]);
 	}
    AdminSpectate[playerid] = false;
	OnDuty[playerid] = false;
    AdminDuty[playerid] = false;
    DevMode[playerid] = false;
    ModeratorDuty[playerid] = false;
	SentHelpmea[playerid] = false;
    ShowPM[playerid] = false;
    ModeratorDuty[playerid] = false;
	cInfo[playerid][cMoney] = 0;
    DLic[playerid][TookTest] = false;
    DLic[playerid][Warns] = 0;
    DLic[playerid][Step] = 0;
    pInfo[playerid][SQLID] = 0;
    pInfo[playerid][pName] = EOS;
    pInfo[playerid][pPassword] = EOS;
    pInfo[playerid][pCharacter1] = EOS;
    pInfo[playerid][pCharacter2] = EOS;
    pInfo[playerid][pCharacter3] = EOS;
    pInfo[playerid][AdminLevel] = 0;
    pInfo[playerid][pBanned] = 0;
    pInfo[playerid][pBannedBy] = EOS;
    pInfo[playerid][pBanReason] = EOS;
    pInfo[playerid][pForum] = EOS;
    pInfo[playerid][pEmail] = EOS;
    pInfo[playerid][pStatus] = 0;
	TogglePlayerSpectating(playerid, true);
	SetPlayerCamera(playerid, 2054.8779,-1919.4993,34.9440, 2054.8779,-1919.4993,34.9440, false);
    LoadCharacters(playerid);
    ClearChat(playerid);
	// Clearing player chat before login (To avoid spam on GMX or Admin Messages)
	// Connecting player, all settings applied towards the player
    SetPlayerColor(playerid, 0x00000000);
	format(_query, sizeof(_query), "SELECT * FROM `players` WHERE `Name` = '%s'", GetName(playerid));
	mysql_query(_query);
	mysql_store_result();
	if(mysql_num_rows())
	{
	    new plIP[22];
	    GetPlayerIp(playerid, plIP, 22);
	    if(pInfo[playerid][pBanned] >= 1)
     	{
	        CPF(playerid, COLOR_RED, "You are banned from this server.");
	        CPF(playerid, COLOR_RED, "Banned IP Address: "COL_WHITE"%s", plIP);
	        CPF(playerid, COLOR_RED, "Forum: "COL_WHITE"%s", pInfo[playerid][pName]);
            CPF(playerid, COLOR_RED, "Ban Reason: "COL_WHITE"%s", pInfo[playerid][pBanReason]);
	        KickEx(playerid);
	        return true;
     	}
     	
	    new count = 0;
	 	for(new i = 0,j = GetMaxPlayers(); i < j; i ++)
		{
		    if(!IsPlayerConnected(i)) continue;
		    if(i == playerid) continue;
		    if(strcmp(GetName(playerid), pInfo[i][pName], false) == 0 && Logged[i])
		        count ++;
		}
		
		if(count > 0) return CPF(playerid, -1, ""COL_YELLOW"This account is already logged in."), KickEx(playerid);
		new loginstring[256];
	    format(loginstring, sizeof(loginstring), ""COL_WHITE"Welcome back to {33aa33}Project Reality Roleplay"COL_WHITE", %s.\nEnter your password below to login:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", loginstring, "Login", "Exit");
	}
	else
	{
		format(gString, sizeof(gString), ""COL_WHITE"Welcome to {33aa33}Project Reality Roleplay"COL_WHITE", %s.\nEnter the desired password you wish to have:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register", gString, "Register", "Exit");
		SendClientMessage(playerid, COLOR_RED, "Have you remembered register your SA-MP client with your forum username?");
   		SendClientMessage(playerid, COLOR_RED, "If not, please disconnect and change your SA-MP client username to your desired forum name, this will be your login alias (IG & UCP).");
	}
 	mysql_free_result();

	// Varaibles
	callingEm[playerid] = 0;
	AFKCount[playerid] = 0;
	Cuffed[playerid] = false;
    TazerHolster[playerid] = 1;
	FriskOffer[playerid] = -1;
    Fishes[playerid] = 0;
    FishLBS[playerid] = 0;
	IsFishing[playerid] = false;
	AdminSpectate[playerid] = false;
	Spec[playerid] = -1;
	Dead[playerid] = false;
	DeathPos[playerid][0] = 0.0;
	DeathPos[playerid][1] = 0.0;
	DeathPos[playerid][2] = 0.0;
	deathInt[playerid] = 0;
	deathVW[playerid] = 0;
    KillTimer(CountDownTimer[playerid]);
	FactionChat[playerid] = true;
	AdminChat[playerid] = true;
	SupportChat[playerid] = true;
	BothChat[playerid] = true;
	SentReport[playerid] = false;
	SentHelpme[playerid] = false;
	CarryingCrate[playerid] = false;
	Mission[playerid] = false;
    ShowCP[playerid] = false;
	// Gun Anticheat
 	for(new i=0;i<47;i++) PlayerWeapons[playerid][i]=false; // clears the value
  	Spawned[playerid]=false;
    Delete3DTextLabel(PlayerDamage[playerid]);
    KillTimer(PlayerDamageTimer[playerid]);
	// Background
	RemovePlayerAttachedObject(playerid, 1);

	// Content & Varaibles
	HaveGasCan[playerid] = false, HaveDice[playerid] = false, Logged[playerid] = false, InCall[playerid] = -1,
	CallOffer[playerid] = -1, GroupInvite[playerid] = 0, FactionInvite[playerid] = 0, Calling[playerid] = 0,
    AnticheatSpam[playerid] = false, AdminDuty[playerid] = false, InHouse[playerid] = -1, InInterior[playerid] = -1,
	InBiz[playerid] = -1, OnDuty[playerid] = false;
	DevMode[playerid] = false;
	SetPlayerTime(playerid, ServerTime, 0);
	// Buy House and Business Textdraw
	// KMH & Vehicle Speedometer & Fuel by Frenzy
	Textdraw2[playerid] = CreatePlayerTextDraw(playerid, 498.000000, 100.000000, "Radio Slot: 1");
	PlayerTextDrawBackgroundColor(playerid, Textdraw2[playerid], 255);
	PlayerTextDrawFont(playerid, Textdraw2[playerid], 3);
	PlayerTextDrawLetterSize(playerid, Textdraw2[playerid], 0.320000, 1.000000);
	PlayerTextDrawColor(playerid, Textdraw2[playerid], -1);
	PlayerTextDrawSetOutline(playerid, Textdraw2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Textdraw2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Textdraw2[playerid], 0);

    if(cInfo[playerid][cJob] == GARBAGE_MAN_JOB)
    {
            RemovePlayerAttachedObject(playerid, 9);
            Mission[playerid] = false;
            CarryingBag[playerid] = false;
            DestroyDynamicCP(Mission_CP[playerid]);
            RemovePlayerMapIcon(playerid, Mission_Map[playerid]);

    }

    TD_GARBAGE_BAGS[playerid] = CreatePlayerTextDraw(playerid, 13.000000, 268.000000, "Garbage Bags: None");
    PlayerTextDrawBackgroundColor(playerid, TD_GARBAGE_BAGS[playerid], 255);
    PlayerTextDrawFont(playerid, TD_GARBAGE_BAGS[playerid], 3);
    PlayerTextDrawLetterSize(playerid, TD_GARBAGE_BAGS[playerid], 0.300000, 1.000000);
    PlayerTextDrawColor(playerid, TD_GARBAGE_BAGS[playerid], -1);
    PlayerTextDrawSetOutline(playerid, TD_GARBAGE_BAGS[playerid], 1);
    PlayerTextDrawSetProportional(playerid, TD_GARBAGE_BAGS[playerid], 1);
    PlayerTextDrawSetShadow(playerid, TD_GARBAGE_BAGS[playerid], 1);

	// Delivery man job
    TD_BIZ_NAME[playerid] = CreatePlayerTextDraw(playerid, 13.000000, 236.000000, "~y~Business Name: ~w~None");
    PlayerTextDrawBackgroundColor(playerid, TD_BIZ_NAME[playerid], 255);
    PlayerTextDrawFont(playerid, TD_BIZ_NAME[playerid], 3);
    PlayerTextDrawLetterSize(playerid, TD_BIZ_NAME[playerid], 0.300000, 1.000000);
    PlayerTextDrawColor(playerid, TD_BIZ_NAME[playerid], -1);
    PlayerTextDrawSetOutline(playerid, TD_BIZ_NAME[playerid], 1);
    PlayerTextDrawSetProportional(playerid, TD_BIZ_NAME[playerid], 1);
    PlayerTextDrawSetShadow(playerid, TD_BIZ_NAME[playerid], 1);

    TD_BIZ_ADRESS[playerid] = CreatePlayerTextDraw(playerid, 13.000000, 252.000000, "~y~Business Address: ~w~None");
    PlayerTextDrawBackgroundColor(playerid, TD_BIZ_ADRESS[playerid], 255);
    PlayerTextDrawFont(playerid, TD_BIZ_ADRESS[playerid], 3);
    PlayerTextDrawLetterSize(playerid, TD_BIZ_ADRESS[playerid], 0.300000, 1.000000);
    PlayerTextDrawColor(playerid, TD_BIZ_ADRESS[playerid], -1);
    PlayerTextDrawSetOutline(playerid, TD_BIZ_ADRESS[playerid], 1);
    PlayerTextDrawSetProportional(playerid, TD_BIZ_ADRESS[playerid], 1);
    PlayerTextDrawSetShadow(playerid, TD_BIZ_ADRESS[playerid], 1);

    TD_CRATES[playerid] = CreatePlayerTextDraw(playerid, 13.000000, 268.000000, "~y~Crates: ~w~None");
    PlayerTextDrawBackgroundColor(playerid, TD_CRATES[playerid], 255);
    PlayerTextDrawFont(playerid, TD_CRATES[playerid], 3);
    PlayerTextDrawLetterSize(playerid, TD_CRATES[playerid], 0.300000, 1.000000);
    PlayerTextDrawColor(playerid, TD_CRATES[playerid], -1);
    PlayerTextDrawSetOutline(playerid, TD_CRATES[playerid], 1);
    PlayerTextDrawSetProportional(playerid, TD_CRATES[playerid], 1);
    PlayerTextDrawSetShadow(playerid, TD_CRATES[playerid], 1);

    // Pizza Job WallCrik
    PizzaDraw = CreatePlayerTextDraw(playerid,50.000000, 319.000000, "~g~Timer: ~w~0 seconds~n~~g~Pizza Warmth: ~r~100%");
	PlayerTextDrawBackgroundColor(playerid,PizzaDraw, 255);
	PlayerTextDrawFont(playerid,PizzaDraw, 1);
	PlayerTextDrawLetterSize(playerid,PizzaDraw, 0.209999, 1.000000);
	PlayerTextDrawColor(playerid,PizzaDraw, -1);
	PlayerTextDrawSetOutline(playerid,PizzaDraw, 1);
	PlayerTextDrawSetProportional(playerid,PizzaDraw, 1);
	PlayerTextDrawSetShadow(playerid,PizzaDraw, 1);
	PlayerTextDrawSetSelectable(playerid,PizzaDraw, 0);
	PlayerTextDrawHide(playerid, PizzaDraw);

	// Furniture System - Removing House Objects
	RemoveBuildingForPlayer(playerid, 2865, 2499.5000, -1712.2188, 1014.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 2821, 2500.9297, -1710.3516, 1014.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1509, 2501.1953, -1710.6953, 1015.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 2073, 2496.3359, -1709.9063, 1017.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 2073, 2498.6016, -1707.6797, 1021.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 2073, 2492.1875, -1707.6797, 1021.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 2277, 2494.7578, -1705.3281, 1018.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 1512, 2500.8906, -1706.5703, 1015.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1512, 2501.1172, -1705.4766, 1015.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1509, 2501.1953, -1706.8594, 1015.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1520, 2501.2969, -1707.2344, 1014.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1520, 2501.2969, -1707.3594, 1014.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 2830, 2491.8359, -1702.9375, 1014.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2073, 2493.4766, -1702.7969, 1021.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 2306, 2491.8359, -1701.2813, 1017.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 1794, 2492.9688, -1701.8516, 1017.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 2306, 2494.0156, -1701.3125, 1017.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 2247, 2494.1172, -1700.3359, 1018.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 14478, 2494.4297, -1698.3359, 1014.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1740, 2495.2891, -1704.4922, 1017.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 2816, 2494.8047, -1702.5156, 1018.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 2272, 2496.2188, -1702.5234, 1018.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 14477, 2501.0703, -1697.6172, 1016.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 14490, 2501.0703, -1697.6172, 1016.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 14491, 2501.0703, -1697.6172, 1016.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 2252, 2493.0469, -1697.1875, 1014.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2827, 2497.6563, -1697.0703, 1014.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 14489, 2490.4453, -1694.8672, 1015.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 2028, 2491.3438, -1694.7656, 1013.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 2253, 2532.8047, -1677.4766, 1014.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 2100, 2532.0938, -1671.7344, 1014.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 2869, 2538.0391, -1676.7188, 1014.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 14493, 2535.8516, -1671.5703, 1016.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 2046, 2806.2266, -1174.5703, 1026.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 2049, 2805.2109, -1173.4922, 1026.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 2241, 2805.6875, -1173.5156, 1025.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2810.3047, -1172.8516, 1025.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2810.3047, -1172.8516, 1025.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2810.3047, -1172.8516, 1024.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2810.3047, -1172.8516, 1024.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2811.6016, -1172.8516, 1024.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2811.6016, -1172.8516, 1024.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2811.6016, -1172.8516, 1025.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2811.6016, -1172.8516, 1025.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 2048, 2805.2109, -1172.0547, 1026.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 2055, 2805.1953, -1170.5391, 1026.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 2060, 2810.0234, -1171.2266, 1024.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 2064, 2810.8359, -1171.8984, 1025.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 2068, 2809.2031, -1169.3672, 1027.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 2069, 2806.3906, -1166.8203, 1024.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1764, 2808.6563, -1166.9531, 1024.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2100, 2805.5078, -1165.5625, 1024.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2276, 2809.2109, -1165.2734, 1026.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 1821, 2810.5938, -1167.6172, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2053, 2810.6094, -1167.5781, 1024.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 2058, 2809.6406, -1165.3359, 1024.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2272, 2811.3438, -1165.2734, 1026.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 2297, 2811.0234, -1165.0625, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 1765, 2811.4766, -1168.4063, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2241, 2811.6875, -1168.5078, 1028.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 2059, 2814.8359, -1173.4766, 1025.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 2116, 2814.3047, -1173.4219, 1024.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 2050, 2813.1250, -1173.3359, 1026.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1736, 2812.8281, -1172.2969, 1027.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 2051, 2813.1250, -1171.2891, 1026.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 2121, 2813.9531, -1172.4609, 1025.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 2121, 2815.3828, -1172.4844, 1025.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 2275, 2812.6094, -1168.1094, 1026.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 2156, 2813.6484, -1167.0000, 1024.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2255, 2814.5703, -1169.2891, 1029.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 2047, 2817.3125, -1170.9688, 1031.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 2160, 2815.8984, -1164.9063, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2159, 2817.2656, -1164.9063, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2157, 2818.7109, -1173.9531, 1024.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2157, 2818.6406, -1164.9063, 1024.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2300, 2818.6484, -1166.5078, 1028.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 2046, 2819.4453, -1174.0000, 1026.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 2091, 2819.8047, -1165.6641, 1028.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 2157, 2820.6328, -1167.3125, 1024.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2171.5078, 647.1172, 1054.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 1738, -2171.4766, 643.6875, 1057.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 2074, -2170.2813, 638.3906, 1054.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 2233, -2167.4219, 640.7500, 1056.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2296, -2168.4219, 643.7344, 1056.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2028, -2167.5859, 644.6875, 1056.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 2108, -2168.3125, 646.7656, 1056.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2168.3125, 647.1172, 1054.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 2074, -2164.7500, 637.4375, 1057.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 2233, -2165.4531, 640.7500, 1056.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2225, -2166.2344, 640.9297, 1056.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 14544, -2164.7734, 641.1172, 1053.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 14554, -2164.5469, 641.1016, 1056.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1819, -2167.2422, 643.7031, 1056.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 2074, -2166.3984, 644.2031, 1060.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2165.0156, 645.0781, 1054.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 2288, -2166.7344, 646.7734, 1058.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2165.0156, 647.1172, 1054.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2162.8203, 636.9063, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2161.6172, 636.9063, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2159.1797, 636.9063, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2157.6094, 636.9063, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2162.8203, 638.8594, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 2707, -2157.6094, 638.9297, 1058.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 14535, -2160.2031, 640.8516, 1058.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 14545, -2160.1172, 639.5625, 1053.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 2074, -2160.1094, 644.2031, 1060.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 14543, -2163.6563, 644.9063, 1058.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 2271, -2161.9609, 646.7422, 1058.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 2270, -2158.4141, 646.7656, 1058.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 2108, -2163.8438, 646.9844, 1056.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1742, -2160.3906, 647.3906, 1056.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1738, -2158.3906, 647.0859, 1057.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 14720, 216.5547, 1292.2188, 1081.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 14719, 218.7422, 1290.8203, 1082.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 2522, 236.9844, 1206.6406, 1079.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 2520, 236.7500, 1208.1797, 1079.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 2528, 234.5781, 1209.2344, 1079.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 2523, 232.4375, 1209.2656, 1079.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 14728, 238.7344, 1036.9688, 1085.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 2520, 252.0234, 1032.6328, 1083.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 2522, 254.7344, 1033.0703, 1083.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 2528, 254.8125, 1034.4141, 1083.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 2523, 254.7656, 1036.1328, 1083.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 2523, 284.5078, 1480.5156, 1079.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 2528, 284.4063, 1482.2813, 1079.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 2522, 284.4844, 1484.4219, 1079.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 2520, 287.1328, 1483.4297, 1079.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1741, 2261.6953, -1223.0781, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2088, 2258.1406, -1220.5859, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2090, 2258.5938, -1221.5469, 1048.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 2249, 2251.3594, -1218.1797, 1048.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 2528, 2254.4063, -1218.2734, 1048.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 2138, 2247.5547, -1213.9219, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2138, 2247.5547, -1212.9375, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2121, 2250.3047, -1213.9375, 1048.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 2526, 2252.4297, -1215.4531, 1048.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 2523, 2254.1953, -1215.4531, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2297, 2255.4219, -1213.5313, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2248, 2262.3906, -1215.5469, 1048.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1816, 2261.4141, -1213.4531, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2249, 2247.2969, -1212.1641, 1049.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 2249, 2247.2969, -1208.8594, 1049.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 2139, 2247.5625, -1211.9531, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2136, 2247.5469, -1210.9688, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2303, 2247.5469, -1208.9844, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2138, 2247.5547, -1207.9766, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2305, 2247.5547, -1206.9922, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2109, 2250.2813, -1212.2500, 1048.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 2121, 2249.2344, -1211.4531, 1048.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 2121, 2250.3047, -1210.8984, 1048.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 2135, 2248.5234, -1206.9922, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2319, 2250.3438, -1206.9609, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1760, 2261.4609, -1212.0625, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2126, 2258.1094, -1210.3750, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2247, 2258.4766, -1209.7891, 1048.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 2099, 2262.8047, -1208.4922, 1048.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2254, 2254.1172, -1206.5000, 1050.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 2240, 2254.6328, -1207.2734, 1048.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 2252, 2256.2109, -1206.1016, 1048.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 2235, 2256.2188, -1206.8594, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1760, 2257.6172, -1207.7266, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2235, 2261.4297, -1206.2031, 1048.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 2252, 2262.1172, -1206.1016, 1048.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 15025, 2249.6641, -1138.1250, 1051.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 15027, 2250.1016, -1132.5078, 1049.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 1731, 2363.5703, -1134.3359, 1052.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 2077, 2357.5469, -1134.1875, 1050.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 2298, 2361.2969, -1134.1484, 1049.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 2141, 2367.5625, -1135.3906, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2339, 2367.5625, -1134.3906, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2134, 2367.5625, -1133.3906, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2077, 2357.5469, -1131.5234, 1050.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 2271, 2357.8594, -1132.8828, 1051.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 2087, 2360.2969, -1129.9766, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2103, 2360.8281, -1130.1406, 1051.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1731, 2363.5703, -1129.6016, 1052.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 2279, 2369.8125, -1135.4375, 1052.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 2125, 2370.5781, -1134.0313, 1050.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 2125, 2371.7500, -1133.5938, 1050.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 2278, 2372.1875, -1135.4297, 1052.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 2075, 2370.8281, -1132.8750, 1053.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 2030, 2371.2266, -1132.9219, 1050.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 2812, 2371.2969, -1133.0156, 1050.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 2125, 2371.7500, -1131.8594, 1050.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 2125, 2370.5781, -1131.8594, 1050.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 2288, 2373.3828, -1130.4531, 1051.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2141, 2374.5000, -1135.3906, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 2132, 2374.5000, -1131.3906, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 2339, 2374.5078, -1134.3828, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 2134, 2374.5078, -1133.3828, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 2339, 2374.5078, -1130.3828, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 2225, 2369.1797, -1125.8047, 1049.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 1731, 2364.8828, -1125.6094, 1052.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 2260, 2369.7188, -1123.8594, 1052.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 2331, 2367.3672, -1123.1563, 1050.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 2302, 2364.5547, -1122.9688, 1049.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 2259, 2368.6094, -1122.5078, 1052.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 2333, 2367.5703, -1122.1484, 1049.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 2255, 2361.5703, -1122.1484, 1052.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1734, 2364.8828, -1122.0469, 1053.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 2811, 2372.7031, -1128.9141, 1049.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 15061, 2371.6094, -1128.1875, 1051.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 15062, 2371.6094, -1128.1875, 1051.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1734, 2372.5313, -1125.3047, 1053.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 2868, 2370.1250, -1125.2344, 1049.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 1703, 2370.3906, -1124.4375, 1049.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1822, 2372.0938, -1124.2188, 1049.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 2828, 2374.2578, -1129.2578, 1050.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 2084, 2374.4688, -1129.2109, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1703, 2374.6797, -1122.5313, 1049.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 2281, 2375.6641, -1128.1016, 1051.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 2868, 2374.9766, -1125.2344, 1049.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 2280, 2375.6484, -1122.3828, 1051.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 2227, 2370.2344, -1120.5859, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1742, 2366.6953, -1119.2500, 1049.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 1703, 2371.6016, -1121.5078, 1049.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 2227, 2375.5859, -1120.9922, 1049.8750, 0.25);

	// Pershing Square
	RemoveBuildingForPlayer(playerid, 4024, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 4044, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 4057, 1479.5547, -1693.1406, 19.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 1527, 1448.2344, -1755.8984, 14.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 4210, 1479.5625, -1631.4531, 12.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 713, 1457.9375, -1620.6953, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 713, 1496.8672, -1707.8203, 13.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1430.1719, -1719.4688, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1451.6250, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 4002, 1479.8672, -1790.3984, 56.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 3980, 1481.1875, -1785.0703, 22.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1467.9844, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1485.1719, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1713.5078, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1716.7031, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1505.1797, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1713.7031, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1289, 1504.7500, -1711.8828, 13.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1704.7656, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1433.7109, -1702.3594, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1433.7109, -1676.6875, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1692.2344, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1433.7109, -1656.2500, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1433.7109, -1636.2344, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1445.8125, -1650.0234, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1433.7109, -1619.0547, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1443.2031, -1592.9453, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1457.7266, -1710.0625, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1461.6563, -1707.6875, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1704.6406, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 1463.0625, -1701.5703, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1702.5313, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1457.5547, -1697.2891, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1694.0469, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1479.3828, -1692.3906, 15.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 4186, 1479.5547, -1693.1406, 19.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1461.1250, -1687.5625, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 1463.0625, -1690.6484, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1458.6172, -1684.1328, 11.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1457.2734, -1666.2969, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1682.7188, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1471.4063, -1666.1797, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1479.3828, -1682.3125, 15.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1458.2578, -1659.2578, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1449.8516, -1655.9375, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1477.9375, -1652.7266, 15.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1479.6094, -1653.2500, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1457.3516, -1650.5703, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1454.4219, -1642.4922, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1467.8516, -1646.5938, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1472.8984, -1651.5078, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1465.9375, -1639.8203, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1231, 1466.4688, -1637.9609, 15.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1449.5938, -1635.0469, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1467.7109, -1632.8906, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, 1465.8906, -1629.9766, 15.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1472.6641, -1627.8828, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1479.4688, -1626.0234, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3985, 1479.5625, -1631.4531, 12.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 4206, 1479.5547, -1639.6094, 13.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, 1465.8359, -1608.3750, 15.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 1229, 1466.4844, -1598.0938, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1451.3359, -1596.7031, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1471.3516, -1596.7031, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1704.5938, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 700, 1494.2109, -1694.4375, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1693.7344, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1496.9766, -1686.8516, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1494.1406, -1689.2344, 11.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1682.6719, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1480.6094, -1666.1797, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1488.2266, -1666.1797, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1486.4063, -1651.3906, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1491.3672, -1646.3828, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1493.1328, -1639.4531, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1486.1797, -1627.7656, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1280, 1491.2188, -1632.6797, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, 1494.4141, -1629.9766, 15.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1232, 1494.3594, -1608.3750, 15.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1488.5313, -1596.7031, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1229, 1498.0547, -1598.0938, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1288, 1504.7500, -1705.4063, 13.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1287, 1504.7500, -1704.4688, 13.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1286, 1504.7500, -1695.0547, 13.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1285, 1504.7500, -1694.0391, 13.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1498.9609, -1684.6094, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1504.1641, -1662.0156, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1504.7188, -1670.9219, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1503.1875, -1621.1250, 11.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1501.2813, -1624.5781, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 1498.3594, -1616.9688, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1504.8906, -1596.7031, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1508.4453, -1668.7422, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1505.6953, -1654.8359, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1508.5156, -1647.8594, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1513.2734, -1642.4922, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1721.6328, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1705.2734, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1229, 1524.2188, -1693.9688, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1688.0859, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1229, 1524.2188, -1673.7109, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1668.0781, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1647.6406, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1524.8281, -1621.9609, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1525.3828, -1611.1563, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1528.9531, -1605.8594, 15.6250, 0.25);

    // Maxim's gas station
    RemoveBuildingForPlayer(playerid, 16478, 55.5625, 1220.6797, 17.9219, 0.25);
	RemoveBuildingForPlayer(playerid, 16477, 55.5625, 1220.6797, 17.9219, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 66.7969, 1207.1563, 18.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 72.0859, 1206.8828, 18.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 73.0938, 1228.0391, 19.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 77.3594, 1206.8828, 18.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 16479, 86.2422, 1214.0391, 17.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 78.2578, 1226.8516, 19.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 691, 75.7500, 1067.0469, 11.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 16000, 110.8125, 1023.9922, 12.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 130.3828, 1029.3516, 13.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 134.8984, 1032.1250, 13.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 94.9688, 1067.2031, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 108.9688, 1067.2031, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 96.8750, 1057.2188, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 98.6484, 1047.6563, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 91.3750, 1085.6719, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 105.3750, 1085.6719, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 100.1406, 1076.7891, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 107.1406, 1076.7891, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 112.3750, 1085.6719, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 115.9688, 1067.2031, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 110.8750, 1057.2188, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 112.6484, 1047.6563, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 121.1406, 1076.7891, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 128.1406, 1076.7891, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 122.9688, 1067.2031, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 124.8750, 1057.2188, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3221, 119.6484, 1047.6563, 12.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 691, 92.4141, 1099.5313, 12.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 691, 79.3359, 1099.9453, 11.9219, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 97.1172, 1107.4141, 13.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 97.2578, 1102.1172, 13.8906, 0.25);
	CreateObject(1257,-204.5000000,1127.8000000,20.0000000,0.0000000,358.0000000,182.0000000); //object(bustopm) (1)
	CreateObject(970,-167.4004000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (1)
	CreateObject(970,-163.2002000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (2)
	CreateObject(970,-159.0000000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (3)
	CreateObject(970,-146.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (10)
	CreateObject(970,-142.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (12)
	CreateObject(970,-138.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (13)
	CreateObject(970,-134.4004000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (14)
	CreateObject(970,-163.5000000,1066.8000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (15)
	CreateObject(1257,-47.1000000,1207.2000000,19.6000000,0.0000000,0.0000000,90.0000000); //object(bustopm) (2)
	CreateObject(7391,88.2002000,1219.5000000,23.3000000,0.0000000,0.0000000,293.5000000); //object(vgngassign102) (2)
	CreateObject(11547,60.7998000,1217.9000000,20.8000000,0.0000000,0.0000000,0.0000000); //object(desn_tscanopy) (1)
	CreateObject(1676,59.6000000,1209.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (1)
	CreateObject(1676,62.1000000,1209.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (2)
	CreateObject(1676,62.1000000,1215.1000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (3)
	CreateObject(1676,59.6000000,1215.1000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (4)
	CreateObject(1676,62.1000000,1220.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (5)
	CreateObject(1676,59.5000000,1220.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (6)
	CreateObject(4022,42.1000000,1219.2000000,21.1000000,0.0000000,0.0000000,88.2500000); //object(foodmart1_lan) (1)
	CreateObject(1496,47.0000000,1219.2000000,18.0000000,0.0000000,359.7500000,87.0000000); //object(gen_doorshop02) (1)
	CreateObject(18259,-232.6000000,890.1000000,10.6000000,0.0000000,0.0000000,0.0000000); //object(logcabinn01) (1)
	CreateObject(11566,-187.0000000,912.2000000,12.4000000,1.4990000,357.4990000,70.3150000); //object(des_tepeoff02) (1)
	CreateObject(11566,-189.9000000,903.9000000,11.8000000,358.0060000,355.2430000,73.8310000); //object(des_tepeoff02) (4)
	CreateObject(11566,-184.9000000,920.9000000,13.5000000,358.0130000,353.2420000,77.7610000); //object(des_tepeoff02) (5)
	CreateObject(1362,-89.2998000,1293.2000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin) (2)
	CreateObject(849,-84.0000000,1295.8000000,12.2000000,358.0200000,8.0050000,4.2780000); //object(cj_urb_rub_3) (1)
	CreateObject(850,-84.1000000,1289.1000000,12.2000000,0.0000000,4.0000000,0.0000000); //object(cj_urb_rub_1) (1)
	CreateObject(853,-90.7000000,1300.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5) (1)
	CreateObject(910,-89.0996100,1287.2000000,14.0000000,0.0000000,0.0000000,95.9990000); //object(bust_cabinet_4) (1)
	CreateObject(3119,-88.6000000,1288.8000000,13.0000000,0.0000000,4.0000000,354.0000000); //object(cs_ry_props) (1)
	CreateObject(1328,-82.0996100,1290.2000000,12.3000000,0.0000000,3.9990000,359.2470000); //object(binnt10_la) (1)
	CreateObject(2670,-89.0000000,1293.6000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (1)
	CreateObject(1712,-86.2998000,1292.0000000,12.3000000,354.0290000,353.9630000,219.3700000); //object(kb_couch05) (1)

	// Maxim's basketball court
	CreateObject(1257,-204.5000000,1127.8000000,20.0000000,0.0000000,358.0000000,182.0000000); //object(bustopm) (1)
	CreateObject(970,-167.4004000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (1)
	CreateObject(970,-163.2002000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (2)
	CreateObject(970,-159.0000000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (3)
	CreateObject(970,-146.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (10)
	CreateObject(970,-142.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (12)
	CreateObject(970,-138.5996000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (13)
	CreateObject(970,-134.4004000,1088.4000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (14)
	CreateObject(970,-163.5000000,1066.8000000,19.3000000,0.0000000,0.0000000,0.0000000); //object(fencesmallb) (15)
	CreateObject(1257,-47.1000000,1207.2000000,19.6000000,0.0000000,0.0000000,90.0000000); //object(bustopm) (2)
	CreateObject(7391,88.2002000,1219.5000000,23.3000000,0.0000000,0.0000000,293.5000000); //object(vgngassign102) (2)
	CreateObject(11547,60.7998000,1217.9000000,20.8000000,0.0000000,0.0000000,0.0000000); //object(desn_tscanopy) (1)
	CreateObject(1676,59.6000000,1209.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (1)
	CreateObject(1676,62.1000000,1209.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (2)
	CreateObject(1676,62.1000000,1215.1000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (3)
	CreateObject(1676,59.6000000,1215.1000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (4)
	CreateObject(1676,62.1000000,1220.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (5)
	CreateObject(1676,59.5000000,1220.6000000,19.6000000,0.0000000,0.0000000,0.0000000); //object(washgaspump) (6)
	CreateObject(4022,42.1000000,1219.2000000,21.1000000,0.0000000,0.0000000,88.2500000); //object(foodmart1_lan) (1)
	CreateObject(1496,47.0000000,1219.2000000,18.0000000,0.0000000,359.7500000,87.0000000); //object(gen_doorshop02) (1)
	CreateObject(18259,-232.6000000,890.1000000,10.6000000,0.0000000,0.0000000,0.0000000); //object(logcabinn01) (1)
	CreateObject(11566,-187.0000000,912.2000000,12.4000000,1.4990000,357.4990000,70.3150000); //object(des_tepeoff02) (1)
	CreateObject(11566,-189.9000000,903.9000000,11.8000000,358.0060000,355.2430000,73.8310000); //object(des_tepeoff02) (4)
	CreateObject(11566,-184.9000000,920.9000000,13.5000000,358.0130000,353.2420000,77.7610000); //object(des_tepeoff02) (5)
	CreateObject(1362,-89.2998000,1293.2000000,13.1000000,0.0000000,0.0000000,0.0000000); //object(cj_firebin) (2)
	CreateObject(849,-84.0000000,1295.8000000,12.2000000,358.0200000,8.0050000,4.2780000); //object(cj_urb_rub_3) (1)
	CreateObject(850,-84.1000000,1289.1000000,12.2000000,0.0000000,4.0000000,0.0000000); //object(cj_urb_rub_1) (1)
	CreateObject(853,-90.7000000,1300.0000000,12.7000000,0.0000000,0.0000000,0.0000000); //object(cj_urb_rub_5) (1)
	CreateObject(910,-89.0996100,1287.2000000,14.0000000,0.0000000,0.0000000,95.9990000); //object(bust_cabinet_4) (1)
	CreateObject(3119,-88.6000000,1288.8000000,13.0000000,0.0000000,4.0000000,354.0000000); //object(cs_ry_props) (1)
	CreateObject(1328,-82.0996100,1290.2000000,12.3000000,0.0000000,3.9990000,359.2470000); //object(binnt10_la) (1)
	CreateObject(2670,-89.0000000,1293.6000000,12.5000000,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (1)
	CreateObject(1712,-86.2998000,1292.0000000,12.3000000,354.0290000,353.9630000,219.3700000); //object(kb_couch05) (1)
	CreateObject(970,-180.1000000,1069.4000000,19.3000000,0.0000000,0.0000000,269.7500000); //object(fencesmallb) (4)
	CreateObject(5173,104.2000000,1061.0000000,14.9000000,0.0000000,0.0000000,98.0000000); //object(las2jmscum12) (1)
	CreateObject(2924,125.2000000,1020.1000000,13.9000000,0.0000000,0.0000000,16.0000000); //object(kmb_crash3door) (1)
	CreateObject(3657,96.5000000,1063.7000000,13.2000000,0.0000000,0.0000000,97.5000000); //object(airseata_las) (1)
	CreateObject(3657,94.4000000,1080.9000000,13.2000000,0.0000000,0.0000000,97.4980000); //object(airseata_las) (2)

	// Fort Carson clean up
	RemoveBuildingForPlayer(playerid, 1294, -308.2422, 1013.4609, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -261.1016, 1013.9141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -261.1016, 1023.1641, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -264.2891, 1029.3047, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -308.2422, 1030.6719, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -234.9531, 1007.6250, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -235.5703, 1013.9141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -235.5703, 1023.1641, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 16738, -217.4922, 1026.8203, 27.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 16785, -217.4922, 1026.8203, 27.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -198.6797, 984.0156, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -204.4141, 971.7109, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -206.5000, 1000.9063, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1007.9141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1028.7266, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -207.0625, 1013.9141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -207.0625, 1023.1641, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1028.8750, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1007.5703, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3337, -185.6875, 946.4922, 14.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -170.3750, 977.8984, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -170.4609, 1029.3672, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -286.1406, 1053.2344, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -285.4766, 1058.4063, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -220.4375, 1056.5547, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1043.1875, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1058.1250, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1058.6484, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -176.6094, 1052.0625, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -297.2500, 1068.4297, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -270.3203, 1071.4297, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1073.5625, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1073.7734, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -169.3594, 1077.4766, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -264.8125, 1078.2734, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -227.4844, 1077.2891, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -143.3828, 859.4141, 17.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -143.8125, 880.7969, 17.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -109.0547, 903.1641, 19.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -133.3594, 902.4141, 18.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -143.7500, 917.4844, 18.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3252, -99.9844, 919.2656, 19.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -85.1328, 902.1016, 20.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 16737, -94.6172, 923.2891, 26.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -63.0781, 925.6563, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -135.3047, 934.3594, 18.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -92.2500, 946.9609, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -66.7109, 946.1016, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -114.1953, 956.3359, 20.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -136.9063, 955.5078, 18.8594, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -158.8672, 955.9141, 16.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -165.5625, 1000.7656, 18.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -93.0313, 987.8828, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -114.5000, 980.4063, 19.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -70.5313, 987.7500, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -139.3984, 1067.3516, 19.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -70.5859, 1069.3672, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -62.1484, 905.4609, 21.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -59.7969, 884.5078, 19.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -42.8672, 946.6641, 18.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -20.8203, 947.1797, 18.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 773, -20.8281, 953.9844, 14.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -8.0547, 987.6250, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -27.0781, 987.4844, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -48.6328, 987.5234, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -30.1719, 1028.4141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -55.5078, 1035.3828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -20.2266, 1057.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 32.3984, 948.8281, 19.3594, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 31.9922, 929.8906, 22.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 30.3594, 967.9063, 18.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 16736, 11.0156, 959.8828, 24.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 30.8984, 987.3984, 18.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 11.6250, 987.4453, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 53.9766, 947.2656, 18.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 74.5938, 947.0703, 17.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -269.7813, 1088.1094, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -285.9375, 1093.0156, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -263.1094, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -304.5234, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -337.8203, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -264.9063, 1103.9922, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -263.1094, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -292.1797, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -331.1563, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -281.0703, 1108.8984, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -265.2266, 1112.9609, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -205.9219, 1093.0156, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -235.5703, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -207.0625, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -201.0469, 1108.8984, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 774, -245.7500, 1111.2813, 17.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -207.0625, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -235.5703, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -185.1797, 1087.8438, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -180.2656, 1103.9141, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -174.3828, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -174.3828, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -166.7500, 1107.9688, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -146.8438, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -146.8438, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -355.8438, 1115.6719, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -340.3672, 1115.2031, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -280.3828, 1123.4141, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1123.5547, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1123.3984, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -160.2656, 1122.5391, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -286.1250, 1137.8750, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -332.1953, 1137.8125, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -350.2813, 1137.8672, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1138.4609, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -149.8516, 1133.7656, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -162.1953, 1136.2266, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1141.6875, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -270.3203, 1140.8984, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -164.1719, 1144.0625, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -309.5234, 1143.8984, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 16740, -152.3203, 1144.0703, 30.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 16787, -152.3203, 1144.0703, 30.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -364.8438, 1149.0234, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -287.9766, 1153.0938, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -329.2969, 1152.9453, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 16739, -297.1016, 1152.9688, 27.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 16786, -297.1016, 1152.9688, 27.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -309.8359, 1158.8359, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -264.3516, 1162.6328, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -229.4375, 1156.6250, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1158.4219, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -199.6719, 1158.9219, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -161.9297, 1162.0781, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -164.1719, 1153.3125, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -218.0313, 1164.9219, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -270.3203, 1163.0859, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -186.4609, 1173.5625, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -280.2266, 1184.7500, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3286, -230.2031, 1185.7734, 23.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -184.9766, 1188.0156, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -159.8594, 1187.8281, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -250.6172, 1187.9453, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -206.0703, 1192.9219, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -160.7734, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -220.0391, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -250.2188, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -180.1094, 1203.8984, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -160.7734, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -192.1172, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -220.0391, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -250.2188, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -201.1953, 1208.8047, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -154.4844, 1209.6328, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -225.7344, 1208.8125, 17.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -191.5781, 1210.2422, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -111.7422, 1087.5000, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -59.7813, 1088.1094, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -86.8438, 1088.4141, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -75.9375, 1093.0156, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -90.7891, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -118.3359, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -50.1797, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -90.7891, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -118.3359, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -54.9063, 1103.9922, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -71.0703, 1108.8984, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -75.9453, 1109.1250, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -45.7344, 1109.0234, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -70.5859, 1135.2266, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -133.3594, 1137.5938, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -106.6719, 1140.0234, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 16735, -49.2422, 1137.7031, 28.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 16788, -49.2422, 1137.7031, 28.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -136.6328, 1144.0625, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -50.1797, 1144.1094, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -136.6328, 1153.3125, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -110.7813, 1158.7422, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -88.8594, 1165.3828, 19.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -96.7188, 1164.3516, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -70.5859, 1173.5234, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -46.6953, 1179.5703, 18.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -132.0703, 1187.4609, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -76.5313, 1187.6406, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -120.4922, 1183.3516, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -126.1016, 1192.9219, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -133.2266, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -81.7188, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -133.2266, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -65.8984, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -96.0781, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -105.0703, 1203.8984, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1352, -121.2344, 1208.8047, 18.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -95.1250, 1208.9453, 18.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -26.4766, 1087.5859, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -3.7813, 1093.6953, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -4.3125, 1108.9453, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -30.1719, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1.1484, 1137.7578, 19.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -3.7813, 1144.1094, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -30.1719, 1153.3516, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, -25.7813, 1188.0313, 18.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -0.1484, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -25.7813, 1193.6406, 22.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -11.7656, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -37.9766, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 5.5547, 1209.1016, 18.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 19.5781, 1102.9375, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 24.2969, 1127.8516, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 19.5781, 1153.3516, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 20.9141, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 20.9141, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 40.5625, 1188.6875, 17.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 49.1406, 1193.6406, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 49.1406, 1202.8828, 23.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 76.9297, 1187.2969, 17.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 82.5156, 971.5078, 15.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 82.5938, 998.1484, 13.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3337, 148.4688, 1174.3750, 14.4063, 0.25);

	// Fort Carson houses
	RemoveBuildingForPlayer(playerid, 3358, -369.9219, 1173.5469, 23.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 3360, -362.0625, 1198.6563, 18.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3371, -368.0313, 1110.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3371, -298.0547, 1120.8594, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3371, -253.0547, 1150.8828, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3373, -253.0547, 1175.8828, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3373, -323.0547, 1125.8828, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3372, -331.3906, 1170.8594, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3372, -253.0625, 1125.8750, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3372, -368.0234, 1135.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3372, -298.0234, 1170.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3305, -368.0313, 1110.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3305, -298.0547, 1120.8594, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3303, -323.0547, 1125.8828, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3304, -253.0625, 1125.8750, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -232.7578, 1129.7578, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -227.4844, 1129.7578, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3304, -368.0234, 1135.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -343.8594, 1159.1719, 19.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3305, -253.0547, 1150.8828, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1506, -370.6328, 1169.2109, 19.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -343.8594, 1169.7344, 19.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -343.8594, 1164.4453, 19.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3304, -298.0234, 1170.8672, 21.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3303, -331.3906, 1170.8594, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3303, -253.0547, 1175.8828, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 3356, -369.9219, 1173.5469, 23.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -343.8594, 1175.0078, 19.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -343.8594, 1180.3281, 19.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 16500, -360.7656, 1194.2578, 20.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3359, -362.0625, 1198.6563, 18.5938, 0.25);
	CreateObject(3311, -253.07, 1175.88, 21.67,   0.00, 0.00, 270.00);
	CreateObject(3310, -253.06, 1150.89, 20.78,   0.00, 0.00, 0.00);
	CreateObject(3309, -252.12, 1126.57, 20.19,   0.00, 0.00, 180.00);
	CreateObject(3313, -323.03, 1125.88, 21.59,   0.00, 0.00, 180.00);
	CreateObject(3312, -298.05, 1120.87, 21.67,   0.00, 0.00, 90.00);
	CreateObject(3316, -298.04, 1177.11, 22.07,   0.00, 0.00, 0.00);
	CreateObject(3315, -318.99, 1177.53, 19.74,   0.00, 0.00, 0.00);
	CreateObject(3314, -352.07, 1177.52, 19.74,   0.00, 0.00, 0.00);
	CreateObject(3306, -368.96, 1111.54, 20.20,   0.00, 0.00, 0.00);
	CreateObject(3307, -368.94, 1136.54, 20.19,   0.00, 0.00, 0.00);
	CreateObject(7921, -384.52, 1100.02, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -382.49, 1100.02, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1103.30, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1106.58, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1109.88, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1113.18, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1116.48, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1119.79, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1123.09, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1126.39, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1129.69, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1133.00, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1136.30, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1139.59, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1142.89, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -384.52, 1146.19, 17.33,   0.00, 0.00, 180.00);
	CreateObject(7921, -383.89, 1147.35, 17.33,   0.00, 0.00, 90.00);
	CreateObject(7921, -380.60, 1147.35, 17.33,   0.00, 0.00, 90.00);
	CreateObject(7921, -380.45, 1100.02, 17.33,   0.00, 0.00, 180.00);

	// Fort Carson shops (binco etc)
	RemoveBuildingForPlayer(playerid, 16435, -209.6641, 1066.5234, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3344, -235.8594, 1051.3047, 18.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3171, -235.8594, 1051.3047, 18.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -227.3906, 1063.3047, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -232.6641, 1063.3047, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -237.9375, 1063.3047, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 16005, -209.6641, 1066.5234, 22.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1500, -206.5703, 1061.4375, 18.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 669, -239.3359, 1070.2813, 18.7813, 0.25);
	CreateObject(5787, -225.21, 1071.03, 23.75,   0.00, 0.00, -90.00);
	CreateObject(970, -238.90, 1088.52, 20.53,   0.00, -30.50, 0.00);
	CreateObject(970, -237.10, 1088.52, 21.59,   0.00, -30.50, 0.00);
	CreateObject(970, -233.04, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -228.88, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -224.72, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -220.56, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -209.10, 1087.01, 22.69,   0.00, 0.00, 315.17);
	CreateObject(970, -207.16, 1085.07, 22.69,   0.00, 0.00, 315.17);
	CreateObject(970, -212.68, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -216.43, 1088.52, 22.69,   0.00, 0.00, 0.00);
	CreateObject(970, -205.68, 1081.50, 22.69,   0.00, 0.00, 90.00);
	CreateObject(970, -205.68, 1077.32, 22.69,   0.00, 0.00, 90.00);
	CreateObject(970, -205.68, 1073.16, 22.69,   0.00, 0.00, 90.00);
	CreateObject(970, -205.68, 1069.00, 22.69,   0.00, 0.00, 90.00);
	CreateObject(970, -205.68, 1064.86, 22.69,   0.00, 0.00, 90.00);
	CreateObject(970, -205.68, 1060.70, 22.69,   0.00, 0.00, 90.00);
	CreateObject(2722, -227.37, 1088.58, 22.36,   0.00, 0.00, 180.00);
	CreateObject(2697, -225.49, 1088.64, 20.76,   0.00, 0.00, 180.00);
	CreateObject(2696, -229.93, 1088.65, 20.76,   0.00, 0.00, 180.00);
	CreateObject(2695, -230.38, 1088.64, 20.76,   0.00, 0.00, 180.00);
	CreateObject(2693, -223.17, 1087.10, 19.45,   0.00, 0.00, 159.03);
	CreateObject(2722, -228.11, 1088.52, 22.36,   0.00, 0.00, 0.00);
	CreateObject(2692, -217.15, 1087.47, 19.45,   0.00, 0.00, 207.77);
	CreateObject(2691, -221.40, 1084.46, 20.40,   0.00, 0.00, 180.00);
	CreateObject(2659, -222.81, 1088.65, 21.98,   0.00, 0.00, 180.00);
	CreateObject(2661, -224.06, 1088.45, 21.26,   0.00, 0.00, 180.00);
	CreateObject(2660, -216.65, 1088.46, 21.15,   0.00, 0.00, 180.00);
	CreateObject(2658, -220.10, 1088.66, 20.76,   0.00, 0.00, 180.00);
	CreateObject(2657, -220.56, 1088.66, 20.76,   0.00, 0.00, 180.00);
	CreateObject(2656, -225.01, 1088.61, 20.76,   0.00, 0.00, 0.00);
	CreateObject(2655, -215.69, 1088.65, 20.76,   0.00, 0.00, 180.00);
	CreateObject(970, -245.80, 1088.36, 19.19,   0.00, 0.00, 0.00);
	CreateObject(970, -247.89, 1086.28, 19.19,   0.00, 0.00, 90.00);
	CreateObject(970, -247.90, 1082.12, 19.19,   0.00, 0.00, 90.00);
	CreateObject(970, -247.90, 1077.96, 19.19,   0.00, 0.00, 90.00);
	CreateObject(970, -247.90, 1073.80, 19.19,   0.00, 0.00, 90.00);
	CreateObject(970, -247.90, 1069.66, 19.19,   0.00, 0.00, 90.00);
	CreateObject(970, -247.90, 1065.50, 19.19,   0.00, 0.00, 90.00);

	// Fort Carson ammunation
	RemoveBuildingForPlayer(playerid, 16412, -215.2344, 1119.1953, 18.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 669, -228.3828, 1111.8750, 18.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 16006, -215.2344, 1119.1953, 18.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 669, -225.3125, 1127.2109, 18.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -232.7578, 1129.7578, 19.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1468, -227.4844, 1129.7578, 19.9375, 0.25);
	CreateObject(10631, -214.84, 1120.06, 23.01,   0.00, 0.00, 270.00);
	CreateObject(970, -206.39, 1110.45, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -208.47, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -212.64, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -216.80, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -220.96, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -225.12, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -229.28, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -233.44, 1108.36, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -235.54, 1110.46, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1114.62, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1118.78, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1122.94, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1127.10, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1128.06, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -235.54, 1127.10, 19.20,   0.00, 0.00, 90.00);
	CreateObject(970, -233.44, 1130.15, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -229.28, 1130.15, 19.20,   0.00, 0.00, 0.00);
	CreateObject(970, -225.12, 1130.15, 19.20,   0.00, 0.00, 0.00);
	CreateObject(669, -233.17, 1111.98, 18.83,   356.86, 0.00, 3.14);
	CreateObject(808, -230.41, 1126.76, 20.49,   0.00, 0.00, 0.00);
	CreateObject(809, -229.79, 1116.70, 18.48,   0.00, 0.00, 111.36);
	CreateObject(870, -230.12, 1123.34, 18.96,   0.08, 0.00, 0.00);
	CreateObject(870, -229.84, 1121.45, 18.96,   0.08, 0.00, 310.13);
	CreateObject(870, -229.88, 1119.64, 18.96,   0.08, 0.00, 46.60);
	CreateObject(870, -230.49, 1118.26, 18.96,   0.08, 0.00, 46.60);
	CreateObject(870, -231.66, 1120.35, 18.96,   0.08, 0.00, 46.60);
	CreateObject(870, -231.37, 1122.31, 18.96,   0.08, 0.00, 129.00);
	CreateObject(1215, -205.80, 1118.08, 19.10,   0.00, 0.00, 0.00);
	CreateObject(1215, -205.80, 1122.38, 19.10,   0.00, 0.00, 0.00);
	CreateObject(1500, -205.91, 1118.71, 19.02,   0.00, 0.00, 90.00);

	// Fort Carson gas station
	RemoveBuildingForPlayer(playerid, 16443, -161.1719, 1179.5313, 22.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -170.1719, 1169.0547, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -149.8203, 1164.1094, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1345, -162.0938, 1175.1406, 19.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 16064, -161.1719, 1179.5313, 22.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1692, -174.2422, 1177.8984, 22.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 700, -126.1719, 1159.0703, 19.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 669, -127.0000, 1173.4219, 18.6797, 0.25);
	CreateObject(5409, -160.32, 1172.28, 23.15,   0.00, 0.00, 0.00);
	CreateObject(970, -178.46, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -174.30, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -170.14, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -165.98, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -161.82, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -157.66, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -153.50, 1158.37, 19.21,   0.00, 0.00, 0.00);
	CreateObject(970, -180.54, 1160.45, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1164.62, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1168.78, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1172.94, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1177.10, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1181.26, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -180.54, 1185.42, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1160.37, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1164.52, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1168.68, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1172.84, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1177.00, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1181.16, 19.21,   0.00, 0.00, 90.00);
	CreateObject(970, -125.58, 1185.32, 19.21,   0.00, 0.00, 90.00);
	
	// gas station
	CreateDynamicObject(2395,1914.86242676,-1786.47863770,11.50106239,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (1)
	CreateDynamicObject(2395,1914.86230469,-1786.47851562,14.23307228,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (2)
	CreateDynamicObject(2395,1918.58984375,-1786.47875977,11.50106239,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (3)
	CreateDynamicObject(2395,1918.58984375,-1786.47851562,14.23425102,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (4)
	CreateDynamicObject(2395,1922.31860352,-1786.47363281,11.50106239,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (5)
	CreateDynamicObject(2395,1922.31835938,-1786.47363281,14.23425102,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (6)
	CreateDynamicObject(2395,1924.98034668,-1786.47387695,11.50106239,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (7)
	CreateDynamicObject(2395,1924.97973633,-1786.48535156,14.23366165,0.00000000,0.00000000,0.00000000); //object(cj_sports_wall) (8)
	CreateDynamicObject(3034,1923.87036133,-1786.44042969,14.68867016,0.00000000,0.00000000,0.00000000); //object(bd_window) (4)
	CreateDynamicObject(2395,1928.27368164,-1785.93859863,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (9)
	CreateDynamicObject(2395,1928.27343750,-1785.93847656,14.23425102,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (10)
	CreateDynamicObject(2395,1928.27441406,-1782.23425293,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (12)
	CreateDynamicObject(2395,1928.27441406,-1782.23339844,14.23425102,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (13)
	CreateDynamicObject(2395,1928.27734375,-1778.50097656,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (15)
	CreateDynamicObject(2395,1928.29199219,-1774.77441406,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (16)
	CreateDynamicObject(2395,1928.29199219,-1771.04199219,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (17)
	CreateDynamicObject(2395,1928.28613281,-1769.46582031,11.50106239,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (18)
	CreateDynamicObject(2395,1928.27734375,-1778.50097656,14.23307228,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (19)
	CreateDynamicObject(2395,1928.29199219,-1774.77441406,14.23366165,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (20)
	CreateDynamicObject(2395,1928.29199219,-1771.04199219,14.23366165,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (21)
	CreateDynamicObject(2395,1928.28613281,-1769.46582031,14.23366165,0.00000000,0.00000000,90.00000000); //object(cj_sports_wall) (22)
	CreateDynamicObject(3034,1928.22912598,-1784.28930664,14.68867016,0.00000000,0.00000000,90.00000000); //object(bd_window) (8)
	CreateDynamicObject(3034,1928.23413086,-1779.40441895,14.68867016,0.00000000,0.00000000,90.00000000); //object(bd_window) (9)
	CreateDynamicObject(1522,1928.17236328,-1773.75537109,12.50047302,0.00000000,0.00000000,270.25000000); //object(gen_doorshop3) (1)
	CreateDynamicObject(1522,1928.18066406,-1775.25488281,12.50047302,0.00000000,0.00000000,270.25000000); //object(gen_doorshop3) (3)
	CreateDynamicObject(3034,1928.24853516,-1769.11462402,14.68867016,0.00000000,0.00000000,90.00000000); //object(bd_window) (11)
	CreateDynamicObject(3034,1918.40905762,-1786.44226074,14.68867016,0.00000000,0.00000000,0.00000000); //object(bd_window) (15)
	CreateDynamicObject(2395,1927.74853516,-1766.16650391,11.50106239,0.00000000,0.00000000,180.00000000); //object(cj_sports_wall) (23)
	CreateDynamicObject(2395,1927.74804688,-1766.16601562,14.23484039,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (24)
	CreateDynamicObject(2395,1924.01965332,-1766.16760254,11.50106239,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (25)
	CreateDynamicObject(2395,1920.29052734,-1766.17150879,11.50106239,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (26)
	CreateDynamicObject(2395,1917.62438965,-1766.16052246,11.50106239,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (27)
	CreateDynamicObject(2395,1924.01953125,-1766.16699219,14.23366165,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (28)
	CreateDynamicObject(2395,1920.29003906,-1766.17089844,14.23366165,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (29)
	CreateDynamicObject(2395,1917.62402344,-1766.16015625,14.22786140,0.00000000,0.00000000,179.99450684); //object(cj_sports_wall) (30)
	CreateDynamicObject(2395,1914.32763672,-1766.69799805,11.50106239,0.00000000,0.00000000,269.99450684); //object(cj_sports_wall) (31)
	CreateDynamicObject(2395,1914.32714844,-1766.69726562,14.22727203,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (32)
	CreateDynamicObject(2395,1914.32446289,-1770.41992188,14.22727203,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (33)
	CreateDynamicObject(2395,1914.32470703,-1770.42736816,11.50047302,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (34)
	CreateDynamicObject(3034,1923.89978027,-1766.20544434,14.68867016,0.00000000,0.00000000,180.00000000); //object(bd_window) (16)
	CreateDynamicObject(3034,1917.98327637,-1766.20666504,14.68867016,0.00000000,0.00000000,179.75000000); //object(bd_window) (17)
	CreateDynamicObject(2395,1914.31555176,-1781.20471191,14.22727203,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (37)
	CreateDynamicObject(2395,1914.31542969,-1781.20410156,11.48887253,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (38)
	CreateDynamicObject(2395,1914.31994629,-1783.18249512,11.48887253,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (39)
	CreateDynamicObject(2395,1914.31933594,-1783.18164062,14.22668266,0.00000000,0.00000000,269.98901367); //object(cj_sports_wall) (40)
	CreateDynamicObject(1233,1931.38903809,-1787.21911621,13.94249249,0.00000000,0.00000000,90.00000000); //object(noparkingsign1) (1)
	CreateDynamicObject(2714,1928.25708008,-1778.20739746,15.16425514,0.00000000,0.00000000,90.00000000); //object(cj_open_sign_2) (1)
	CreateDynamicObject(9314,1941.70898438,-1765.32226562,20.28519821,0.00000000,0.00000000,90.00000000); //object(advert01_sfn) (1)
	CreateDynamicObject(1280,1928.63085938,-1783.79956055,12.94823074,0.00000000,0.00000000,180.00000000); //object(parkbench1) (1)
	CreateDynamicObject(1549,1928.72985840,-1781.95336914,12.54687500,0.00000000,0.00000000,100.00000000); //object(cj_ashtray_b) (1)
	CreateDynamicObject(3465,1941.61657715,-1775.03942871,13.95613480,0.00000000,0.00000000,0.00000000); //object(vegspetrolpump) (1)
	CreateDynamicObject(3465,1941.65563965,-1777.74157715,13.95613480,0.00000000,0.00000000,0.00000000); //object(vegspetrolpump) (3)
	CreateDynamicObject(3465,1941.71386719,-1770.53662109,13.95613480,0.00000000,0.00000000,0.00000000); //object(vegspetrolpump) (4)
	CreateDynamicObject(3465,1941.74072266,-1768.12097168,13.95613480,0.00000000,0.00000000,0.00000000); //object(vegspetrolpump) (5)
	CreateDynamicObject(4100,1944.89746094,-1797.50390625,14.24074173,0.00000000,0.00000000,320.24597168); //object(meshfence1_lan) (1)
	CreateDynamicObject(4100,1951.55700684,-1804.09375000,14.24074173,0.00000000,0.00000000,50.24597168); //object(meshfence1_lan) (5)
	CreateDynamicObject(4100,1951.59545898,-1817.82360840,14.24074173,0.00000000,0.00000000,50.24597168); //object(meshfence1_lan) (6)
	CreateDynamicObject(4100,1931.17773438,-1797.54492188,14.21174049,0.00000000,0.00000000,320.24047852); //object(meshfence1_lan) (7)
	CreateDynamicObject(4100,1917.46289062,-1797.58300781,14.21174049,0.00000000,0.00000000,320.24047852); //object(meshfence1_lan) (8)
	CreateDynamicObject(4100,1910.61523438,-1797.60742188,14.21174049,0.00000000,0.00000000,320.24047852); //object(meshfence1_lan) (9)
	CreateDynamicObject(4100,1903.44543457,-1790.46838379,14.24074173,0.00000000,0.00000000,50.24597168); //object(meshfence1_lan) (10)
	CreateDynamicObject(4100,1903.40759277,-1776.75109863,14.24074173,0.00000000,0.00000000,50.24597168); //object(meshfence1_lan) (11)
	CreateDynamicObject(4100,1903.38391113,-1769.90075684,14.24074173,0.00000000,0.00000000,50.24597168); //object(meshfence1_lan) (12)
	CreateDynamicObject(4100,1896.78051758,-1763.37158203,14.21174049,0.00000000,0.00000000,320.24597168); //object(meshfence1_lan) (13)
	CreateDynamicObject(4100,1894.32702637,-1763.38867188,14.21174049,0.00000000,0.00000000,320.24597168); //object(meshfence1_lan) (14)
	CreateDynamicObject(1256,1955.11425781,-1771.61157227,13.20633125,0.00000000,0.00000000,180.00000000); //object(stonebench1) (2)
	CreateDynamicObject(1229,1954.81347656,-1773.57104492,14.10655499,0.00000000,0.00000000,92.00000000); //object(bussign1) (1)
	CreateDynamicObject(1215,1931.12915039,-1786.96936035,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1913.99914551,-1787.01684570,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,1931.11791992,-1762.90539551,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,1941.61242676,-1764.98083496,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,1941.69970703,-1780.82629395,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,1955.17773438,-1769.87390137,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (6)
	CreateDynamicObject(1215,1914.78674316,-1762.17980957,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (7)
	CreateDynamicObject(1215,1908.23999023,-1762.13952637,13.11119843,0.00000000,0.00000000,0.00000000); //object(bollardlight) (8)
	CreateDynamicObject(8661,1931.64355469,-1767.32421875,12.38446808,0.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (2)
	CreateDynamicObject(8661,1891.64843750,-1767.32617188,12.38446808,0.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (3)
	CreateDynamicObject(8661,1936.65917969,-1787.31542969,12.38446808,0.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (4)
	CreateDynamicObject(8661,1896.73889160,-1787.30529785,12.38446808,0.00000000,0.00000000,0.00000000); //object(gnhtelgrnd_lvs) (5)
	CreateDynamicObject(8843,1944.61718750,-1772.66113281,12.39441299,0.00000000,0.00000000,0.00000000); //object(arrows01_lvs) (1)
	CreateDynamicObject(8843,1938.44726562,-1772.58789062,12.40021324,0.00000000,0.00000000,179.74731445); //object(arrows01_lvs) (2)
	CreateDynamicObject(18232,1921.25683594,-1771.32031250,12.96496201,0.00000000,0.00000000,90.00000000); //object(cuntw_ngassta) (1)
	CreateDynamicObject(3578,1922.54919434,-1793.29919434,11.57608700,18.00000000,0.00000000,0.00000000); //object(dockbarr1_la) (3)
	CreateDynamicObject(3578,1935.62573242,-1773.44287109,11.57608700,13.24951172,0.00000000,89.48913574); //object(dockbarr1_la) (7)
	CreateDynamicObject(3578,1935.55065918,-1781.29553223,11.57608700,13.24951172,0.00000000,89.48913574); //object(dockbarr1_la) (9)
	CreateDynamicObject(1691,1919.87561035,-1770.42321777,17.19487572,0.00000000,0.00000000,90.00000000); //object(gen_roofbit5) (1)
	CreateDynamicObject(1966,1911.61132812,-1780.68420410,13.39640045,0.00000000,0.00000000,0.00000000); //object(imcompmovedr1_las) (1)
	CreateDynamicObject(1966,1912.02197266,-1772.09936523,13.39640045,0.00000000,0.00000000,0.00000000); //object(imcompmovedr1_las) (2)
	CreateDynamicObject(8843,1911.48901367,-1781.51025391,12.39441299,0.00000000,0.00000000,0.00000000); //object(arrows01_lvs) (1)
	CreateDynamicObject(8843,1911.59545898,-1769.29699707,12.39441299,0.00000000,0.00000000,0.00000000); //object(arrows01_lvs) (1)

	/* ASGH */

	RemoveBuildingForPlayer(playerid, 4054, 1402.5000, -1682.0234, 25.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 4055, 1394.3594, -1620.6641, 32.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 4220, 1370.6406, -1643.4453, 33.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 4005, 1402.5000, -1682.0234, 25.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 4006, 1394.3594, -1620.6641, 32.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 1148.6797, -1385.1875, 13.2656, 0.25);

	/* Los Santos */

    RemoveBuildingForPlayer(playerid, 5043, 1843.3672, -1856.3203, 13.8750, 0.25);
    RemoveBuildingForPlayer(playerid, 6463, 389.7734, -2028.4688, 19.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 6465, 368.0547, -2028.2422, 8.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5000, 32.2266, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6406, 29.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4531, 24.0313, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4297, 16.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6328, 10.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5156, 8.7813, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3984, 10.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6406, 16.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6563, 24.1094, 0.25);
    RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3828, 29.9531, 0.25);
    RemoveBuildingForPlayer(playerid, 6462, 368.0547, -2028.2422, 8.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 1215, 379.5938, -2042.4922, 7.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 1215, 379.5938, -2030.3359, 7.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 1215, 379.5938, -2016.7500, 7.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 1215, 386.5703, -2049.3516, 7.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6406, 16.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6563, 24.1094, 0.25);
    RemoveBuildingForPlayer(playerid, 6298, 389.7734, -2028.4688, 19.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 6461, 389.7734, -2028.5000, 20.1094, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5000, 32.2266, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6406, 29.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4531, 24.0313, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4297, 16.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6328, 10.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5156, 8.7813, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3984, 10.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3828, 29.9531, 0.25);

	/* Modding Gates */

	RemoveBuildingForPlayer(playerid, 5340, 2644.8594, -2039.2344, 14.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 5779, 1041.3516, -1025.9297, 32.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 10575, -2716.3516, 217.4766, 5.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 11313, -1935.8594, 239.5313, 35.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 9093, 2386.6563, 1043.6016, 11.5938, 0.25);

	/* Pay'n'Spray Gates */
    RemoveBuildingForPlayer(playerid, 5422, 2071.4766, -1831.4219, 14.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 5856, 1024.9844, -1029.3516, 33.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 6400, 488.2813, -1734.6953, 12.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 11319, -1904.5313, 277.8984, 42.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 9625, -2425.7266, 1027.9922, 52.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 7891, 1968.7422, 2162.4922, 12.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3294, -1420.5469, 2591.1563, 57.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 3294, -100.0000, 1111.4141, 21.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 13028, 720.0156, -462.5234, 16.8594, 0.25);
    RemoveBuildingForPlayer(playerid, 8957, 2393.7656, 1483.6875, 12.7109, 0.25);

    /* Mechanic garages */

    RemoveBuildingForPlayer(playerid, 3289, 2484.4141, -2141.0078, 12.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3289, 2496.0625, -2141.0078, 12.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3290, 2503.1250, -2073.3750, 12.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 3290, 2515.4219, -2073.3750, 12.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3288, 2432.7266, -2133.0234, 12.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3686, 2448.1328, -2075.6328, 16.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 3745, 2475.1016, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3745, 2482.0234, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3745, 2489.1016, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3745, 2496.0938, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3290, 2452.9609, -2129.0156, 25.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 3756, 2484.2344, -2118.5547, 17.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3755, 2484.2344, -2118.5547, 17.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 3257, 2432.7266, -2133.0234, 12.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 2484.4141, -2141.0078, 12.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3258, 2496.0625, -2141.0078, 12.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3256, 2452.9609, -2129.0156, 25.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 3567, 2446.8281, -2075.8438, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3567, 2438.3594, -2075.8438, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2448.1328, -2075.6328, 16.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 3643, 2489.1016, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3643, 2482.0234, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3643, 2475.1016, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3643, 2496.0938, -2073.4766, 17.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 3256, 2515.4219, -2073.3750, 12.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3256, 2503.1250, -2073.3750, 12.4297, 0.25);

	/* Fire Department */

	RemoveBuildingForPlayer(playerid, 4026, 1497.7969, -1543.7109, 17.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 4057, 1479.5547, -1693.1406, 19.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 4218, 1497.7031, -1546.6172, 43.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 4186, 1479.5547, -1693.1406, 19.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 4016, 1497.7969, -1543.7109, 17.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1516.1641, -1591.6563, 15.6250, 0.25);

	new number1 = CreatePlayerObject(playerid, 19353, 1522.9534, -1565.7065, 17.2818, -0.0000, 0.0000, 179.8670);
	new number2 = CreatePlayerObject(playerid, 19353, 1522.9747, -1556.4064, 17.2811, 0.0000, 0.0000, -179.9326);
	new number3 = CreatePlayerObject(playerid, 19353, 1522.9703, -1547.0604, 17.2922, 0.0000, 0.0000, 179.9940);
	new number4 = CreatePlayerObject(playerid, 19353, 1522.9698, -1537.5981, 17.3016, 0.0000, 0.0000, 179.9208);
	new number5 = CreatePlayerObject(playerid, 19353, 1510.9716, -1510.1949, 17.2990, 0.0000, 0.0000, -89.9666);
	new number6 = CreatePlayerObject(playerid, 19353, 1520.5458, -1510.2094, 17.2798, 0.0000, 0.0000, -90.0102);
	new number7 = CreatePlayerObject(playerid, 19353, 1529.7690, -1510.1945, 17.2898, 0.0000, 0.0000, -89.9501);
	new number8 = CreatePlayerObject(playerid, 19353, 1539.0587, -1510.2080, 17.2898, 0.0000, 0.0000, -89.9601);
	new LSCFD = CreatePlayerObject(playerid, 17951, 1451.0812, -1563.2667, 24.4368, 0.0000, -0.0999, -0.3663);
	SetPlayerObjectMaterialText(playerid, number1, "1", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number2, "2", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number3, "3", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number4, "4", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number5, "5", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number6, "6", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number7, "7", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, number8, "8", 0, 30, "Times New Roman", 24, 1, -1, 0, 1);
	SetPlayerObjectMaterialText(playerid, LSCFD, "LSFD", 0, 20, "Times New Roman", 22, 1, -1, 0, 1);
	//SetObjectMaterialText(FDtext1, "LSFD", 0, 40, "Times New Roman", 24, 1, -65536, -1, 1);
	//SetObjectMaterialText(FDtext2, "LSFD", 0, 40, "Times New Roman", 24, 1, -65536, -1, 1);

	/* Old Gas Station */
	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1912.0547, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1906.7734, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1938.3906, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1933.1250, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1778.4531, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1774.3125, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1771.3438, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1767.2891, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1821.1250, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1815.8594, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1810.5938, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1805.3281, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1948.9844, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1943.6875, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1800.0625, 13.8125, 0.25);
	return 1;
}
