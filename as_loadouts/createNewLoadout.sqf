// AS Loadouts - Create Loadout
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "dialog\definitions.sqf"
disableSerialization;

_allWeapons = [] call FUNC(getAllWeapons);

_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_LoadoutName);

_unit = player;
_loNames = (_unit call FUNC(getLoadouts));

//check to make sure the user entered a loadout name and it doesn't already exist
if (_loadoutName != "" && !(_loadoutName in _loNames)) then {
	_strCreate = format ["[u=%1,n=%2,a=%3,b=%4,c=%5,d=%6,e=%7,f=%8]", _allWeapons select 0, _loadoutName, _allWeapons select 1,
															_allWeapons select 2, _allWeapons select 3, 
															_allWeapons select 4, _allWeapons select 5, _allWeapons select 6];
											
	//TRACE_2("strCreate variable and loadout name: ",_strCreate,_loadoutName);

	["as_create_new_loadout", [_strCreate]] call CBA_fnc_globalEvent;
	//closedialog 0;
	//clear out the name field
	_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_LoadoutName);
	ctrlSetText [_loadoutName, ""];
	execVM "as_loadouts\dialog\as_plo_gui_setup.sqf";
} else {
	if (_loadoutName == "") then {
		hint "You need to specify a name for your loadout.";
	};
	if (_loadoutName in _loNames) then {
		hint "That name is already in your saved loadouts list... You must pick a new one!";
	};
};
