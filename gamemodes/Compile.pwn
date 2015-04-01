/* ============================
-- Includes
=============================== */
#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <zcmd>
#include <YSI\y_hooks>
#include <SPC>
#include <streamer>
#include <strlib>
#include <regex>
#include <foreach>
#include <OPA>
#include <j_fader>
#include <mSelection>
#define DLD_MAX_LIST_ITEMS 50
#define DLD_STRING_SIZE 1600
#define DLItemID DLDPlayerListItems[playerid][listitem]
#define DLParam DLDPlayerListParam[playerid][listitem]
#define MAX_SPEED_INCREASE  	40
#define MIN_FORBIDDEN_SPEED     20

#pragma dynamic 10000
#pragma tabsize 0

/* ============================
-- MySQL
=============================== */
#define HomeServer          0
#define RconSecurity        1

#if HomeServer == 1
	#define SQL_HOST 	"#"
	#define SQL_USER 	"#"
	#define SQL_PASS	"#"
	#define SQL_DB 		"#"
#else
	#define SQL_HOST 	"#"
	#define SQL_USER 	"#"
	#define SQL_PASS	"#"
	#define SQL_DB 		"#"
#endif

/* ============================
-- Defines
=============================== */
#define DIALOG_REGISTER 		1
#define DIALOG_LOGIN       	 	2
#define DIALOG_CHARACTERS  		3
#define DIALOG_CREATE 	 		4
#define DIALOG_PLAY 	 		5
#define DIALOG_CREATE2 	 		6
#define DIALOG_ADMIN        	7
#define DIALOG_SPAWN            8
#define DIALOG_ACCEPTDELETE     9
#define DIALOG_CHANGEPASS	   	10
#define DIALOG_CHANGEPASS2	   	11
#define DIALOG_STATS            12
#define HOUSE_MENU              13
#define HOUSE_MENU2             14
#define DELETE_HOUSE            15
#define DIALOG_CVO	            16
#define DIALOG_FORUMNAME        17
#define DELETE_BIZZ             18
#define DIALOG_247              19
#define DIALOG_PHONE            20
#define DIALOG_FOOD             21
#define DIALOG_CONFIRMPM        22
#define DIALOG_CLOTHES          23
#define DIALOG_SETSPAWN  		24
#define DIALOG_UNIFORMS         25
#define DIALOG_PIZZA            26
#define DIALOG_JOBS	            27
#define DIALOG_LICENSE          28
#define DIALOG_ARMOURY          29
#define DIALOG_SKINSTART        30
#define DIALOG_CLICKPLAYER		31
#define DIALOG_REGISTERACC   	32
#define DIALOG_OPTIONS	   		33

// Furniture
#define DIALOG_FURNITURE        34
#define DIALOG_FURNITUREBUY     35
#define DIALOG_FURNITURELIST    36
#define DIALOG_FURNITURECAT     37

// Returning ..
#define DIALOG_TUT	   			38
#define DIALOG_SAFE             39
#define DIALOG_CSAFE            40
#define DIALOG_WSAFE            41
#define DIALOG_DSAFE            42
#define DIALOG_CCSAFE           43
#define DIALOG_MYHOUSES         44
#define DIALOG_SHOWHOUSE        45

// Inventory / Bags
#define DIALOG_BAG        		46
#define DIALOG_BAGOPTION        47
#define DIALOG_BAGDESC          48
#define DIALOG_BAGDROP          49
#define DIALOG_BAGPICK          50

#define DIALOG_ARMOURY_SIDEARMS 51
#define DIALOG_ARMOURY_SMGS     52
#define DIALOG_ARMOURY_CLIPS    53

// Boombox
#define MAX_BOOMBOX 100
#define DIALOG_BOOMBOX 20010
#define DIALOG_BOOMBOX_POP 20110
#define DIALOG_BOOMBOX_HIPHOP 20210
#define DIALOG_BOOMBOX_ROCK 20310
#define DIALOG_BOOMBOX_COUNTRY 20410

// String Defines
#define MAX_FILE_NAME 			64
#define BYTES_PER_CELL 			4
#define MAX_FACTIONS            20
#define MAX_RANK_NAME           64
#define MAX_HOUSES              1000
#define MAX_BIZZES              200
#define MAX_ZONE_NAME 			28
#define MAX_INTERIORS           150
#define MAX_GROUPS              500
#define MAX_BOOTS               500

#define ADMIN_RECORD_JAIL       1
#define ADMIN_RECORD_KICK       2
#define ADMIN_RECORD_BAN        3

#define MAX_AFK_TIME            900

// Macros
#define PlayerName[%0] GetName(%0)
#define KickEx(%0) SetTimerEx("KickPublic", 200, 0, "d", %0)
#define GivePlayerWeaponEx svCheats_GivePlayerWeapon
#define IsValidEmail(%1) \
    regex_match(%1, "[a-zA-Z0-9_\\.]+@([a-zA-Z0-9\\-]+\\.)+[a-zA-Z]{2,4}")

#define IsValidDate(%1) \
    regex_match(%1, "([1-9]{1,2})+.([1-9]{1,2})+.([1-9]{4})")

#define c_Public(%0,%1) forward public %0(%1); public %0(%1)

// MDC
#define MAX_SERVER_APB              (30)
#define DIALOG_APB_TITLE            "APB System"
#define DIALOG_APB_CREATE_1         (1001)
#define DIALOG_APB_CREATE_2         (1002)
#define DIALOG_APB_DETAILS          (1003)
#define DIALOG_APB_MODIFY           (1004)
#define DIALOG_APB_MODIFY_1         (1005)
#define DIALOG_APB_MODIFY_2         (1006)
#define DIALOG_APB_LIST             (1007)
#define DIALOG_MDC_TITLE            "Police MDC System"
#define DIALOG_MDC_MAIN             (1008)
#define DIALOG_MDC_NAME             (1009)
#define DIALOG_MDC_PLATE_ID         (1010)
#define DIALOG_MDC_PLATE_NAME       (1011)
#define DIALOG_MDC_ERROR            (1012)
#define DIALOG_MDC_NAME_PRINT       (1013)

// Fish
#define MONEY_PER_LBS           0.6
#define MAX_FISH        		20
#define FISH_TIME               7

#define SELLFISH_X              1030.2488
#define SELLFISH_Y              -1930.2048
#define SELLFISH_Z              12.8890

// Jobs
#define	DELIVERY_MAN_JOB		1
#define PIZZA_JOB 				2
#define GARBAGE_MAN_JOB         3
#define FISHER_MAN_JOB          4
#define TAXI_DRIVER_JOB         5

// Delivery Man Job
#define MAX_VEHICLE_CRATES		5
#define MAX_SERVER_CRATES		200
#define MAX_CRATES_PER_PLAYER	5
#define MAX_CRATE_TYPES			14
#define LOADING_TIME 			5000 // 5 seconds, for testing purposes
#define UNLOADING_TIME			5000 // 5 seconds, for testing purposes
#define MONEY_PER_CRATE 		150
#define PRODUCTS_PER_CRATE 		20

#define STORAGE_X   			1765.9542 // Pickup X
#define STORAGE_Y   			-2048.9722 // Pickup Y
#define STORAGE_Z				13.9529 // Pickup Z

// Garbage Man Job
#define MAX_VEHICLE_BAGS        15
#define MAX_SERVER_BAGS     	124
#define MONEY_PER_BAG           80
#define BAG_RECREATION          600000

#define GARBAGE_X               2076.2764 // Pickup X
#define GARBAGE_Y               -2013.3018 // Pickup Y
#define GARBAGE_Z               13.5469 // Pickup Z

// Colors
#define 	COL_EASY           "{FFF1AF}"
#define 	COL_WHITE          "{FFFFFF}"
#define 	COL_BLACK          "{0E0101}"
#define 	COL_GREY           "{C3C3C3}"
#define 	COL_GREEN          "{6EF83C}"
#define 	COL_GREEN1         "{008000}"
#define 	COL_GREENY         "{2ba600}"
#define 	COL_RED            "{f70000}"
#define 	COL_LIGHTRED       "{FF6347}"
#define 	COL_LIGHTGRAY      "{D3D3D3}"
#define 	COL_FADE           "{C8C8C8}"
#define 	COL_LIGHTGREEN     "{1f802b}"
#define 	COL_TESTER         "{A52A2A}"
#define 	COL_YELLOW         "{F3FF02}"
#define 	COL_HELPREQ        "{fed871}"
#define 	COL_LIGHTYELLOW    "{ffe980}"
#define 	COL_ORANGE         "{FFA500}"
#define 	COL_ADMIN          "{0080C0}"
#define 	COL_LIME           "{B7FF00}"
#define 	COL_CYAN           "{00FFEE}"
#define 	COL_LIGHTBLUE      "{00c0ff}"
#define 	COL_DIALOG         "{00c0ff}"
#define 	COL_BLUE           "{0049FF}"
#define 	COL_MAGENTA        "{F300FF}"
#define 	COL_VIOLET         "{B700FF}"
#define 	COL_PINK           "{FF00EA}"
#define 	COL_MARONE         "{A90202}"
#define 	COL_CMD            "{B8FF02}"
#define 	COL_PARAM          "{3FCD02}"
#define 	COL_SERVER         "{AFE7FF}"
#define 	COL_VALUE          "{A3E4FF}"
#define 	COL_RULE           "{F9E8B7}"
#define 	COL_RULE2          "{FBDF89}"
#define 	COL_RWHITE         "{FFFFFF}"
#define 	COL_LGREEN         "{C9FFAB}"
#define 	COL_LRED           "{FFA1A1}"
#define 	COL_LRED2          "{C77D87}"
#define 	COL_LBLUE          "{BCD4E6}"
#define 	COL_YANIR          "{0BD900}"

