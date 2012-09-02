// AS Loadouts - Initialize/Get Current Loadouts

//http://dev-heaven.net/docs/cba/files/extended_eventhandlers/script_macros_common-hpp.html#DEBUG_MODE_FULL
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"

if (isServer) then 
{   
execVM "as_loadouts\server_events.sqf";
};

//initialize functions
FUNC(getAllWeapons) = compile preprocessFileLineNumbers "as_loadouts\getAllWeapons.sqf";
FUNC(getLoadouts) = compile preprocessFileLineNumbers "as_loadouts\getLoadouts.sqf";

//Bon's Arty scripts are great examples of the dialog system
//RSLO has good examples of how to clear and set weapon loadouts from a listing

//http://community.bistudio.com/wiki/Category:Scripting_Commands_ArmA2
//http://community.bistudio.com/wiki/User_Interface_Event_Handlers

//UI Editor
//https://community.bistudio.com/wiki/User_Interface_Editor_%28Arma_2%29
