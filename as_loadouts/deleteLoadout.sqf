// AS Loadouts - Delete Loadout
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "dialog\definitions.sqf"
disableSerialization;

// Identify Player
_puid = getPlayerUID p1;

_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutsDropDown = _dlg displayCtrl AS_LOADOUTS_dropDownMenu;
_unit = player;
_loadoutName = (_unit call FUNC(getLoadouts)) select (lbCurSel _loadoutsDropDown);
//TRACE_2("Deleting loadout for: ",_loadoutName,_puid);

_strDelete = format ["[u=%1,n=%2]", _puid, _loadoutName];
//TRACE_1("Delete string: ",_strDelete);

["as_delete_loadout", [_strDelete]] call CBA_fnc_globalEvent;
closedialog 0;