#define COLOR_GREEN  			0x008000FF
#define COLOR_WHITE             0xFFFFFFFF
#define COLOR_YELLOW            0xF3FF02FF
#define COLOR_FADE1 			0xE6E6E6E6
#define COLOR_FADE2 			0xC8C8C8C8
#define COLOR_FADE3 			0xAAAAAAAA
#define COLOR_FADE4 			0x8C8C8C8C
#define COLOR_FADE5 			0x6E6E6E6E
#define COLOR_RED   			0xFF634700
#define COLOR_GRAY              0xA8A8A8FF
#define COLOR_PURPLE            0xC2A2DAAA
#define COLOR_TESTER 			0xA52A2AAA
#define COLOR_POLICE            0x8D8DFF00

// Furniture
#define MAX_FURNITURES          1000
#define MAX_LIST_ITEMS          100
#define MAX_ITEMS               200
#define MAX_DROPPED_ITEMS       1000

#define GetItem(%0) pList[playerid][%0]
#define SetItem(%0, %1) pList[playerid][%0] = %1


main()
{
	print("\n----------------------------------");
	print("PROJECT REALITY ROLEPLAY");
	print("----------------------------------\n");
	printf("%d", 100000*1.005);
}

enum DropItemEnum
{
	dItem,
	dObject,
	dAmount,
	dLoaded,
	dLoadAmount,
	Float:dPos[3],
	Text3D:dLabel
}
new DropItem[MAX_DROPPED_ITEMS][DropItemEnum];

enum ItemDet
{
	Item,
    Name[64],
    Object
}
// Gun names
new Items[][ItemDet] =
{
	// 1. Item ID
	// 2. Item Name
	// 3. Item Object
	// ------------------------------------------------------
	{0, "None", 0},
	{1, "Knuckles", 331},
	{2, "Golf Club", 333},
	{3, "Baton", 334},
	{4, "Knife", 335},
	{5, "Baseball Bat", 336},
	{6, "Shovel", 337},
	{7, "Pool Cue", 338},
	{8, "Katana", 339},
	{9, "Chainsaw", 341},
	{10, "Double-ended Dildo", 321},
	{11, "Dildo", 322},
	{12, "Vibrator", 323},
	{13, "Silver Vibrator", 324},
	{14, "Flowers", 325},
	{15, "Cane", 326},
	{16, "Grenade", 342},
	{17, "Tear Gas", 343},
	{18, "Molotov", 344},
	{22, "Beretta 9mm", 346},
	{23, "Heckler & Koch USP", 347},
	{24, "Walther PPK", 348},
	{25, "Mossberg 500", 349},
	{26, "Mossberg 590", 350},
	{27, "Mossberg 930 Autoloader", 351},
	{28, "MAC-10", 352},
	{29, "Heckler & Koch MP5/10", 353},
	{30, "Kalashnikov", 355},
	{31, "M4 Carbine", 356},
	{32, "AB-10", 372},
	{33, "Lee-Enfield", 357},
	{34, "THOR M408 Long Range", 358},
	{35, "RPG", 359},
	{36, "RPG-7", 360},
	{37, "LPO-50", 361},
	{38, "Minigun", 362},
	{39, "Satchel Charge", 363},
	{40, "Detonator", 364},
	{41, "Spraycan", 365},
	{42, "Fire Extinguisher", 366},
	{43, "Nikon D3200", 367},
	{44, "Goggles", 368},
	{45, "Thermal Goggles", 369},
	{46, "Parachute", 371},
	{100, "12x76 Slug", 2040}, // Mossberg 500
	{101, "9x18mm", 2040}, // Beretta 9mm
	{102, "5.56x45mm", 2040}, // Lee-Enfield
	{103, "7.62x54mm", 2040}, // THOR M408 Long Range
	{104, "Kevlar Vest", 0},
	{105, "Radio Device", 18875},
	{106, "Taser", 18642}
};

enum BagData
{
	bagItemID,
	bagItem,
	bagItemAmount,
	bagItemLoaded,
	bagItemLoadAmount,
	bagItemAttached,
	bagItemObject,
	bagItemServer,
}
new Bag[MAX_PLAYERS][BagData][MAX_ITEMS];

// Furniture
new
BuyingObject[MAX_PLAYERS],
SelectFurn[MAX_PLAYERS],
bool:HouseLights[MAX_HOUSES],
Text:LightTD;

new bool:BuyingFurn[MAX_PLAYERS];
new bool:EditingFurn[MAX_PLAYERS];

new pList[MAX_PLAYERS][MAX_LIST_ITEMS];

enum ClothDet
{
	Object,
    Index,
    Bone,
    Name[64],
    Price,
	Category
}

stock GetPlayersInAnyVehicle(vehicleid)
{
    new count = 0;
    for(new i,j = GetMaxPlayers(); i < j; i++ )
	{
	    if(!IsPlayerConnected(i)) continue;
	    if(!IsPlayerInVehicle(i, vehicleid)) continue;
	    count += 1;
	}
    return count;
}

new Clothes[][ClothDet] =
{
	// 1. Object ID
	// 2. Object Index
	// 3. Object Bone
	// 4. Object Name
	// 5. Object Price
	// 6. Object Category
	// ------------------------------------------------------
	// Glasses
	{19006, 3, 2, "Red Sunglasses", 450, 1},
    {19007, 3, 2, "Orange Sunglasses", 450, 1},
    {19008, 3, 2, "Green Sunglasses", 450, 1},
    {19009, 3, 2, "Blue Sunglasses", 450, 1},
    {19010, 3, 2, "Purple Sunglasses", 450, 1},
    {19012, 3, 2, "Black Sunglasses", 450, 1},
    {19014, 3, 2, "Transparent Sunglasses", 450, 1},
    {19015, 3, 2, "Basic Glasses", 450, 1},
    {19017, 3, 2, "Yellow Shield Sunglasses", 550, 1},
    {19018, 3, 2, "Orange Shield Sunglasses", 550, 1},
    {19019, 3, 2, "Pink Shield Sunglasses", 550, 1},
    {19020, 3, 2, "Blue Shield Sunglasses", 550, 1},
    {19021, 3, 2, "Green Shield Sunglasses", 550, 1},
    {19022, 3, 2, "Black Aviators", 650, 1},
    {19023, 3, 2, "Blue Aviators", 650, 1},
    {19024, 3, 2, "Purple Aviators", 650, 1},
    {19025, 3, 2, "Pink Aviators", 650, 1},
    {19027, 3, 2, "Orange Aviators", 650, 1},
    {19028, 3, 2, "Yellow Aviators", 650, 1},
    {19029, 3, 2, "Green Aviators", 650, 1},
    {19030, 3, 2, "Brown Warfarer Sunglasses", 550, 1},
    {19031, 3, 2, "Green Warfarer Sunglasses", 550, 1},
    {19032, 3, 2, "Pink Warfarer Sunglasses", 550, 1},
    {19033, 3, 2, "Black Warfarer Sunglasses", 500, 1},
    {19035, 3, 2, "Stormy Warfarer Sunglasses", 550, 1},
    // Hats
    {18926, 4, 2, "Army Cadet Hat", 350, 2},
    {18927, 4, 2, "Waves Cadet Hat", 350, 2},
    {18928, 4, 2, "Colorful Cadet Hat", 350, 2},
    {18929, 4, 2, "Grey Cadet Hat", 350, 2},
    {18930, 4, 2, "Fire Cadet Hat", 350, 2},
    {18931, 4, 2, "Stormy Cadet Hat", 350, 2},
    {18933, 4, 2, "Yellow & Dots Cadet Hat", 350, 2},
    {18935, 4, 2, "Sponge Cadet Hat", 350, 2},
    {19093, 4, 2, "White Baseball Cap", 450, 2},
    {19160, 4, 2, "Yellow Baseball Cap", 450, 2},
};

