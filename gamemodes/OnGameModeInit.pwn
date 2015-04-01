==============================================================================
== OnGameModeInit
==============================================================================*/

public OnGameModeInit()
{
	SetGameModeText("PR-RP 10.0.0");
	new ltime = GetTickCount();
	FadeInit();
	print("Initializing2.");
    ConnectToMYSQL();
    DestroyAllDynamic3DTextLabels();
    mysql_query("UPDATE `characters` SET `Online` = 0 WHERE 1");
	ServerLocked = false;
	EnableStuntBonusForAll(0);
	LoadAllHouses(); //NEW BY YANIR 16/1/14
	LoadAllBizz(); //NEW BY YANIR 16/1/14
  	LoadAllSafes(); // NEW BY YAVIV
  	LoadAllFurniture(); //NEW BY YANIR 16/1/14
  	LoadAllVehicles(); // NEW BY YANIR 16/1/14
 	LoadFactions(); // NEW BY YANIR
 	LoadGroups(); // NEW BY YANIR
 	LoadInteriors(); // NEW BY YANIR
 	//ShowNameTags(0);
 	SetWeather(2);
	// Weather and Time system
	/*\WeatherTime();
	SetTimer("WeatherTime", 10000*60, true);*/
	// Disables Yellow Interiors
	DisableInteriorEnterExits();

	// Adding lights on day
	ManualVehicleEngineAndLights();
	// Gamemode Name
	Advertable = true;
	SetTimer("PrisonTimer", 1000, true);
	SetTimer("JailTimer", 1000, true);
	SetTimer("KilometerUpdate", 300, 1);
	SetTimer("AFKCheck", 1000, true);
 	SetTimer("refreshMySQL", 20000, true); // 5000
	SetTimer("SaveLastPos", 2000, true);
	SetTimer("IsPayday", 500 * 1000, true);
	//This will run for each 500 seconds.
    LightTD = TextDrawCreate(0.0, 0.0, "|");
    TextDrawUseBox(LightTD, 1);
    TextDrawBoxColor(LightTD, 0x000000BB);
    TextDrawTextSize(LightTD, 660.000000, 22.000000);
    TextDrawAlignment(LightTD, 0);
    TextDrawBackgroundColor(LightTD, 0x000000FF);
    TextDrawFont(LightTD, 3);
    TextDrawLetterSize(LightTD, 1.000000, 52.200000);
    TextDrawColor(LightTD, 0x000000FF);
    TextDrawSetOutline(LightTD, 1);
    TextDrawSetProportional(LightTD, 1);
    TextDrawSetShadow(LightTD, 1);
    
    MoneyDraw2 = TextDrawCreate(511.000000,81.000000,"NULL");
	TextDrawUseBox(MoneyDraw2,1);
	TextDrawBoxColor(MoneyDraw2,0x000000ff);
	TextDrawTextSize(MoneyDraw2,606.000000,0.000000);
	TextDrawAlignment(MoneyDraw2,0);
	TextDrawBackgroundColor(MoneyDraw2,0xff000000);
	TextDrawFont(MoneyDraw2,3);
	TextDrawLetterSize(MoneyDraw2,1.600000,1.500000);
	TextDrawColor(MoneyDraw2,0xff000000);
	TextDrawSetOutline(MoneyDraw2,1);
	TextDrawSetProportional(MoneyDraw2,1);
	TextDrawSetShadow(MoneyDraw2,1);
	
	PlayerHud[1] = TextDrawCreate(544.000000, 25.000000, "I");
	TextDrawBackgroundColor(PlayerHud[1], 255);
	TextDrawFont(PlayerHud[1], 1);
	TextDrawLetterSize(PlayerHud[1], 0.409999, 7.900000);
	TextDrawColor(PlayerHud[1], 0);
	TextDrawSetOutline(PlayerHud[1], 0);
	TextDrawSetProportional(PlayerHud[1], 1);
	TextDrawSetShadow(PlayerHud[1], 1);
	TextDrawUseBox(PlayerHud[1], 1);
	TextDrawBoxColor(PlayerHud[1], 255);
	TextDrawTextSize(PlayerHud[1], 620.000000, -40.000000);
	
	PlayerHud[2] = TextDrawCreate(492.000000, 25.000000, "I");
	TextDrawBackgroundColor(PlayerHud[2], 255);
	TextDrawFont(PlayerHud[2], 1);
	TextDrawLetterSize(PlayerHud[2], 0.409999, 7.900000);
	TextDrawColor(PlayerHud[2], 0);
	TextDrawSetOutline(PlayerHud[2], 0);
	TextDrawSetProportional(PlayerHud[2], 1);
	TextDrawSetShadow(PlayerHud[2], 1);
	TextDrawUseBox(PlayerHud[2], 1);
	TextDrawBoxColor(PlayerHud[2], 255);
	TextDrawTextSize(PlayerHud[2], 497.000000, -40.000000);
	
	PlayerHud[3] = TextDrawCreate(496.000000, 25.000000, "I");
	TextDrawBackgroundColor(PlayerHud[3], 255);
	TextDrawFont(PlayerHud[3], 1);
	TextDrawLetterSize(PlayerHud[3], 0.409999, 0.100000);
	TextDrawColor(PlayerHud[3], 0);
	TextDrawSetOutline(PlayerHud[3], 0);
	TextDrawSetProportional(PlayerHud[3], 1);
	TextDrawSetShadow(PlayerHud[3], 1);
	TextDrawUseBox(PlayerHud[3], 1);
	TextDrawBoxColor(PlayerHud[3], 255);
	TextDrawTextSize(PlayerHud[3], 547.000000, -30.000000);
	
	PlayerHud[4] = TextDrawCreate(496.000000, 77.000000, "I");
	TextDrawBackgroundColor(PlayerHud[4], 255);
	TextDrawFont(PlayerHud[4], 1);
	TextDrawLetterSize(PlayerHud[4], 0.409999, 2.100000);
	TextDrawColor(PlayerHud[4], 0);
	TextDrawSetOutline(PlayerHud[4], 0);
	TextDrawSetProportional(PlayerHud[4], 1);
	TextDrawSetShadow(PlayerHud[4], 1);
	TextDrawUseBox(PlayerHud[4], 1);
	TextDrawBoxColor(PlayerHud[4], 255);
	TextDrawTextSize(PlayerHud[4], 547.000000, -30.000000);
	
	PlayerHud[5] = TextDrawCreate(492.000000, 99.000000, "I");
	TextDrawBackgroundColor(PlayerHud[5], 255);
	TextDrawFont(PlayerHud[5], 1);
	TextDrawLetterSize(PlayerHud[5], 0.409999, 0.000000);
	TextDrawColor(PlayerHud[5], 0);
	TextDrawSetOutline(PlayerHud[5], 0);
	TextDrawSetProportional(PlayerHud[5], 1);
	TextDrawSetShadow(PlayerHud[5], 1);
	TextDrawUseBox(PlayerHud[5], 1);
	TextDrawBoxColor(PlayerHud[5], 255);
	TextDrawTextSize(PlayerHud[5], 620.000000, -30.000000);
	
	PlayerHud[6] = TextDrawCreate(496.000000, 80.000000, "I");
	TextDrawBackgroundColor(PlayerHud[6], 255);
	TextDrawFont(PlayerHud[6], 1);
	TextDrawLetterSize(PlayerHud[6], 0.409999, 1.800000);
	TextDrawColor(PlayerHud[6], 0);
	TextDrawSetOutline(PlayerHud[6], 0);
	TextDrawSetProportional(PlayerHud[6], 1);
	TextDrawSetShadow(PlayerHud[6], 1);
	TextDrawUseBox(PlayerHud[6], 1);
	TextDrawBoxColor(PlayerHud[6], -1347440641);
	TextDrawTextSize(PlayerHud[6], 616.000000, -30.000000);
	
	PlayerHud[7] = TextDrawCreate(549.000000, 30.000000, "I");
	TextDrawBackgroundColor(PlayerHud[7], 0);
	TextDrawFont(PlayerHud[7], 1);
	TextDrawLetterSize(PlayerHud[7], 0.409999, 4.700000);
	TextDrawColor(PlayerHud[7], 0);
	TextDrawSetOutline(PlayerHud[7], 0);
	TextDrawSetProportional(PlayerHud[7], 1);
	TextDrawSetShadow(PlayerHud[7], 1);
	TextDrawUseBox(PlayerHud[7], 1);
	TextDrawBoxColor(PlayerHud[7], -1347440641);
	TextDrawTextSize(PlayerHud[7], 616.000000, -30.000000);
	
	//ShowNameTags(0);
	SetNameTagDrawDistance(15.0);
 	// Pickups
 	emsPickup[0] =CreatePickup(1239, 1, 1144.9564,-1322.8942,13.5840, -1);
 	emsPickup[1] =CreatePickup(1239, 1, 17.5954,0.0282,999.0019, 5);
 	emsPickup[2] =CreatePickup(1239, 1, 1161.6750,-1330.1428,31.4927, -1);

	DealershipPickup = CreateDynamicPickup(1239, 1, 1472.6603,-1670.0081,15.1903, -1, -1, -1, 100.0);
	FishPickup = CreateDynamicPickup(1239, 1, SELLFISH_X, SELLFISH_Y, SELLFISH_Z, -1, -1, -1, 100.0);
    Storage_PU = CreateDynamicPickup(1271, 1, STORAGE_X, STORAGE_Y, STORAGE_Z, -1, -1, -1, 100.0);
    Garbage_PU = CreateDynamicPickup(1439, 1, GARBAGE_X, GARBAGE_Y, GARBAGE_Z, -1, -1, -1, 100.0);
    DrivingPickup = CreateDynamicPickup(1239, 1, -2033.4346,-117.4764,1035.1719, -1, -1, -1, 100.0);
    // PD
	eGate = false;
	pGate = false;
	pBarrier = false;
	pDoor[0] = false;
	pDoor[1] = false;
	pDoor[2] = false;
	pDoor[3] = false;

    PDPickup[0] = CreatePickup(1239, 1, 1524.4851,-1677.9384,6.2188); // Pd Garage
    PDPickup[1] = CreatePickup(1239, 1, 215.4946,126.7358,1003.2188, 3); // Pd Lobby
    PDPickup[2] = CreatePickup(1239, 1, 1564.8969,-1667.0015,28.3956); // Pd roof
    ArmouryPickup = CreatePickup(1242, 1, -2033.4346,-117.4764,1035.1719, 9);
    ArmouryCP = CreateDynamicCP(312.3830,-165.7816,999.6010, 2.0, -1, -1, -1, 100.0);
	format(gString, sizeof gString, ""COL_YELLOW"/armoury");
	Create3DTextLabel(gString, 0x008080FF, -2033.4346,-117.4764,1035.1719, 12.0, 9, 0);
    for(new i = 0; i < MAX_SERVER_BAGS; i++)
    {
        Bag_Objects[i] = CreateDynamicObject(1264, Garbage_BAGS[i][0], Garbage_BAGS[i][1], Garbage_BAGS[i][2]-0.6, 0.0, 0.0, 0.0, 0, 0, -1, 100);
        BagCreated[i] = true;
    }
    // PD
    emsgate = CreateDynamicObject(968,1144.6999500,-1291.8000500,13.5000000,0.0000000,269.0000000,0.0000000); //ems barrier // 269 to 350

 	pddoor[0] = CreateDynamicObject(977,239.6000100,116.5900000,1003.4000200,0.0000000,0.0000000,100.0000000); //police door 1 // 100 to 180
	pddoor[1] = CreateDynamicObject(977,253.2000000,110.1000000,1003.5000000,0.0000000,0.0000000,280.0000000); //police door 2 // Rot Z to 350
	pddoor[2] = CreateDynamicObject(977,253.3000000,126.2500000,1003.7999900,0.0000000,0.0000000,280.0000000); //police door3 // Rot Z to 360
	pddoor[3] = CreateDynamicObject(977,239.6000100,126.1000000,1003.4000200,0.0000000,0.0000000,280.0000000); //police door 4 // Change 280 to 200

	pdgate = CreateDynamicObject(10184,1592.8000500,-1638.3000500,14.9000000,0.0000000,0.0000000,90.0000000); //police gate  z 9 open
	pdbarrier = CreateDynamicObject(968,1544.6999511719,-1631,13.199999809265,0,270, 270); //police barrier // Change 270 to 350


	//CreateDynamicObject(7520,1734.6999500,-1770.3000500,12.5000000,0.0000000,0.0000000,270.0000000); //object(vgnlowbuild203) (1)
	CreateDynamicObject(994,1544.5999800,-1617.5000000,12.6000000,0.0000000,0.0000000,270.0000000); //object(lhouse_barrier2) (1)
	CreateDynamicObject(994,1544.9000200,-1632.6999500,12.5000000,0.0000000,0.0000000,270.0000000); //object(lhouse_barrier2) (2)
	CreateDynamicObject(3109,1145.4000200,-1323.6999500,13.8000000,0.0000000,0.0000000,0.0000000); //object(imy_la_door) (1)
	CreateDynamicObject(3928,1161.9000200,-1299.5999800,30.5000000,0.0000000,0.0000000,0.0000000); //object(helipad) (1)
	CreateDynamicObject(3928,1162.5000000,-1317.4000200,30.5000000,0.0000000,0.0000000,0.0000000); //object(helipad) (2)
	CreateDynamicObject(988,1089.9000200,-1332.5999800,13.6000000,0.0000000,0.0000000,270.0000000); //object(ws_apgate) (1)
	CreateDynamicObject(987,1137.8000500,-1347.6999500,12.8000000,0.0000000,0.0000000,27.0000000); //object(elecfence_bar) (1)
	CreateDynamicObject(3109,1162.4000200,-1330.5000000,31.7000000,0.0000000,0.0000000,90.0000000); //object(imy_la_door) (2)
	CreateDynamicObject(966,1144.5000000,-1291.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(bar_gatebar01) (1)


	// blocked by gal
	CreateDynamicObject(2933,2644.6001000,-2039.1999500,14.3000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (2)
	CreateDynamicObject(2933,1042.6999500,-1026.0000000,32.8000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (3)
	CreateDynamicObject(2933,2387.1001000,1043.5999800,11.5000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (4)
	CreateDynamicObject(2933,-99.4000000,1111.5000000,20.5000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (5)
	CreateDynamicObject(2933,-1904.0999800,277.7999900,41.8000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (6)
	CreateDynamicObject(2933,-1935.8000500,239.5000000,35.2000000,0.0000000,0.0000000,0.0000000); //object(pol_comp_gate) (7)
	CreateDynamicObject(2933,-2716.3000500,217.0000000,5.1000000,0.0000000,0.0000000,90.0000000); //object(pol_comp_gate) (8)

	// ==
	CreateDynamicObject(983,1134.3000500,-1292.0999800,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit3) (1)
	CreateDynamicObject(983,1148.0000000,-1292.0999800,13.3000000,0.0000000,0.0000000,90.0000000); //object(fenceshit3) (2)
	CreateDynamicObject(869,1175.8000500,-1334.0000000,13.4000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (1)
	CreateDynamicObject(869,1178.5000000,-1334.1999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (3)
	CreateDynamicObject(869,1175.4000200,-1331.0000000,13.4000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (4)
	CreateDynamicObject(869,1178.0000000,-1330.8000500,13.5000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (5)
	CreateDynamicObject(869,1175.0999800,-1316.6999500,13.4000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (6)
	CreateDynamicObject(869,1178.0999800,-1316.8000500,13.5000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (7)
	CreateDynamicObject(869,1175.0999800,-1313.5000000,13.4000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (8)
	CreateDynamicObject(869,1177.8000500,-1313.5999800,13.5000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowerswee) (9)
	CreateDynamicObject(1368,1181.1999500,-1313.0000000,13.3000000,0.0000000,0.0000000,90.0000000); //object(cj_blocker_bench) (1)
	CreateDynamicObject(1368,1181.0999800,-1334.5999800,13.3000000,0.0000000,0.0000000,90.0000000); //object(cj_blocker_bench) (2)
	CreateDynamicObject(1369,1178.1999500,-1328.0000000,13.7000000,0.0000000,0.0000000,120.0000000); //object(cj_wheelchair1) (1)
	CreateDynamicObject(971,1843.3000500,-1855.1999500,11.8000000,0.0000000,0.0000000,270.0000000); //object(subwaygate) (1)
	CreateDynamicObject(971,2644.5000000,-2039.1999500,12.8000000,0.0000000,0.0000000,0.0000000); //object(subwaygate) (2)
	CreateDynamicObject(2946,1029.1999500,-1930.9000200,11.8000000,0.0000000,0.0000000,0.0000000); //object(cr_door_03) (1)
	CreateDynamicObject(2952,1582.3000500,-1638.0000000,12.4000000,0.0000000,0.0000000,90.0000000); //object(kmb_gimpdoor) (1)
	CreateDynamicObject(4199,1602.0999800,-1618.5000000,14.7000000,0.0000000,0.0000000,180.0000000); //object(garages1_lan) (1)
	CreateDynamicObject(1649,253.0000000,117.7000000,1004.4000200,0.0000000,0.0000000,270.0000000); //object(wglasssmash) (1)
	CreateDynamicObject(1649,239.7000000,112.0000000,1004.9000200,0.0000000,0.0000000,90.0000000); //object(wglasssmash) (2)
	CreateDynamicObject(3109,214.8000000,127.0000000,1003.4000200,0.0000000,0.0000000,270.0000000); //object(imy_la_door) (3)
	CreateDynamicObject(14782,232.6000100,124.0000000,1003.2000100,0.0000000,0.0000000,90.0000000); //object(int3int_boxing30) (1)
	CreateDynamicObject(870,1791.8000500,-1639.9000200,14.1000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (1)
	CreateDynamicObject(870,1793.9000200,-1640.3000500,14.1000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (2)
	CreateDynamicObject(870,1793.4000200,-1642.0999800,14.1000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (3)
	CreateDynamicObject(870,1791.5000000,-1641.1999500,14.1000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (4)
	CreateDynamicObject(870,1806.0999800,-1626.1999500,13.0000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (5)
	CreateDynamicObject(870,1808.0000000,-1626.8000500,13.0000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (6)
	CreateDynamicObject(870,1806.9000200,-1624.5999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (7)
	CreateDynamicObject(870,1808.8000500,-1625.0999800,13.0000000,0.0000000,0.0000000,0.0000000); //object(veg_pflowers2wee) (8)
	CreateDynamicObject(3515,1805.8000500,-1637.1999500,13.1000000,0.0000000,0.0000000,0.0000000); //object(vgsfountain) (1)
	CreateDynamicObject(1368,1799.0000000,-1645.1999500,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_blocker_bench) (3)
	CreateDynamicObject(1368,1799.0999800,-1639.1999500,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_blocker_bench) (4)
	CreateDynamicObject(1368,1799.1999500,-1633.3000500,13.2000000,0.0000000,0.0000000,90.0000000); //object(cj_blocker_bench) (5)
	CreateDynamicObject(979,1941.1999500,-1769.5999800,13.5000000,0.0000000,0.0000000,90.0000000); //object(sub_roadleft) (2)
	CreateDynamicObject(979,1941.1999500,-1776.5000000,13.5000000,0.0000000,0.0000000,90.0000000); //object(sub_roadleft) (3)
	CreateDynamicObject(979,1942.1999500,-1776.5000000,13.5000000,0.0000000,0.0000000,270.0000000); //object(sub_roadleft) (4)
	CreateDynamicObject(979,1942.1999500,-1769.3000500,13.5000000,0.0000000,0.0000000,270.0000000); //object(sub_roadleft) (5)
	CreateDynamicObject(970,1831.8000500,-1793.6999500,13.1000000,0.0000000,0.0000000,270.0000000); //object(fencesmallb) (1)
	CreateDynamicObject(970,1831.8000500,-1797.9000200,13.1000000,0.0000000,0.0000000,90.0000000); //object(fencesmallb) (2)
	CreateDynamicObject(1432,2126.0000000,-1765.4000200,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (1)
	CreateDynamicObject(1432,2126.3000500,-1772.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (2)
	CreateDynamicObject(1432,2126.3999000,-1781.8000500,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (3)
	CreateDynamicObject(1432,2121.6999500,-1788.6999500,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (4)
	CreateDynamicObject(1432,2113.5000000,-1788.5000000,12.6000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (5)
	CreateDynamicObject(1432,2089.0000000,-1909.1999500,12.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (6)
	CreateDynamicObject(1432,2089.3000500,-1916.0999800,12.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (7)
	CreateDynamicObject(1432,2095.0000000,-1901.9000200,12.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_table_2) (8)
	CreateDynamicObject(3934,741.7999900,-1370.3000500,24.7000000,0.0000000,0.0000000,0.0000000); //object(helipad01) (1)
	// Pay N Spray block
	CreateDynamicObject(971,2071.5900879,-1833.5000000,14.3000002,0.0000000,0.0000000,90.0000000); //object(ct_gatexr) (1)
	CreateDynamicObject(971,490.6000061,-1735.0000000,12.0000000,0.0000000,0.0000000,172.0000000); //object(ct_gatexr) (2)
	CreateDynamicObject(971,1022.7999878,-1029.4599609,32.9000015,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (3)
	CreateDynamicObject(971,1039.0000000,-1026.0000000,32.9000015,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (4)
	CreateDynamicObject(971,2643.6000977,-2039.1999512,14.3000002,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (6)
	CreateDynamicObject(971,2641.3999023,-2039.1999512,14.3000002,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (7)
	CreateDynamicObject(971,717.5000000,-462.6300049,16.8999996,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (8)
	CreateDynamicObject(971,-99.8000031,1111.3000488,21.2999992,0.0000000,0.0000000,359.3999939); //object(subwaygate) (1)
	CreateDynamicObject(971,-1420.5899658,2591.2600098,58.0000000,0.0000000,0.0000000,180.0000000); //object(subwaygate) (2)
	CreateDynamicObject(971,1967.9000244,2162.3000488,13.6999998,0.0000000,0.0000000,270.0000000); //object(wongs_gate) (1)
	CreateDynamicObject(971,-1937.0000000,238.5000000,35.0999985,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (15)
	CreateDynamicObject(971,-1941.8000488,238.5000000,35.0000000,0.0000000,0.0000000,0.0000000); //object(ct_gatexr) (16)
	CreateDynamicObject(971,-1904.3000488,277.7999878,44.0000000,0.0000000,0.0000000,0.0000000); //object(wongs_gate) (2)
	CreateDynamicObject(971,-1925.0000000,300.1000061,41.7999992,0.0000000,0.0000000,90.0000000); //object(ct_gatexr) (17)
	CreateDynamicObject(971,-1925.4000244,305.0000000,41.7999992,0.0000000,0.0000000,90.0000000); //object(ct_gatexr) (18)
	CreateDynamicObject(971,-2425.6000977,1028.1999512,53.2999992,0.0000000,0.0000000,180.0000000); //object(wongs_gate) (3)
	// Government
	CreateDynamicObject(14488, 1469.90002, -1812.5, 5478.2002, 0, 0, 0);
	CreateDynamicObject(1569, 1476.59998, -1823.09998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(2395, 1478, -1823.19995, 5475.7998, 0, 0, 180);
	CreateDynamicObject(2395, 1460.62, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.33997, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468.06995, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.80005, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.5, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.19995, -1804.19995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1474.80005, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1478.40002, -1806.90002, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.40002, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.09998, -1809.64001, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.40002, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.09998, -1812.38, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2614, 1470.09998, -1801.54004, 5480.5, 0, 0, 0);
	CreateDynamicObject(2357, 1470.19995, -1806, 5476.2002, 0, 0, 0);
	CreateDynamicObject(2773, 1478.69995, -1821.59998, 5476.2998, 0, 0, 0);
	CreateDynamicObject(2332, 1470.09998, -1801.19995, 5477.1001, 0, 0, 0);
	CreateDynamicObject(1671, 1470.19995, -1804.5, 5476.2002, 0, 0, 30);
	CreateDynamicObject(1727, 1479.30005, -1811.59998, 5475.7998, 0, 0, 270);
	CreateDynamicObject(1727, 1479.30005, -1809, 5475.7998, 0, 0, 270);
	CreateDynamicObject(2395, 1460.62, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.40002, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.09998, -1815.09998, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.40002, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.09998, -1817.82996, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.30005, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1468, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.69995, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1475.40002, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1479.09998, -1820.56995, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1460.62, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1464.19995, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1467.5, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1471.19995, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1474.5, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2395, 1478.19995, -1823.30005, 5475.83008, 270, 0, 0);
	CreateDynamicObject(2773, 1476.19995, -1821.59998, 5476.2998, 0, 0, 0);
	CreateDynamicObject(1962, 1468.80005, -1801.5, 5478.7998, 0, 0, 0);
	CreateDynamicObject(1961, 1470.09998, -1801.5, 5478.7998, 0, 0, 0);
	CreateDynamicObject(1960, 1471.30005, -1801.5, 5478.7998, 0, 0, 0);
	CreateDynamicObject(1815, 1478.90002, -1811.30005, 5475.7998, 0, 0, 0);
	CreateDynamicObject(2007, 1468.90002, -1801.5, 5476.2998, 0, 0, 0);
	CreateDynamicObject(2007, 1471.19995, -1801.5, 5476.2998, 0, 0, 0);
	CreateDynamicObject(2737, 1463.09998, -1801.59998, 5477.7002, 0, 0, 0);
	CreateDynamicObject(1721, 1461.5, -1804.59998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1721, 1462.69995, -1804.59998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1721, 1463.90002, -1804.59998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1721, 1461.5, -1806.09998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1721, 1462.69995, -1806.09998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1721, 1463.90002, -1806.09998, 5475.7998, 0, 0, 0);
	CreateDynamicObject(14532, 1461, -1801.90002, 5476.7998, 0, 0, 180);
	CreateDynamicObject(14705, 1468.5, -1806.09998, 5476.8999, 0, 0, 0);
	CreateDynamicObject(1569, 1477.19995, -1801.43994, 5475.7998, 0, 0, 0);
	CreateDynamicObject(1808, 1463.80005, -1822.5, 5475.7998, 0, 0, 180);
	CreateDynamicObject(2231, 1465.30005, -1801.19995, 5479.5, 0, 0, 0);
	CreateDynamicObject(2231, 1475.40002, -1801.19995, 5479.5, 0, 0, 0);
	CreateDynamicObject(2637, 1461.40002, -1822.90002, 5476.2002, 0, 0, 0);
	CreateDynamicObject(2788, 1460.69995, -1822.30005, 5476.2998, 0, 0, 90);
	CreateDynamicObject(2788, 1461.80005, -1822.09998, 5476.2998, 0, 0, 130);
	CreateDynamicObject(1235, 1462.90002, -1822.5, 5476.2998, 0, 0, 0);
	CreateDynamicObject(1235, 1479.80005, -1801.80005, 5476.2998, 0, 0, 20);
	CreateDynamicObject(1775, 1475.30005, -1822.19995, 5476.8999, 0, 0, 180);
	CreateDynamicObject(1776, 1474, -1822.19995, 5476.8999, 0, 0, 180);
	CreateDynamicObject(325, 1468.44995, -1806.15002, 5477.1001, 0, 0, 0);
	CreateDynamicObject(2183, 1471.59998, -1814.69995, 5475.7998, 0, 0, 270);
	CreateDynamicObject(2183, 1467, -1814.69995, 5475.7998, 0, 0, 270);
	CreateDynamicObject(2816, 1479.40002, -1810.80005, 5476.2998, 0, 0, 300);
	CreateDynamicObject(2238, 1479.80005, -1810.80005, 5476.7002, 0, 0, 0);
	CreateDynamicObject(2047, 1480.09998, -1810.80005, 5478.7998, 0, 0, 270);
	CreateDynamicObject(2921, 1480.09998, -1822.09998, 5479.7998, 0, 0, 350);
	CreateDynamicObject(2921, 1479.5, -1801.5, 5479.7998, 0, 0, 90);
	CreateDynamicObject(2886, 1478.90002, -1801.43994, 5477.3999, 0, 0, 0);
	// Pershing Square
	CreateDynamicObject(10377, 1481.15, -1792.93, 30.59,   0.00, 0.00, 89.43);
	CreateDynamicObject(7090, 1481.28, -1774.69, 35.03,   0.00, 8.00, 90.00);
	CreateDynamicObject(712, 1465.09, -1774.37, 22.06,   0.00, 0.00, 270.00);
	CreateDynamicObject(712, 1497.77, -1774.39, 22.00,   0.00, 0.00, 270.00);
	CreateDynamicObject(1215, 1492.91, -1774.49, 13.82,   0.00, 0.00, 0.00);
	CreateDynamicObject(1215, 1469.70, -1774.24, 13.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1453.10, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1457.40, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1461.60, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1465.70, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1473.40, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1477.60, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1487.10, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1491.30, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1500.50, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1504.70, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(970, 1508.80, -1742.30, 13.10,   0.00, 0.00, 0.00);
	CreateDynamicObject(640, 1454.40, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1459.70, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1465.00, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1474.10, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1476.90, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1487.80, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1490.60, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1501.20, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1506.50, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(640, 1508.10, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 1451.10, -1744.30, 13.10,   0.00, 0.00, 90.00);
	CreateDynamicObject(970, 1510.80, -1744.40, 13.10,   0.00, 0.00, 90.00);
	CreateDynamicObject(1256, 1451.50, -1744.50, 13.20,   0.00, 0.00, 180.00);
	CreateDynamicObject(1256, 1510.40, -1744.50, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(640, 1453.81, -1742.70, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(1216, 1412.50, -1752.70, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(1216, 1411.00, -1752.70, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(1216, 1410.04, -1753.50, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(1216, 1410.04, -1755.00, 13.20,   0.00, 0.00, 90.00);
	CreateDynamicObject(1216, 1547.90, -1752.70, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(1216, 1546.20, -1752.70, 13.20,   0.00, 0.00, 0.00);
	CreateDynamicObject(1216, 1548.80, -1753.30, 13.20,   0.00, 0.00, 270.00);
	CreateDynamicObject(1216, 1548.80, -1755.00, 13.20,   0.00, 0.00, 270.00);
	CreateDynamicObject(1223, 1409.70, -1752.30, 12.00,   0.00, 0.00, 315.00);
	CreateDynamicObject(1223, 1549.20, -1752.40, 12.00,   0.00, 0.00, 215.00);
	CreateDynamicObject(18981, 1512.12, -1609.72, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1512.14, -1634.67, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1512.12, -1659.54, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1512.10, -1684.43, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1512.10, -1709.04, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1512.10, -1733.70, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.23, -1609.78, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.23, -1634.47, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.23, -1659.31, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.23, -1684.29, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.25, -1709.22, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1487.23, -1734.13, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.46, -1609.60, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.52, -1634.58, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.52, -1659.37, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.50, -1684.32, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.52, -1709.19, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1462.52, -1734.07, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1438.03, -1609.69, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1441.99, -1634.33, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1442.79, -1658.89, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1438.10, -1683.56, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1437.64, -1707.52, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(18981, 1437.98, -1732.34, 11.87,   0.00, 90.00, 0.00);
	CreateDynamicObject(10368, 1479.35, -1678.98, 32.87,   0.00, 0.00, -180.00);
	CreateDynamicObject(655, 1520.22, -1723.10, 12.91,   0.00, 0.00, 0.00);
	CreateDynamicObject(655, 1438.17, -1723.05, 12.89,   0.00, 0.00, 0.00);
	CreateDynamicObject(3511, 1462.22, -1718.38, 12.77,   0.00, 0.00, 0.00);
	CreateDynamicObject(3511, 1482.94, -1718.67, 13.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(712, 1515.45, -1699.30, 22.51,   0.00, 0.00, 0.00);
	CreateDynamicObject(712, 1515.75, -1678.49, 22.44,   0.00, 0.00, 0.00);
	CreateDynamicObject(3511, 1482.92, -1659.16, 12.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(3511, 1462.18, -1659.31, 12.80,   0.00, 0.00, 0.00);
	CreateDynamicObject(712, 1443.07, -1678.55, 22.47,   0.00, 0.00, 0.00);
	CreateDynamicObject(712, 1443.10, -1699.15, 22.45,   0.00, 0.00, 0.00);
	CreateDynamicObject(655, 1519.89, -1634.66, 12.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(655, 1438.46, -1634.64, 12.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(16061, 1485.49, -1602.62, 12.38,   0.00, 0.00, 90.00);
	CreateDynamicObject(16061, 1485.50, -1631.74, 12.36,   0.00, 0.00, 90.00);
	CreateDynamicObject(6965, 1482.81, -1616.72, 15.99,   0.00, 0.00, 0.00);
	CreateDynamicObject(1364, 1461.06, -1631.56, 13.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(1364, 1473.99, -1631.56, 13.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(1364, 1492.50, -1631.56, 13.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(1364, 1503.39, -1631.56, 13.14,   0.00, 0.00, 180.00);
	CreateDynamicObject(1364, 1503.63, -1602.17, 13.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1364, 1492.48, -1602.17, 13.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1364, 1476.86, -1602.17, 13.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(1364, 1461.43, -1602.17, 13.14,   0.00, 0.00, 0.00);
	CreateDynamicObject(3853, 1438.14, -1601.00, 16.17,   0.00, 0.00, 90.00);
	CreateDynamicObject(3853, 1520.55, -1600.91, 16.21,   0.00, 0.00, 90.00);
	CreateDynamicObject(1257, 1436.48, -1629.19, 13.59,   0.00, 0.00, 0.00);
	CreateDynamicObject(1229, 1435.56, -1626.23, 13.85,   0.00, 0.00, 270.00);
	CreateDynamicObject(14468, 1481.73, -1602.55, 12.61,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1471.47, -1602.49, 12.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1487.51, -1602.49, 12.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1496.13, -1602.19, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1499.87, -1601.89, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1508.03, -1602.35, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1465.26, -1602.27, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1456.79, -1602.19, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1456.56, -1631.44, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1464.72, -1631.64, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1469.88, -1631.47, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1478.73, -1631.43, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1482.99, -1631.52, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1487.65, -1631.53, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1496.56, -1631.58, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1499.15, -1631.46, 12.61,   0.00, 0.00, 0.00);
	CreateDynamicObject(14468, 1507.32, -1631.65, 12.37,   0.00, 0.00, 0.00);
	CreateDynamicObject(8623, 1450.36, -1616.66, 12.36,   0.00, 0.00, 90.00);
	CreateDynamicObject(647, 1450.48, -1619.61, 12.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(647, 1450.37, -1616.41, 12.67,   0.00, 0.00, 0.00);
	CreateDynamicObject(647, 1450.21, -1612.75, 12.36,   0.00, 0.00, 0.00);
	CreateDynamicObject(3439, 1450.09, -1610.33, 16.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(3439, 1450.37, -1622.71, 16.43,   0.00, 0.00, 0.00);
	CreateDynamicObject(1294, 1522.71, -1640.77, 16.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(1294, 1522.71, -1656.79, 16.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(1294, 1522.71, -1674.98, 16.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(1294, 1522.71, -1702.54, 16.84,   0.00, 0.00, 180.00);
	CreateDynamicObject(1294, 1486.39, -1725.71, 16.84,   0.00, 0.00, 90.00);
	CreateDynamicObject(1294, 1458.80, -1725.71, 16.84,   0.00, 0.00, 90.00);
	CreateDynamicObject(1294, 1436.15, -1702.61, 16.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(1294, 1436.15, -1675.37, 16.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(1294, 1436.15, -1656.06, 16.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(1294, 1436.15, -1642.41, 16.84,   0.00, 0.00, 0.00);
	CreateDynamicObject(1359, 1438.28, -1633.54, 13.00,   0.00, 0.00, 0.00);
	CreateDynamicObject(1359, 1520.39, -1633.62, 13.08,   0.00, 0.00, 0.00);
	CreateDynamicObject(8673, 1509.88, -1599.75, 13.81,   0.00, 0.00, 0.00);
	CreateDynamicObject(8673, 1489.49, -1599.75, 13.81,   0.00, 0.00, 0.00);
	CreateDynamicObject(8673, 1469.06, -1599.75, 13.81,   0.00, 0.00, 0.00);
	CreateDynamicObject(8673, 1448.63, -1599.75, 13.81,   0.00, 0.00, 0.00);
	//Hospital Interior - By Xeriuss
	CreateDynamicObject(14597,0.19921875,2.00000000,1000.00000000,0.00000000,0.00000000,0.00000000); //object(paperchase07) (1)
	CreateDynamicObject(14593,27.19921875,8.59960938,1000.33001709,0.00000000,0.00000000,270.00000000); //object(paperchase04) (1)
	CreateDynamicObject(1671,22.89999962,4.69999981,998.50000000,0.00000000,0.00000000,100.00000000); //object(swivelchair_a) (1)
	CreateDynamicObject(1723,37.29999924,12.00000000,998.00000000,0.00000000,0.00000000,270.00000000); //object(mrk_seating1) (1)
	CreateDynamicObject(1724,34.29999924,14.50000000,998.00000000,0.00000000,0.00000000,0.00000000); //object(mrk_seating1b) (1)
	CreateDynamicObject(1724,28.20000076,4.19999981,998.00000000,0.00000000,0.00000000,180.00000000); //object(mrk_seating1b) (2)
	CreateDynamicObject(1705,35.29999924,4.19999981,997.99243164,0.00000000,0.00000000,180.00000000); //object(kb_chair04) (1)
	CreateDynamicObject(1723,23.00000000,8.39999962,998.00000000,0.00000000,0.00000000,90.00000000); //object(mrk_seating1) (3)
	CreateDynamicObject(2173,23.89999962,5.30000019,998.00000000,0.00000000,0.00000000,270.00000000); //object(med_office_desk_3) (1)
	CreateDynamicObject(1723,26.29999924,14.50000000,998.00000000,0.00000000,0.00000000,0.00000000); //object(mrk_seating1) (2)
	CreateDynamicObject(1778,13.60999966,-0.43000001,998.00000000,0.00000000,0.00000000,200.00000000); //object(cj_mop_pail) (1)
	CreateDynamicObject(1794,-2.00000000,12.10000038,998.00000000,0.00000000,0.00000000,0.00000000); //object(low_bed_3) (1)
	CreateDynamicObject(1794,0.20000000,10.39999962,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_bed_3) (2)
	CreateDynamicObject(1794,-0.30000001,7.30000019,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_bed_3) (3)
	CreateDynamicObject(1796,7.50000000,7.50000000,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_bed_4) (1)
	CreateDynamicObject(1796,7.50000000,10.80000019,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_bed_4) (2)
	CreateDynamicObject(1796,7.50000000,14.19999981,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_bed_4) (3)
	CreateDynamicObject(1796,8.00000000,7.69999981,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_bed_4) (4)
	CreateDynamicObject(1796,8.00000000,11.00000000,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_bed_4) (5)
	CreateDynamicObject(1796,8.00000000,14.30000019,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_bed_4) (6)
	CreateDynamicObject(1799,-0.20000000,-6.00000000,998.00000000,0.00000000,0.00000000,90.00000000); //object(med_bed_4) (1)
	CreateDynamicObject(1799,-0.60000002,-8.10000038,998.00000000,0.00000000,0.00000000,180.00000000); //object(med_bed_4) (2)
	CreateDynamicObject(1799,0.20000000,-3.29999995,998.00000000,0.00000000,0.00000000,270.00000000); //object(med_bed_4) (3)
	CreateDynamicObject(2002,25.70000076,4.19999981,998.00000000,0.00000000,0.00000000,180.00000000); //object(water_coolnu) (1)
	CreateDynamicObject(2090,8.00000000,-5.40000010,998.00000000,0.00000000,0.00000000,270.00000000); //object(swank_bed_5) (1)
	CreateDynamicObject(2090,9.00000000,-8.19999981,998.00000000,0.00000000,0.00000000,180.00000000); //object(swank_bed_5) (2)
	CreateDynamicObject(2090,7.40000010,-3.59999990,998.00000000,0.00000000,0.00000000,90.00000000); //object(swank_bed_5) (3)
	CreateDynamicObject(2146,15.89999962,3.90000010,998.50000000,0.00000000,0.00000000,100.00000000); //object(cj_trolly1) (1)
	CreateDynamicObject(2095,9.89999962,6.50000000,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_cabinet_2) (1)
	CreateDynamicObject(2095,10.00000000,9.89999962,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_cabinet_2) (2)
	CreateDynamicObject(2095,10.00000000,13.19999981,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_cabinet_2) (3)
	CreateDynamicObject(2095,5.50000000,9.89999962,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_cabinet_2) (4)
	CreateDynamicObject(2095,5.50000000,13.19921875,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_cabinet_2) (5)
	CreateDynamicObject(2095,5.50000000,6.59999990,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_cabinet_2) (6)
	CreateDynamicObject(2088,7.09999990,-10.10000038,998.00000000,0.00000000,0.00000000,180.00000000); //object(low_cabinet_4) (1)
	CreateDynamicObject(2088,10.00000000,-3.20000005,998.00000000,0.00000000,0.00000000,270.00000000); //object(low_cabinet_4) (2)
	CreateDynamicObject(2088,5.50000000,-5.50000000,998.00000000,0.00000000,0.00000000,90.00000000); //object(low_cabinet_4) (3)
	CreateDynamicObject(2025,3.20000005,-6.59999990,998.00000000,0.00000000,0.00000000,270.00000000); //object(mrk_wrobe_tmp) (1)
	CreateDynamicObject(2025,-3.29999995,-3.40000010,998.00000000,0.00000000,0.00000000,90.00000000); //object(mrk_wrobe_tmp) (2)
	CreateDynamicObject(2025,2.09960938,-11.19921875,998.00000000,0.00000000,0.00000000,179.99450684); //object(mrk_wrobe_tmp) (3)
	CreateDynamicObject(2021,0.30000001,14.10000038,998.00000000,0.00000000,0.00000000,0.00000000); //object(mrk_bdsdecab1) (1)
	CreateDynamicObject(2021,2.09999990,8.10000038,998.00000000,0.00000000,0.00000000,270.00000000); //object(mrk_bdsdecab1) (2)
	CreateDynamicObject(2021,-2.20000005,9.60000038,998.00000000,0.00000000,0.00000000,90.00000000); //object(mrk_bdsdecab1) (3)
	CreateDynamicObject(3383,-8.60000038,1.89999998,998.00000000,0.00000000,0.00000000,180.00000000); //object(a51_labtable1_) (1)
	CreateDynamicObject(1498,41.09999847,0.89999998,998.00000000,0.00000000,0.00000000,90.00000000); //object(gen_doorext03) (1)
	printf("Server loaded, approx load time: %dms", GetTickCount()-ltime);
	return 1;
}
