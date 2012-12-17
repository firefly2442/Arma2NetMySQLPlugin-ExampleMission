#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "definitions.sqf"
disableSerialization;

//http://community.bistudio.com/wiki/isServer
if (isServer) then
{
	//Register all the CBA event handlers for the server to run in order to connect to the plugin
	//https://dev-heaven.net/projects/cca/wiki/Custom_Events_System
	//Here's some information on locality of variables in Arma
	//http://forums.bistudio.com/showthread.php?124663-Locality-of-Variables-Between-Client-Server
	
	//TODO: check the return result for each callExtension to make sure the result was run successfully
	//1) The data being sent was not too long
	//2) An error wasn't returned
	//If something bad happens, log it via the CBA TRACE method

	["as_create_new_loadout", {

		_query = "INSERT into users (uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback, oabackpack) VALUES(";

		//some of the entries may be empty so we have to generate a string
		for "_i" from 0 to (count _this)-1 do {
			if (_i == (count _this)-1) then {
				if ((_this select _i) != "") then {
					_query = _query + "'" + (_this select _i) + "'";
				} else {
					_query = _query + "NULL";
				};
			} else {
				if ((_this select _i) != "") then {
					_query = _query + "'" + (_this select _i) + "',";
				} else {
					_query = _query + "NULL,";
				};
			};
		};
		_query = _query + ")";

		TRACE_1("Query: ",_query);
		_create = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['weapons', '%1']", _query];
	}
	] call CBA_fnc_addEventHandler;

	["as_delete_loadout", {
		_puid = _this select 0;
		_name = _this select 1;
		_query = format ["DELETE from users WHERE uid = '%1' AND name = '%2'", _puid, _name];
		TRACE_1("Query: ",_query);
		"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['weapons', '%1']", _query];
	}
	] call CBA_fnc_addEventHandler;

	["as_get_loadout_names", {
		_unit = _this select 0;
		_parameters = _this select 1;
		//http://community.bistudio.com/wiki/owner
		_owner = owner _unit;
		_query = format ["SELECT name FROM users WHERE uid = '%1'", _parameters];
		TRACE_1("Query: ",_query);
		_dbloadouts = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['weapons', '%1']", _query];
		//return the result back to the specific user that called this event
		//http://forums.bistudio.com/showthread.php?136494-ARMA-2-OA-beta-build-94209-%281-60-MP-compatible-build-post-1-60-release%29&p=2179795&viewfull=1#post2179795
		ReturnedDatabaseLoadOutNames = _dbloadouts;
		_owner publicVariableClient "ReturnedDatabaseLoadOutNames";
		//Technically, this variable is kind of like a mutex for the client side
	}
	] call CBA_fnc_addEventHandler;

	["as_update_loadout", {

		_query = "UPDATE users SET ";
		_query_strings = ["ammo = ", "weapons = ", "backpackammo = ", "backpackweapons = ", "weapononback = ", "oabackpack = "];

		//some of the entries may be empty so we have to generate a string
		for "_i" from 2 to (count _this)-1 do {
			if (_i == (count _this)-1) then {
				if ((_this select _i) != "") then {
					_query = _query + (_query_strings select _i-2) + "'" + (_this select _i) + "'";
				} else {
					_query = _query + (_query_strings select _i-2) + "NULL";
				};
			} else {
				if ((_this select _i) != "") then {
					_query = _query + (_query_strings select _i-2) + "'" + (_this select _i) + "', ";
				} else {
					_query = _query + (_query_strings select _i-2) + "NULL,";
				};
			};
		};
		_check = format [" WHERE uid = '%1' AND name = '%2'", (_this select 0), (_this select 1)];
		_query = _query + _check;

		TRACE_1("Query: ",_query);
		"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['weapons', '%1']", _query];
	}
	] call CBA_fnc_addEventHandler;

	["as_get_loadout", {
		_unit = _this select 0;
		_puid = _this select 1;
		_name = _this select 2;
		//http://community.bistudio.com/wiki/owner
		_owner = owner _unit;
		_query = format ["SELECT uid, name, ammo, weapons, backpackammo, backpackweapons, weapononback, oabackpack FROM users WHERE uid = '%1' AND name = '%2'", _puid, _name];
		TRACE_1("Query: ",_query);
		_get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['weapons', '%1']", _query];
		//return the result back to the specific user that called this event
		//http://forums.bistudio.com/showthread.php?136494-ARMA-2-OA-beta-build-94209-%281-60-MP-compatible-build-post-1-60-release%29&p=2179795&viewfull=1#post2179795
		ReturnedDatabaseLoadOuts = _get;
		_owner publicVariableClient "ReturnedDatabaseLoadOuts";
		//Technically, this variable is kind of like a mutex for the client side
	}
	] call CBA_fnc_addEventHandler;
};