enum FurnDet
{
	Object,
    Authority,
    Name[64],
    Price,
	Category
}

enum SafesData
{
	ID = 0,
	HouseID,
	sMoney,
	bool:sLocked,
	Code,
	Text3D:sLabel
}
new Safe[MAX_HOUSES][SafesData];


new Furnitures[][FurnDet] =
{
	// 1. Object ID
	/*
		2. Item Authority
		    - 0 * None
		    - 1 * Door (lock, unlock, open, close)
		    - 2 * Safe (withdraw, deposit)
		    - 3 * TV (watch SAN News reports)
		    - 4 * Storage
	*/
	// 3. Object Name
	// 4. Object Price
	// 5. Object Category
	// ------------------------------------------------------
	// Beds
	{1700, 0, "Medium Pink Bed", 1000, 1},
	{1701, 0, "Kingsize Bed", 1700, 1},
	{1745, 0, "Teenager Green & Blue Bed", 700, 1},
	{1771, 0, "Prison Bed", 600, 1},
	{1794, 0, "Large Couple Bed", 1150, 1},
	{1795, 0, "Wooden Mattress", 1450, 1},
	{1796, 0, "Small Single Bed", 750, 1},
	{1797, 0, "Elegant Wooden Bed", 980, 1},
	{1798, 0, "Wooden Dark Blue Bed", 1050, 1},
	{1799, 0, "Large Yellow Couple Bed", 1000, 1},
	{1793, 0, "Double Mattress", 600, 1},
	{1802, 0, "Old Wooden Bed", 950, 1},
	// Decorations
	{3964, 0, "Red & Orange Painting", 450, 2},
	{3963, 0, "Orange Squares Painting", 450, 2},
	{3962, 0, "Colorful Painting", 450, 2},
	{2289, 0, "City Painting", 450, 2},
	{2288, 0, "Wooden 3D Painting", 450, 2},
	{2287, 0, "Large Sea Painting", 450, 2},
	{2286, 0, "Giant Ship Painting", 450, 2},
	{2285, 0, "Sand Painting", 450, 2},
	{2284, 0, "Old Castle Painting", 450, 2},
	{2283, 0, "Colorful Framed Painting", 450, 2},
	{2282, 0, "Sunset Painting", 450, 2},
	{2281, 0, "Richman Bridge Painting", 450, 2},
	{2280, 0, "Palomino Creek's Coast Painting", 450, 2},
	{2279, 0, "Mount Chilliad Painting", 450, 2},
	{2278, 0, "Ocean Docks Painting", 450, 2},
	{2277, 0, "White Kitty Painting", 450, 2},
	{2276, 0, "San Fierro Bridge Painting", 450, 2},
	{2275, 0, "Fruits Painting", 450, 2},
	{2274, 0, "Red Rose Painting", 450, 2},
	{2631, 0, "Red Roses Framed Painting", 650, 2},
	{2632, 0, "Green View Painting", 650, 2},
	{2817, 0, "Bubbles Carpet", 650, 2},
	{2818, 0, "Red & Orange Carpet", 650, 2},
	{2841, 0, "Cyan Circle Carpet", 650, 2},
	{2842, 0, "Pink Diamonds Carpet", 650, 2},
	{2196, 0, "Work Lamp", 650, 2},
	{2238, 0, "Lava Lamp", 650, 2},
	// Comfort
	{2617, 0, "2 Chairs + Table 1", 1250, 3},
	{2572, 0, "2 Chairs + Table 2", 1250, 3},
	{2571, 0, "2 Chairs + Table 3", 1250, 3},
	{2357, 0, "Wide Desk", 1800, 3},
	{2290, 0, "Brown Lether Sofa", 1650, 3},
	{2118, 0, "Dining Table 1", 1200, 3},
	{2117, 0, "Dining Table 2", 1350, 3},
	{2116, 0, "Low Dining Table 1", 950, 3},
	{2115, 0, "Low Dining Table 2", 800, 3},
    {2112, 0, "Medium Wooden Dining Table", 1020, 3},
    {2111, 0, "Circled Wooden Dining Table", 1500, 3},
    {2109, 0, "Light Wooden Dining Table", 1350, 3},
    {2086, 0, "Circled Glass Table", 2100, 3},
    {2085, 0, "Glass Work Desk", 2500, 3},
    {2080, 0, "Office Desk", 1700, 3},
    {1768, 0, "Low Couch", 1100, 3},
    {1766, 0, "Medium Couch", 1200, 3},
    {1764, 0, "Low Couch 1", 1450, 3},
    {1763, 0, "Low Couch 2", 1300, 3},
    {1761, 0, "Swank Couch", 1200, 3},
    {1757, 0, "Low Couch 3", 950, 3},
    {1753, 0, "Swank Couch", 1270, 3},
    {1713, 0, "Black Wide Sofa", 1600, 3},
    {1710, 0, "Large Lightbrown Sofa", 1400, 3},
    {1706, 0, "Wooden Sofa", 1900, 3},
    {1702, 0, "Wooden Brown Sofa", 1850, 3},
    {15037, 0, "Dining Table + TV", 2700, 3},
    {1754, 0, "Single Swank Sofa", 1200, 3},
    {1755, 0, "Single Medium Sofa", 1300, 3},
    {1758, 0, "Low Single Sofa", 700, 3},
    {1759, 0, "Wooden + Flowers Sofa", 1250, 3},
    {1762, 0, "Single Wooden Swank Sofa", 1000, 3},
    {1765, 0, "Single Old Sofa", 650, 3},
    {1813, 0, "White Coffe Table", 2500, 3},
    {1814, 0, "Wooden Coffe Table", 2100, 3},
    {1815, 0, "Circled Coffe Table", 1800, 3},
    {1819, 0, "Circled Metal Coffe Table", 1500, 3},
    {1822, 0, "Dark Wood Coffe Table", 2100, 3},
    {2126, 0, "Wide Dark Coffe Table", 1600, 3},
    // Doors
    {3089, 1, "Wooden Door + 2 Windows", 1600, 4},
    {1493, 1, "Red Wooden Door", 1050, 4},
    {1494, 1, "Dark Blue Door", 850, 4},
    {1498, 1, "White Basic Door", 800, 4},
    {1499, 1, "Prison Cell Door", 600, 4},
    {1501, 1, "Wooden Trap Door", 600, 4},
    {1504, 1, "Red Elegant Door", 1200, 4},
    {1505, 1, "Blue Elegant Door", 1200, 4},
    {1506, 1, "White Elegant Door", 1200, 4},
    {1507, 1, "Yellow Elegant Door", 1200, 4},
    {1535, 1, "Basic Hotel Room Door", 600, 4},
    // Electronics
    {1429, 3, "Grey Wooden TV", 1200, 5},
    {1661, 0, "Rotate Fan", 750, 5},
    {1717, 3, "TV Stand", 1600, 5},
    {1719, 0, "Console", 1400, 5},
    {1752, 3, "Black Old TV", 650, 5},
    {2126, 0, "Swank Fashioned TV", 2100, 5},
    {1783, 0, "Dark Video Recorder", 1600, 5},
    {1785, 0, "Light Video Recorder", 1600, 5},
    {1808, 0, "Watercooler", 2700, 5},
    {1809, 0, "Streo Tape", 4700, 5},
    {1839, 0, "Old Streo Tape", 3500, 5},
    {1840, 0, "Speaker", 2500, 5},
    {2028, 0, "Gaming Console", 1200, 5},
    {2091, 3, "Large TV Stand", 6000, 5},
    {2093, 3, "Medium TV Stand", 4000, 5},
    {2099, 0, "Radio Tape", 2100, 5},
    {2102, 0, "Dark Boombox", 1000, 5},
    {2103, 0, "Light Boombox", 1000, 5},
    {2104, 0, "Tall Dark Radio Tape", 1700, 5},
    {2186, 0, "Photocopier", 2500, 5},
    {2190, 0, "Computer", 1100, 5},
    {2192, 0, "Fan", 300, 5},
    {2201, 0, "Printer", 750, 5},
    {2229, 0, "Dark Yellow Speaker", 1200, 5},
    {2230, 0, "Wooden Speaker", 750, 5},
    {2232, 0, "Low Dark Speaker", 1800, 5},
    {2233, 0, "White Speaker Stand", 4700, 5},
	// Cabinets
	{1730, 0, "Wooden Yellow Cabinet", 3700, 6},
	{1740, 0, "Low Wooden Drawer", 2100, 6},
	{1741, 0, "Low Wooden Drawer", 1700, 6},
	{1742, 0, "Bookshelf", 1900, 6},
	{1743, 0, "Medium Cabinet + TV Stand", 1200, 6},
	{1744, 0, "Wooden Shelf", 950, 6},
	{2087, 0, "Medium Cabinet", 1400, 6},
	{2088, 0, "Large Cabinet + Drawers", 3600, 6},
    {2089, 0, "Dark Wood Cabinet", 1200, 6},
    {2161, 0, "Dark Wood Bookshelf", 1700, 6},
    {2163, 0, "White Wooden Cabinet", 1600, 6},
    {2164, 0, "White Cabinet + Bookshelf", 2700, 6},
    {2167, 0, "Office White Cabinet", 3700, 6},
    // Kitchen
    {936, 0, "Grey Wooden Drawers", 2300, 7},
    {937, 0, "Grey Wooden Shelf", 1200, 7},
    {2128, 0, "Red Tall Storage Cabinet", 2100, 7},
    {2129, 0, "Red Stove", 2600, 7},
    {2133, 0, "White Storage Drawers", 2800, 7},
    {2138, 0, "Wooden Storage Unit", 3200, 7},
    {2141, 0, "White Storage Cabinet", 3100, 7},
    {2143, 0, "Washing Machine", 1100, 7},
    {2152, 0, "Wooden White Cabinet", 1200, 7},
    {2154, 0, "White Washbasin", 1900, 7},
    {2149, 0, "Microwave", 350, 7},
    {2426, 0, "Oven", 450, 7},
    // Plumbing
    {2514, 0, "White Basic Toilet", 750, 8},
    {2516, 0, "White Bath", 2400, 8},
    {2517, 0, "Glass Shower", 1600, 8},
    {2518, 0, "Sink", 670, 8},
    {2520, 0, "Covered Shower", 1300, 8},
    {2521, 0, "White Squared Toilet", 650, 8},
    {2522, 0, "Dark Wood Bath", 2200, 8},
    {2523, 0, "Tall Sink", 700, 8},
    {2525, 0, "Toilet", 450, 8},
    {2526, 0, "Lightwood Bath", 2800, 8},
    {2528, 0, "Dark Wood Toilet", 750, 8},
    // Gyms
    {2627, 0, "Treadmill", 4800, 9},
    {2628, 0, "Pulling Bench", 3200, 9},
    {2629, 0, "Lift Bench", 2100, 9},
    {2630, 0, "Exercise Bike", 4100, 9},
    {1985, 0, "Punching Bag", 750, 9},
    // Other
    {2197, 4, "Locker", 6000, 10},
    {2332, 2, "Safe", 3200, 10},
    // Special
    {3065, 0, "Basketball", 250, 11},
    {2614, 0, "Double USA Flag", 750, 11},
    {2993, 0, "Green FLag", 450, 11},
    {2047, 0, "Los Santos CDF Flag", 250, 11}
};
new furnObject[MAX_PLAYERS];

