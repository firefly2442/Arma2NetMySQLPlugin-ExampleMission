// -AS Loadouts 
// 
// Riouken 
//

#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "definitions.sqf"

//http://community.bistudio.com/wiki/disableSerialization
disableSerialization;

private "_unit";
_unit = player;

//http://community.bistudio.com/wiki/Dialogs
//http://community.bistudio.com/wiki/lbAdd
//http://forums.bistudio.com/showthread.php?t=98221

//TRACE_1("Populating dropdown for player: ",_unit);

//Add existing loadouts to dropdown
_ASDialog = findDisplay AS_LOADOUTS_DIALOG;
_loadoutsDropDown = _ASDialog displayCtrl AS_LOADOUTS_dropDownMenu;
lbClear _loadoutsDropDown;
{
	//TRACE_1("Adding to dropdown: ",_x);
	_loadoutsDropDown lbAdd _x;
} foreach (_unit call FUNC(getLoadouts));
_loadoutsDropDown lbSetCurSel 0;

