#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "dialog\definitions.sqf"

//http://community.bistudio.com/wiki/disableSerialization
disableSerialization;

private "_unit";
_unit = player;

//http://community.bistudio.com/wiki/Dialogs
//http://community.bistudio.com/wiki/lbAdd
//http://forums.bistudio.com/showthread.php?t=98221

//Add existing loadouts to dropdown
{	lbAdd[AS_LOADOUTS_dropDownMenu, _x] } foreach (_unit call FUNC(getLoadouts));