// Else
forward CreatePlayer(playerid, name[], password[]);
forward CreateCharacter(playerid, name[], creator[], slot);
forward DeleteCharacter(playerid, name[], creator[], slot);
forward LoadCharacters(playerid);
forward LoadCharacter(playerid, name[]);
forward SavePlayer(playerid, name[]);
forward SaveCharacter(playerid, name[]);
forward ShowCharacterList(playerid, creator[]);
forward BanPlayer(targetid, reason[], admin[]);
forward UnbanPlayer(playerid, creator[]);
forward JailTimer();
forward PrisonTimer();
native WP_Hash(buffer[], len, const str[]);
native gpci(playerid, serial[], len);
native IsValidVehicle(vehicleid);
forward SendFMessage(family, color, string[]);
forward SendGroupMessage(group, color, string[]);
forward SendRadioMessage(playerid, channel, color, string[]);
forward PhoneRing(playerid);
forward ReducePhoneCredits(playerid);
forward ReduceFuel(vehicleid);
forward CountdownFuel(playerid);
forward FadeScreen(playerid, type);
forward OnPlayerFade(playerid, num);
forward PrintHud(playerid);
forward LoadGarbageMission(playerid);
forward StopGarbageMission(playerid);
forward GetRandomBag();
forward BagRecreation(bagid, Float:yX, Float:yY, Float:yZ);
forward GetRandomHouseWithRange(playerid);
forward UpdatePizzaTextdraw(playerid, sec);
forward OnPlayerEnterPizzaCheckpoint(playerid);
forward LoadMission(playerid);

enum E_APB
{
    ID,
    APB[64],
    Charge[64],
    Creator[64], // MAX_PLAYER_NAME + Timestamp
    Modified[64] // MAX_PLAYER_NAME + Timestamp
}

new
emsPickup[3],
g_szMessage[128],
_APB[MAX_SERVER_APB][E_APB],
bool:eGate,
bool:pGate,
bool:pBarrier,
bool:pDoor[4],
pdgate, pdbarrier, emsgate, pddoor[4],
playerTag[MAX_PLAYERS][128],
bool:ShowPM[MAX_PLAYERS],
Text3D:playerNametag[MAX_PLAYERS],
PlayerText:dTextdraw[MAX_PLAYERS][15],
PlayerText:LocationName[MAX_PLAYERS],
Bag_Page[MAX_PLAYERS] = 0,
bItem[MAX_PLAYERS],
DroppedItem[MAX_PLAYERS],
AttachingWeapon[MAX_PLAYERS],
Text:FadeDraw[MAX_PLAYERS],
FadeTime[MAX_PLAYERS],
Text:MoneyDraw[MAX_PLAYERS],
Text:MoneyDraw2,
Text:ServerDraw,
Text:PlayerHud[8],
Text:PlayerHudS[5][MAX_PLAYERS],
Float:JobPos[MAX_PLAYERS][3],
Float:LastPos[MAX_PLAYERS][3],
Tutorial[MAX_PLAYERS],
TutorialTimer[MAX_PLAYERS],
bool:TaxiDuty[MAX_PLAYERS],
TaxiFare[MAX_PLAYERS],
bool:RequestedTaxi[MAX_PLAYERS],
taxicall[MAX_PLAYERS],
TaxiString[MAX_PLAYERS][156],
TaxiTarget[MAX_PLAYERS],
TaxiTimer[MAX_PLAYERS],
TaxiCount[MAX_PLAYERS],
gUser, gType,
bool:Downed[MAX_PLAYERS],
DownTimer[MAX_PLAYERS],
bool:BlockedPM[MAX_PLAYERS][MAX_PLAYERS],
Offer[MAX_PLAYERS],
ChosenStyle[MAX_PLAYERS],
light[MAX_VEHICLES],
bool:siren[MAX_VEHICLES],
LoadingCargo[MAX_PLAYERS], // Global Variable
PDPickup[3],
ArmouryPickup,
ArmouryCP,
bool:SeeHUD[MAX_PLAYERS],
bool:Cuffed[MAX_PLAYERS],
AFKTimer[MAX_PLAYERS],
AFKCount[MAX_PLAYERS],
DLDPlayerListItems[MAX_PLAYERS][DLD_MAX_LIST_ITEMS],
DLDPlayerListParam[MAX_PLAYERS][DLD_MAX_LIST_ITEMS],
DLDLastIS,
DLDString[1600],
CaringAbout[MAX_PLAYERS],
PlayerHasTazer[MAX_PLAYERS],
TazerHolster[MAX_PLAYERS],
pTazed[MAX_PLAYERS],
FriskOffer[MAX_PLAYERS],
NeedHelp[MAX_PLAYERS],
HelpString[MAX_PLAYERS][128],
DealershipPickup,
FishPickup,
DrivingPickup,
FishTimer[MAX_PLAYERS],
bool:IsFishing[MAX_PLAYERS],
Fishes[MAX_PLAYERS],
FishLBS[MAX_PLAYERS],
PlayerText:TD_GARBAGE_BAGS[MAX_PLAYERS],
bool:CarryingBag[MAX_PLAYERS],
Mission_Map[MAX_PLAYERS],
bool:BagCreated[MAX_SERVER_BAGS],
Bag_Objects[MAX_SERVER_BAGS],
vBags[MAX_VEHICLES],
Garbage_PU,
CharacterPick[MAX_PLAYERS], 	// Character pick from 1 to 3 on connect
gString[256], 					// Global use of string
bool:Logged[MAX_PLAYERS], 		// If player has logged in
bool:FactionChat[MAX_PLAYERS],
bool:AdminChat[MAX_PLAYERS],
bool:SupportChat[MAX_PLAYERS],
bool:BothChat[MAX_PLAYERS],
bool:SentReport[MAX_PLAYERS],
bool:SentHelpmea[MAX_PLAYERS],
bool:SentHelpme[MAX_PLAYERS],
InCall[MAX_PLAYERS],
Calling[MAX_PLAYERS],
CountDown[MAX_PLAYERS],
CountDownTimer[MAX_PLAYERS],
EngineTimer[MAX_VEHICLES] = 0,
CallOffer[MAX_PLAYERS],
CallTimer[MAX_PLAYERS],
ReduceCredits[MAX_PLAYERS],
bool:HaveDice[MAX_PLAYERS],
bool:OnDuty[MAX_PLAYERS],
bool:HaveGasCan[MAX_PLAYERS],
PlayerText:Textdraw2[MAX_PLAYERS], // RADIOSLOT
PMcontent[MAX_PLAYERS][256],
bool:MaskOn[MAX_PLAYERS],
bool:HaveMask[MAX_PLAYERS],
PMto[MAX_PLAYERS],
bool:VehicleSpawned[MAX_VEHICLES],
bool:ShowCP[MAX_PLAYERS],
Float:xa,Float:ya,Float:za, // Global xyz varribles
Text3D:PlayerDamage[MAX_PLAYERS],
PlayerDamageTimer[MAX_PLAYERS],
bool:AdminSpectate[MAX_PLAYERS], // If admin spectates
bool:oocChat = false, // Disables/enables OOC chat.
bool:AdminDuty[MAX_PLAYERS], // If admin on duty
bool:DevMode[MAX_PLAYERS],
bool:ModeratorDuty[MAX_PLAYERS],
GroupInvite[MAX_PLAYERS], // Invitation to Group
FactionInvite[MAX_PLAYERS], // Invitation to Faction
bool:Engine[MAX_VEHICLES], // If vehicle's engine is turned on or off
bool:AdminVehicle[MAX_VEHICLES], // If vehicle is admin's
vEngine, vAlarm, vLights, vBonnet, vDoors, vBoot, vObjective,
_query[512], // This is for mysql queries, as they can get very large. (It may become 1024 cells in the future!)
Float:oldHealth[MAX_PLAYERS], Float:oldArmour[MAX_PLAYERS], // Old armour and Health on aduty
AdvertTimer, bool:Advertable,
day, month, year, // Global
InHouse[MAX_PLAYERS] = -1, // Checks prop id, house or business
InInterior[MAX_PLAYERS] = -1,
InBiz[MAX_PLAYERS] = -1,
ServerTime,
bool:ServerLocked, ServerLockReason[128],
bool:AnticheatSpam[MAX_PLAYERS],
bool:VehicleSpam[MAX_PLAYERS];

