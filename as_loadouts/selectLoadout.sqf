// AS Loadouts - Select Loadout
#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "dialog\definitions.sqf"
disableSerialization;

// Identify Player
_puid = getPlayerUID p1;

_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutsDropDown = _dlg displayCtrl AS_LOADOUTS_dropDownMenu;
_unit = player;
_loadoutName = (_unit call FUNC(getLoadouts)) select (lbCurSel _loadoutsDropDown);
//TRACE_1("Select Loadout Name: ",_loadoutName);

_strGet = format ["[u=%1,n=%2]", _puid, _loadoutName];

["as_get_loadout_names", [_parameters]] call CBA_fnc_globalEvent;
//https://community.bistudio.com/wiki/while
while (isNil(ReturnedDatabaseLoadOuts)) do {
	//busy wait until the server responds by setting this variable
	//this variable should have locality ONLY to this specific client
}

_get = ReturnedDatabaseLoadOuts;

//uninitialize our variable so we can use it again later (good memory management or something???) *shrugs*
ReturnedDatabaseLoadOuts = nil;

//TRACE_1("Returned Loadout: ",_get);

//This converts the string to an array
_get = call compile _get;

//TODO: this may change in the future??
//only select the inner array, throw away this outer array shell
_get = _get select 0;
_get = _get select 0;

//TRACE_1("_get variable: ",_get);

//See the "RSLO" mod loadouts.sqf file for how they did it

//Initialize some empty arrays
_ammo = [];
_weapons = [];
_backpack_ammo = [];
_backpack_weapon = [];
_aceonback = [];

//https://dev-heaven.net/docs/cba/files/strings/fnc_find-sqf.html
if ([(_get select 2), "`"] call CBA_fnc_find > 0) then {
	_ammo = [(_get select 2), "`"] call CBA_fnc_split;
} else {
	_ammo set [0, (_get select 2)];
};
if ([(_get select 3), "`"] call CBA_fnc_find > 0) then {
	_weapons = [(_get select 3), "`"] call CBA_fnc_split;
} else {
	_weapons set [0, (_get select 3)];
};
if ([(_get select 4), "`"] call CBA_fnc_find > 0) then {
	_backpack_ammo = [(_get select 4), "`"] call CBA_fnc_split;
} else {
	_backpack_ammo set [0, (_get select 4)];
};
if ([(_get select 5), "`"] call CBA_fnc_find > 0) then {
	_backpack_weapon = [(_get select 5), "`"] call CBA_fnc_split;
} else {
	_backpack_weapon set [0, (_get select 5)];
};
if ([(_get select 6), "`"] call CBA_fnc_find > 0) then {
	_aceonback = [(_get select 6), "`"] call CBA_fnc_split;
} else {
	_aceonback set [0, (_get select 6)];
};


//TRACE_5("After cleanup: ",_ammo,_weapons,_backpack_ammo,_backpack_weapon,_aceonback);

removeAllItems player;
removeAllWeapons player;
removeBackpack player;

[player, "WOB"] call ACE_fnc_RemoveGear;

{player addWeapon _x;_acewob = [player, _x] call ACE_fnc_PutWeaponOnBack;} forEach _aceonback;
{player addMagazine _x} forEach _ammo;
{player addWeapon _x} forEach _weapons;

waitUntil {[player] call ACE_fnc_HasRuck;};
[player, "BTH"] call ACE_fnc_RemoveGear;
{_doc = [player, _x, 1] call ACE_fnc_PackMagazine;} forEach _backpack_ammo;
{_doc = [player, _x, 1] call ACE_fnc_PackWeapon;} forEach _backpack_weapon;

_primary = primaryWeapon player;
if (_primary != "") then
{
	player selectWeapon _primary;
};

//TRACE_1("Finished setting up weapon loadout for player: ",_unit);

closedialog 0;
