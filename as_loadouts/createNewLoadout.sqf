// AS Loadouts - Create Loadout
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "dialog\definitions.sqf"
disableSerialization;

_allWeapons = [] call FUNC(getAllWeapons);

_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_LoadoutName);

_loNames = (_unit call FUNC(getLoadouts));

if (_loadoutName in _loNames) then {
	hint "That name is already in your saved loadouts list... You must pick a new one!";
};

_strCreate = format ["[u=%1,n=%2,a=%3,b=%4,c=%5,d=%6,e=%7]", _allWeapons select 0, _loadoutName, _allWeapons select 1,
															_allWeapons select 2, _allWeapons select 3, 
															_allWeapons select 4, _allWeapons select 5];
											
//TRACE_2("strCreate variable and loadout name: ",_strCreate,_loadoutName);

//check to make sure the user entered a loadout name
if (_loadoutName != "") then{
	["as_create_new_loadout", [_strCreate]] call CBA_fnc_globalEvent;
	//closedialog 0;
	execVM "as_loadouts\dialog\as_plo_gui_setup.sqf";
} else {
	hint "You need to specify a name for your loadout.";
};
