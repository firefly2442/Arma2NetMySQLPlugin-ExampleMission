// AS Loadouts - Initialize/Get Current Loadouts

//http://dev-heaven.net/docs/cba/files/extended_eventhandlers/script_macros_common-hpp.html#DEBUG_MODE_FULL
#define DEBUG_MODE_FULL
#include "script_component.hpp"

//initialize functions
FUNC(getAllWeapons) = compile preprocessFileLineNumbers "as_loadouts\getAllWeapons.sqf";
FUNC(getLoadouts) = compile preprocessFileLineNumbers "as_loadouts\getLoadouts.sqf";


createDialog "AS_Loadouts";