new Float:CarDealershipSpawn[][4] =
{
	{1441.1412,-1640.4271,13.0984,179.8794},
	{1444.4850,-1640.3790,13.0987,179.7942},
	{1447.8195,-1640.3632,13.0986,179.3141},
	{1451.1306,-1640.3861,13.0985,180.0125},
	{1454.4415,-1640.4752,13.0987,180.0880},
	{1457.7682,-1640.4384,13.0987,179.7385},
	{1461.0878,-1640.3796,13.0987,179.7313},
	{1464.3771,-1640.3843,13.0987,179.8398},
	{1467.7266,-1640.3867,13.0987,180.1227},
	{1471.0302,-1640.3379,13.0985,179.8145},
	{1474.3621,-1640.4125,13.0987,179.8089},
	{1477.6714,-1640.3140,13.0983,179.6427},
	{1481.0142,-1640.3451,13.0999,179.8945},
	{1484.3390,-1640.4275,13.1015,179.9687},
	{1487.5839,-1640.3987,13.0983,179.9308},
	{1490.9221,-1640.4412,13.0987,180.4793},
	{1494.2048,-1640.4225,13.0987,180.6335},
	{1497.5969,-1640.4286,13.0987,180.1791},
	{1500.8456,-1640.3949,13.0985,180.4489},
	{1504.2200,-1640.3969,13.0985,180.5299},
	{1507.5198,-1640.3444,13.0983,180.0302},
	{1510.7921,-1640.2928,13.0986,179.9553},
	{1514.1450,-1640.3958,13.0983,180.1436},
	{1517.4941,-1640.4092,13.0984,180.1221}
};

new Float:BoatDealershipSpawn[][4] =
{
	{2488.2244,-2269.4822,-0.2876,268.3414},
	{2505.8374,-2269.9185,-0.2609,268.6384},
	{2527.7588,-2270.2305,-0.2800,269.6804},
	{2293.5430,-2431.2368,-0.5254,312.9550},
	{2314.4131,-2411.6143,-0.4121,313.4105}
};

new Float:AirplaneDealershipSpawn[][4] =
{
	{1993.5604,-2251.6091,13.7233,89.8862},
	{1992.3285,-2313.7368,13.7235,90.8874},
	{1993.2755,-2380.5325,13.7236,90.6211},
	{2030.2362,-2502.2183,14.0061,89.6810},
	{2030.3256,-2485.7217,13.9986,90.3665},
	{2030.1206,-2585.8484,14.0064,89.8613},
	{2030.0566,-2601.0300,14.0061,89.4372}
};

new Float:FishLocation[][3] =
{
    {354.6385,-2088.6462,7.8359},
    {362.1688,-2088.7896,7.8359},
    {367.3336,-2088.7983,7.8359},
    {369.9807,-2088.7983,7.8359},
    {374.9754,-2088.7983,7.8359},
    {383.3243,-2088.7979,7.8359},
    {390.9970,-2088.7961,7.8359},
    {396.3368,-2088.7969,7.8359},
    {398.8060,-2088.7983,7.8359},
    {403.9836,-2088.7983,7.8359}
};

new Float:LicenseCheckpoint[][3] =
{
	{1269.5153,-1841.3824,13.2669},
	{1243.4070,-1849.9869,13.2578},
	{1074.4822,-1849.8903,13.2663},
	{1063.7267,-1842.0382,13.3112},
	{1042.6097,-1805.3280,13.5235},
	{1018.1477,-1792.8838,13.6770},
	{956.0985,-1776.5175,13.9680},
	{920.9040,-1766.1379,13.2580},
	{920.5568,-1720.5532,13.2578},
	{920.6670,-1647.0280,13.2578},
	{919.9551,-1582.8073,13.2578},
	{919.6074,-1502.0103,13.2453},
	{920.3489,-1416.2053,13.0917},
	{941.0290,-1408.7306,13.1225},
	{1057.9379,-1411.8257,13.2702},
	{1052.1500,-1476.7899,13.2576},
	{1035.4653,-1563.3796,13.2426},
	{1047.4105,-1575.3506,13.2611},
	{1146.4430,-1580.2426,13.1481},
	{1147.5553,-1704.3019,13.6562},
	{1171.8528,-1719.6096,13.5462},
	{1173.1847,-1844.1836,13.2781},
	{1190.7037,-1855.2626,13.2739},
	{1212.5061,-1844.6149,13.2577},
	{1231.4425,-1826.5734,13.2850}
};

enum BoomboxE
{
        Bmodel,
        Bobjectid,
    Float: Bpos[3],
    Float: Brotation[3],
        Bareaid,
    Bowner[24],
    Bstationurl[264],
        Bvolume,
}
new Boombox[MAX_BOOMBOX][BoomboxE];
new BoomboxID[MAX_PLAYERS] = -1;
new BoomboxModel[MAX_PLAYERS];
new BOOMBOXLIST[100] = "Pop\nR&B and Urban\nRock\nCountry\nTurn Off";

enum DLicenseData
{
	Step,
	bool:TookTest,
	Float:licPos[3],
	dTimer,
	Checkpoint,
	Warns
}
new DLic[MAX_PLAYERS][DLicenseData];

enum FishData
{
	FishName[32],
	FishMin,
	FishMax
}

new Fish[][FishData] =
{
	// Name, Minimum LBS, Maximum LBS
	{"Shark", 60, 80}, // 0
	{"Sardine", 10, 15}, // 1
	{"Tilefish", 20, 30}, // 2
	{"Wrasse", 20, 30}, // 3
	{"Carp", 30, 40}, // 4
	{"Tuna", 40, 50}, // 5
	{"Milkfish", 20, 35}, // 6
	{"Shrimp", 10, 20}, // 7
	{"Salamon", 25, 40}, // 8
	{"Bass", 35, 55}, // 9
	{"Swordfish", 45, 65}, // 10
	{"Lobster", 20, 35}, // 11
	{"Snail", 10, 15}, // 12
	{"Turtle", 80, 90}, // 13
	{"Dennis", 30, 40}, // 14
	{"Boots", 0, 0}, // 15
	{"Wallet", 0, 0} // 16
};

