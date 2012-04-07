#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_unit);

private ["_loadouts","_dbloadouts"];
_loadouts = [];

if (isNull _unit || !isPlayer _unit) exitWith {
	TRACE_1("Error: unit is null or not a player",_unit);
	_loadouts
};

_parameters = format ["u=%1", getPlayerUID _unit];

//TRACE_2("parameters variable: ",_parameters,_unit);

_dbloadouts = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'GetLoadoutNamesUsingUID', %1]", _parameters];

//TRACE_2("loadouts as retrieved for unit from db",_dbloadouts,_unit);

//This converts the string to an array
_dbloadouts = call compile _dbloadouts;

//TRACE_2("loadouts after compile array conversion: ",_dbloadouts,_unit);

{ _loadouts set [count _loadouts, _x select 0] } forEach _dbloadouts;
//TRACE_2("loadouts returned for unit",_loadouts,_unit);

_loadouts