new Float:Garbage_BAGS[MAX_SERVER_BAGS][3] =
{
    {2778.6362,-1974.5839,13.5415},
    {2778.8848,-1950.5525,13.5469},
    {2778.9990,-1926.9176,13.5394},
    {2760.0579,-1940.1531,13.5394},
    {2759.9048,-1976.9438,13.5471},
    {2694.5811,-1994.5800,13.5547},
    {2677.8838,-1994.7418,13.5547},
    {2655.3372,-1994.8107,13.5547},
    {2642.3862,-1998.3818,13.5547},
    {2640.4297,-2014.2576,13.5469},
    {2648.8430,-2013.4014,13.5547},
    {2673.1851,-2013.5157,13.5547},
    {2692.3018,-2013.4625,13.5547},
    {2432.8923,-2019.2065,13.5469},
    {2460.3333,-2019.5054,13.5469},
    {2480.6482,-2019.6075,13.5469},
    {2504.8352,-2018.9366,13.5469},
    {2519.6580,-2015.3138,13.5469},
    {2519.2412,-1999.6991,13.5469},
    {2511.6929,-2000.6216,13.5469},
    {2489.4751,-2000.1794,13.5469},
    {2466.2878,-2000.1389,13.5469},
    {2329.3032,-1945.4370,13.5808},
    {2288.6680,-1904.4596,13.5469},
    {2298.0396,-1884.8114,13.5993},
    {2271.0220,-1884.7775,13.5469},
    {2243.4578,-1884.7782,13.5469},
    {2257.0847,-1904.6654,13.5469},
    {2242.1494,-1904.6383,13.5469},
    {2312.1780,-1722.8761,13.5469},
    {2322.6201,-1722.8038,13.5357},
    {2388.1428,-1723.6180,13.5721},
    {2398.7322,-1722.1799,13.6011},
    {2380.2556,-1783.6415,13.5469},
    {2359.8582,-1794.4344,13.5469},
    {2321.9609,-1794.0319,13.5469},
    {2345.5815,-1787.2373,13.5469},
    {2290.1318,-1794.1497,13.5469},
    {2307.6829,-1787.4850,13.5469},
    {2275.6089,-1787.2250,13.5469},
    {2247.0693,-1794.4626,13.5469},
    {2303.2720,-1670.5325,14.4805},
    {2283.1064,-1649.4344,15.0841},
    {2259.4758,-1649.3580,15.4656},
    {2241.1475,-1644.6753,15.4841},
    {2460.3210,-1404.8379,23.8197},
    {2460.3828,-1373.3798,23.9746},
    {2441.3989,-1355.2206,24.0000},
    {2441.5610,-1319.5605,24.0000},
    {2441.8413,-1301.3214,23.9922},
    {2441.9370,-1285.7548,24.0000},
    {2441.5007,-1272.8455,24.0000},
    {2460.4377,-1289.0411,24.0000},
    {2480.2290,-1247.4473,29.2123},
    {2501.0625,-1246.9056,34.8697},
    {2541.7964,-1247.2811,40.5419},
    {2550.1770,-1247.4119,42.9937},
    {2601.0046,-1241.9742,48.0786},
    {2615.1567,-1242.0325,49.4376},
    {2683.6777,-1241.8690,55.7117},
    {2700.4893,-1241.8073,58.2789},
    {2577.8438,-970.0626,81.3576},
    {2576.5432,-956.6838,81.3602},
    {2551.4893,-960.3714,82.4928},
    {2533.2529,-965.6143,82.2171},
    {2517.0906,-967.1689,82.1150},
    {2473.8040,-967.5203,80.1413},
    {2255.0156,-1038.3267,53.5004},
    {2140.8616,-989.2872,60.9273},
    {2017.1949,-977.9095,36.9249},
    {2219.8091,-1151.8156,25.7494},
    {2240.0647,-1230.1639,23.9766},
    {2206.1162,-1230.5403,23.9752},
    {2189.7261,-1230.5179,23.9752},
    {2144.9807,-1229.7618,23.9766},
    {2131.0720,-1230.1559,23.9766},
    {2100.9792,-1230.4938,23.9766},
    {2054.7617,-1127.1591,23.9579},
    {2015.8110,-1126.6423,25.0804},
    {1996.6628,-1126.6244,25.5949},
    {1958.1512,-1126.2686,25.9260},
    {1924.8867,-1127.0930,25.1034},
    {1901.5674,-1126.4387,24.5208},
    {2105.8911,-1291.9313,23.9714},
    {2132.6003,-1310.0831,23.9797},
    {2144.0076,-1309.7849,23.9963},
    {2156.6748,-1292.0801,23.9744},
    {2141.7368,-1375.4410,23.9844},
    {2138.5540,-1411.1105,23.9854},
    {2138.6099,-1445.0037,23.9846},
    {2037.3427,-1331.6548,23.9844},
    {1868.2676,-1603.1315,13.5469},
    {1914.1146,-1603.0865,13.5469},
    {2010.5623,-1633.1232,13.5469},
    {2012.1351,-1662.9744,13.5469},
    {1992.5581,-1669.7854,13.5469},
    {1992.3344,-1686.5913,13.5469},
    {2010.9336,-1714.5487,13.5469},
    {2072.6641,-1651.4135,13.5469},
    {2072.5488,-1622.7990,13.5469},
    {2072.0471,-1715.2567,13.5469},
    {1903.8145,-2042.7634,13.5391},
    {1893.5098,-2061.6572,13.5469},
    {1871.9303,-2061.8835,13.5469},
    {1863.5095,-2042.6780,13.5469},
    {1870.1201,-2029.0419,13.5469},
    {1893.4939,-2023.9940,13.5469},
    {1902.3403,-2005.6112,13.5469},
    {1912.7188,-1989.4132,13.5469},
    {1902.9943,-1986.4867,13.5469},
    {1872.8054,-1986.5731,13.5469},
    {1853.6426,-1987.6337,13.5469},
    {1853.3176,-2015.4094,13.5544},
    {1939.6064,-1923.2892,13.5469},
    {1917.2684,-1923.2998,13.5469},
    {1895.0123,-1923.1726,13.5469},
    {1874.0658,-1923.0577,13.5469},
    {643.3594,-1718.3015,14.2122},
    {646.8900,-1698.1066,14.8293},
    {649.2274,-1659.9247,14.8161},
    {648.3535,-1624.3246,15.0472},
    {801.1918,-1689.0886,13.5469},
    {800.8431,-1703.0602,13.5469},
    {800.9326,-1728.0492,13.5469}
};

new PlayerText:PizzaDraw;
new PizzaLeft[MAX_VEHICLES];
enum PizzaMissionVars
{
	bool:CarryingPizza,
	PizzaWarmth,
	bool:OnMission,
	MissionBike,
	PizzaSeconds,
	Float:CPPOS[3],
	SessionEarning,
	TotalSeconds,
	PizzaTimer
}
new PizzaMission[MAX_PLAYERS][PizzaMissionVars];

new Spec[MAX_PLAYERS];
new payColor1[MAX_PLAYERS], payColor2[MAX_PLAYERS];
// Delivery man job
//  - hydro

new
    Crates = 0,
    vCrates[MAX_VEHICLES],
    PlayerCrates[MAX_PLAYERS],

    bool:CarryingCrate[MAX_PLAYERS],

    bool:Mission[MAX_PLAYERS],
    Mission_CP[MAX_PLAYERS],

    Storage_PU,

    PlayerText:TD_BIZ_NAME[MAX_PLAYERS],
    PlayerText:TD_BIZ_ADRESS[MAX_PLAYERS],
    PlayerText:TD_CRATES[MAX_PLAYERS],

    szMessage[128];

new bool:Dead[MAX_PLAYERS];
new Float:DeathPos[MAX_PLAYERS][3];
new deathInt[MAX_PLAYERS];
new deathVW[MAX_PLAYERS];

new HasFiredTime[MAX_PLAYERS];

enum RCON_DATA
{
	ID,
	Tries,
	bool:Granted,
	bool:InGame,
	rIP[22]
}
new rcon[MAX_BOOTS][RCON_DATA];

new bool:PlayerWeapons[MAX_PLAYERS][47], bool:Spawned[MAX_PLAYERS];

new callingEm[MAX_PLAYERS];

enum EmergencyCall
{
	CallingTo,
	bool:Emergency,
	PreText[156],
	Text[156],
	Location[64]
}
new emCall[MAX_PLAYERS][EmergencyCall];

enum Player_Data
{
	SQLID,
	pName[MAX_PLAYER_NAME+1],
	pPassword[130],
	pCharacter1[MAX_PLAYER_NAME+1],
	pCharacter2[MAX_PLAYER_NAME+1],
	pCharacter3[MAX_PLAYER_NAME+1],
	pBanned,
	pBannedBy[MAX_PLAYER_NAME+1],
	pBanReason[128],
	pForum[128],
	pEmail[128],
	pStatus,
	AdminLevel
}
new pInfo[MAX_PLAYERS][Player_Data];

enum FURNITURE_DATA
{
	ID,
	ObjectID,
	ObjectName[128],
	Opened,
	HouseID,
	Authority,
	VirtualWorld,
	Float:pos[3],
	Float:rot[3],
	Object,
	Locked,
	fINT
}

new Furn[MAX_FURNITURES][FURNITURE_DATA];

enum Character_Data
{
	SQLID,
	cName[MAX_PLAYER_NAME+1],
	cCreator[MAX_PLAYER_NAME+1],
	cAdminLevel,
	cLevel,
	cEXP,
	cMoney,
	cBank,
	cSkin,
	cJob,
	cJobHours,
	cFaction,
	cOLeader,
	cOOCGroup,
	cHaveRadio,
	cRSlot,
	cRadio[4],
	cLeader,
	cRank,
	cJailed,
	cJailTime,
	cVehicle1,
	cVehicle2,
	cVehicle3,
	cFirstLogin,
	cAdminRecordCount,
	Online,
	LastSeen[64],
	cJailedBy[25],
	cJailReason[128],
	cPhone,
	cPhoneType,
	cPhoneCredits,
	cMinutes,
	cSavings,
	cMask,
	Float:cSpawn[3],
	cSpawnType,
	cPrison,
	cPrisonTime,
	cPrisonCell,
	cRenting,
	cHaveNote,
	cNote1[128],
	cNote2[128],
	cNote3[128],
	cNote4[128],
	cNote5[128],
	cDonator,
	cNamechanges,
	cNumberchanges,
	cWeaponLicense,
	cDrivingLicense,
	cCrashed,
	Float:cCrashPos[3],
	cCrashINT,
	cCrashVW,
	cTotalHours,
	cPaycheck,
	cEvent,
	cBoombox,
	cGender,
	cAge,
	cHaveBag,
	cBagMoney
}
new cInfo[MAX_PLAYERS][Character_Data];

enum House_Data
{
	ID,
	Owner,
	OwnerName[25],
	Address[MAX_ZONE_NAME+22],
	Float:X_IN,
	Float:Y_IN,
	Float:Z_IN,
	Float:X_OUT,
	Float:Y_OUT,
	Float:Z_OUT,
	INT,
	VirtualWorld,
	Rentable,
	RentPrice,
	Radio,
	Price,
	Locked,
	Text3D:Label,
	Pickup,
	Checkpoint
}
new hInfo[MAX_HOUSES][House_Data];

enum Business_Data
{
	ID,
	Owner,
	OwnerName[25],
	Address[MAX_ZONE_NAME+22],
	Name[128],
	Float:X_IN,
	Float:Y_IN,
	Float:Z_IN,
	Float:X_OUT,
	Float:Y_OUT,
	Float:Z_OUT,
	INT,
	VirtualWorld,
	Type,
	Bank,
	Radio,
	Price,
	Fee,
	Products,
	Locked,
	Text3D:Label,
	Pickup,
	Checkpoint
}
new bInfo[MAX_BIZZES][Business_Data];

enum Group_Data
{
	ID,
	CreationDate,
	Taken,
	Chat
}
new gInfo[MAX_GROUPS][Group_Data];

enum Faction_Data
{
	ID,
	Name[128],
	Chat,
	JoinRank,
	Type,
	OnlineMembers,
	TotalMembers,
	Rank1[128],
	Rank2[128],
	Rank3[128],
	Rank4[128],
	Rank5[128],
	Rank6[128],
	Rank7[128],
	Rank8[128],
	Rank9[128],
	Rank10[128],
	Rank11[128],
	Rank12[128],
	Rank13[128],
	Rank14[128],
	Rank15[128]
}
new fInfo[MAX_FACTIONS][Faction_Data];

enum Interior_Data
{
	ID,
	Float:outX,
	Float:outY,
	Float:outZ,
	Float:inX,
	Float:inY,
	Float:inZ,
	InteriorID,
	outsideText[256],
	Pickup,
	Text3D:Label,
	Locked
}
new iInfo[MAX_INTERIORS][Interior_Data];

enum Vehicle_Data
{
	ID,
	Model,
	Owner,
	Locked,
	Faction,
	Job,
	Server,
	Color1,
	Color2,
	Plate[64],
	Rentable,
	RentPrice,
	Wep[3],
	WepAmmo[3],
	Insurances,
	Fuel,
	Float:X,
	Float:Y,
	Float:Z,
	Float:A
}
new vInfo[MAX_VEHICLES][Vehicle_Data];

enum SAZONE_MAIN
{
	SAZONE_NAME[28],
	Float:SAZONE_AREA[6]
};

enum INTERIOR_MAIN
{
	INT_NAME[28],
	Float:INT_POS[3],
	INT_ID
};

new Interior[37][INTERIOR_MAIN] =
{
	// Interior Name // Positions ( X, Y, Z) // Interior ID
	{"Ryder´s House", {2468.8411,-1698.2228,1013.5078}, 2},
	{"Johnson´s House", {2495.8916,-1692.5658,1014.7422}, 3},
	{"Madd Dog Mansion", {1299.14, -794.77, 1084.00}, 5},
	{"Safe House 1", {2233.6919,-1112.8107,1050.8828}, 5},
	{"Safe House 2", {2196.8374,-1204.5576,1049.0234}, 6},
	{"Safe House 3", {2317.5347,-1026.7506,1050.2178}, 9},
	{"Safe House 4", {2259.4021,-1136.0243,1050.6403}, 10},
	{"Burglary X1", {234.6087,1187.8195,1080.2578}, 3},
	{"Burglary X2", {225.5707,1240.0643,1082.1406}, 2},
	{"Burglary X3", {224.288,1289.1907,1082.1406}, 1},
	{"Burglary X4", {226.2955,1114.3379,1080.9929}, 5},
	{"Burglary Houses", {295.1391,1473.3719,1080.2578}, 15},
	{"Motel Room", {446.3247,509.9662,1001.4195}, 12},
	{"Pair Burglary", {446.626,1397.738,1084.3047}, 2},
	{"Burglary X11", {226.8998,0.2832,1080.9960}, 5},
	{"Burglary X12", {261.1165,1287.2197,1080.2578}, 4},
	{"Michelle's Love Nest", {309.4319,311.6189,1003.3047}, 4},
	{"Burglary X14", {24.3769,1341.1829,1084.375}, 10},
	{"Burglary X13", {221.6766,1142.4962,1082.6094}, 4},
	{"Unused House", {2323.7063,-1147.6509,1050.7101}, 12},
	{"Millie's Room", {344.9984,307.1824,999.1557}, 6},
	{"Burglary X15", {-262.1759,1456.6158,1084.3672}, 4},
	{"Burglary X16", {22.861,1404.9165,1084.4297}, 5},
	{"Burglary X17", {140.3679,1367.8837,1083.8621}, 5},
	{"House X18", {234.2826,1065.229,1084.2101}, 6},
	{"House X19", {-68.6652,1351.2054,1080.2109}, 6},
	{"House X20", {-283.4464,1470.8777,1084.3750}, 15},
	{"Colonel Furhberger", {2807.4458,-1174.2394,1025.5703}, 8},
	{"The Camel's Safehouse", {2218.0737,-1076.0438,1050.4844}, 1},
	{"Verdant Bluffs House", {2365.1042,-1135.5898,1050.8826}, 8},
	{"Burglary X21", {-42.6339,1405.4767,1084.4297}, 8},
	{"Willowfield House", {2282.8049,-1140.2722,1050.8984}, 11},
	{"House X20", {82.9119,1322.4266,1083.8662}, 9},
	{"Burglary X22", {260.7421,1238.2261,1084.2578}, 9},
	{"Burglary X23", {266.5074,305.1129,999.1484}, 2},
	{"Katie's Lovenest", {322.5014,303.6906,999.1484}, 5},
	{"Barbara's Love nest", {244.0007,305.1925,999.1484}, 1}
};

new bInterior[30][INTERIOR_MAIN] =
{
	// Interior Name // Positions ( X, Y, Z) // Interior ID
	{"24/7 #1", {-25.884498,-185.868988,1003.546875}, 17},
	{"24/7 #2", {6.091179,-29.271898,1003.549438}, 10},
	{"Ammounation #1", {286.148986,-40.644397,1001.515625}, 1},
	{"Ammounation #2", {314.820983,-141.431991,999.601562}, 7},
	{"Office #1", {1038.531372,0.111030,1001.284484}, 3},
	{"Jefferson Motel", {2215.454833,-1147.475585,1025.796875}, 15},
	{"Off Track Betting Shop", {833.269775,10.588416,1004.179687}, 3},
	{"Sex Shop", {-103.559165,-24.225606,1000.718750}, 3},
	{"Zero RC's Shop", {-2240.468505,137.060440,1035.414062}, 6},
	{"Dillimore's gas station", {663.836242,-575.605407,16.343263}, 0},
	{"Caligulas's basement", {2169.461181,1618.798339,999.976562}, 1},
	{"Office #2", {-2159.122802,641.517517,1052.381713}, 1},
	{"Binco", {207.737991,-109.019996,1005.132812}, 15},
	{"Didier sachs", {204.332992,-166.694992,1000.523437}, 14},
	{"Club", {207.054992,-138.804992,1003.507812}, 17},
	{"Bar", {501.980987,-69.150199,998.757812}, 11},
	{"Mini Bar", {-227.027999,1401.229980,27.765625}, 18},
	{"Jay's dinner", {457.304748,-88.428497,999.554687}, 4},
	{"Burger shot", {375.962463,-65.816848,1001.507812}, 10},
	{"Cluckin' bell", {369.579528,-4.487294,1001.858886}, 9},
	{"Well stacked pizza", {373.825653,-117.270904,1001.499511}, 5},
	{"LS gym", {772.111999,-3.898649,1000.728820}, 5},
	{"SF gym", {774.213989,-48.924297,1000.585937}, 6},
	{"LV gym", {773.579956,-77.096694,1000.655029}, 7},
	{"Big spread ranch", {1212.019897,-28.663099,1000.953125}, 3},
	{"Strip club", {1204.809936,-11.586799,1000.921875}, 2},
	{"Tiger skin brothel", {964.106994,-53.205497,1001.124572}, 3},
	{"Pleasure domes", {-2640.762939,1406.682006,906.460937}, 3},
	{"Liberty city inside", {-794.806396,497.738037,1376.195312}, 1},
	{"Bank", {2315.952880,-1.618174,26.742187}, 0}
};

//----------------------------------------------------------
// Vehicle Names & Prices

enum VEHICLE_PRICES
{
	PRICE,
	VEHID,
	NAME[64],
	TYPE
};

new CarsPrices[][VEHICLE_PRICES] =
{ // 0 = Unpurchasable Vehicle
	{45000, 400, "Landstalker", 1}, // Landstalker
	{15000, 401, "Bravura", 1}, // Bravura
	{70000, 402, "Buffalo", 1}, // Buffalo
	{12000, 404, "Perenniel", 1},// Perenniel
	{15000, 405, "Sentinel", 1},// Sentinel
	{100000, 409, "Stretch", 1},// Stretch
	{38000, 410, "Stretch", 1},// Manana
	{20000, 412, "Voodoo", 1},// Voodoo
	{10000, 413, "Pony", 1},// Pony
	{120000, 415, "Cheetah", 1},// Cheetah
	{8000, 418, "Moonbeam", 1},// Moonbeam
	{10000, 419, "Esperanto", 1},// Esperanto
	{12000, 421, "Washington", 1},// Washington
	{7000, 422, "Bobcat", 1},// Bobcat
	{14000, 426, "Premier", 1},// Premier
	{100000, 429, "Banshee", 1},// Banshee,
	{12000, 436, "Previon", 1},// Previon
	{35000, 439, "Stallion", 1},// Stallion
	{30000, 445, "Admiral", 1},// Admiral
	{50000, 446, "Squallo", 2},// Squallo
	{20000, 461, "PCJ-600", 1},// PCJ 600
	{5000, 462, "Faggio", 1},// Faggio
	{10000, 463, "Freeway", 1},// Freeway
	{15000, 466, "Glendale", 1},// Glendale
	{15000, 467, "Oceanic", 1},// Oceanic
	{7000, 468, "Sanchez", 1},// Sanchez
	{5000, 471, "Quad", 1},// Quad
	{5000, 473, "Dinghy", 2},// Dinghy
	{14000, 474, "Hermes", 1},// Hermes
	{14000, 475, "Sabre", 1},// Sabre
	{140000, 477, "ZR 350", 1},// ZR 350
	{6000, 478, "Walton", 1},// Walton
	{12000, 479, "Regina", 1},// Regina
	{145000, 480, "Comet", 1},// Comet
	{350, 481, "BMX", 1},// BMX
	{12000, 482, "Burrito", 1},// Burrito
	{7500, 483, "Camper", 1},// Camper
	{22000, 491, "Virgo", 1},// Virgo
	{22000, 492, "Greenwood", 1},//Greenwood
	{35000, 496, "Blista Compact", 1},// Blista Compact
	{35000, 500, "Mesa", 1},// Mesa
	{50000, 505, "Rancher", 1},// Rancher
	{210000, 506, "Supet GT", 1},// Supet GT
	{45000, 507, "Elegant", 1},// Elegant
	{350, 509, "Bike", 1},// Bike
	{350, 510, "Mountain Bike", 1},// Mountain Bike
	{20000, 521, "FCR-900", 1},// FCR 900
	{9000, 525, "Towtruck", 1},// Towtruck
	{16000, 526, "Fortune", 1},// Fortune
	{13000, 527, "Cadrona", 1},// Cadrona
	{14000, 529, "Willard", 1},// Willard
	{45000, 533, "Feltzer", 1},// Feltzer
	{35000, 534, "Remington", 1},// Remington
	{50000, 535, "Slamvan", 1},// Slamvan
	{45000, 536, "Blade", 1},// Blade
	{55000, 540, "Vincent", 1},// Vincent
	{210000, 541, "Bullet", 1},// Bullet
	{60000, 550, "Sunrise", 1},// Sunrise
	{32000, 551, "Merit", 1},// Merit
	{37000, 554, "Yosemite", 1},// Yosemite
	{90000, 555, "Windsor", 1},// Windsor
	{95000, 559, "Jester", 1},// Jester
	{130000, 560, "Sultan", 1},// Sultan
	{14500, 561, "Stratum", 1},// Stratum
	{115000, 562, "Elegy", 1},// Elegy
	{75000, 565, "Flash", 1},// Flash
	{50000, 566, "Tahoma", 1},// Tahoma
	{64000, 567, "Savanna", 1},// Savanna
	{55000, 579, "Huntley", 1},// Huntley
	{45000, 580, "Stafford", 1},// Stafford
	{25000, 581, "BF-400", 1},// BF 400
	{35000, 585, "Emperor", 1},// Emperor
	{12000, 586, "Wayfarer", 1},// Wayfarer
	{65000, 587, "Euros", 1},// Euros
	{42000, 589, "Club", 1}, // Club
	{35000, 516, "Nebula", 1}, // Nebula
	{420000, 487, "Maverick", 3} // Maverick
};

new VehicleNames[212][] = {
	{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
	{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
	{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
	{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
	{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
	{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
	{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
	{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
	{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
	{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
	{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
	{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
	{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
	{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
	{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
	{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
	{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
	{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
	{"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
	{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
	{"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
	{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
	{"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
	{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
	{"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
	{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
	{"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
	{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
	{"Utility Trailer"}
};

new WeaponNames[48][] = {
    "Empty", "Knuckles", "Golf Club", "Nitestick", "Knife", "Baseball Bat", "Showel", "Pool Cue",
    "Katana", "Chainsaw", "Purple Dildo", "Small White Dildo", "Long White Dildo", "Vibrator", "Flowers", "Cane",
    "Grenade", "Tear Gas", "Molotov", "Vehicle Missile", "Hydra Flare", "Jetpack", "Colt 45", "Heckler & Koch USP", "Walther PPK",
	"Mossberg 500", "Mossberg 590", "Mossberg 930 Autoloader", "MAC-10", "Heckler & Koch MP5/10", "Kalashnikov", "M4 Carbine", "AB-10", "Lee-Enfield", "THOR M408 Long Range", "Rocket Launcher",
    "RPG-7", "LPO-50", "Minigun", "Satchel Charge", "Detonator", "Spraycan", "Fire Extinguisher", "Nikon D3200",
 	"Nightvision", "Infrared Vision", "Parachute", "Fake Pistol"
};

//============================================//
#include "../gamemodes/Stocks and Publics.pwn"
#include "../gamemodes/OnDialogResponse.pwn"
#include "../gamemodes/OnGameModeInit.pwn"
#include "../gamemodes/OnGameModeExit.pwn"
#include "../gamemodes/OnPlayerCommandPerformed.pwn"
#include "../gamemodes/OnPlayerConnect.pwn"
#include "../gamemodes/OnPlayerDisconnect.pwn"
#include "../gamemodes/OnPlayerEnterCheckpoint.pwn"
#include "../gamemodes/OnPlayerKeyStateChange.pwn"
#include "../gamemodes/OnPlayerSpawn.pwn"
#include "../gamemodes/OnPlayerStateChange.pwn"
#include "../gamemodes/OnPlayerTakeDamage.pwn"
#include "../gamemodes/OnPlayerText.pwn"
//============================================//
