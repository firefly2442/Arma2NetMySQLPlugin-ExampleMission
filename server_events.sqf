#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
#include "as_loadouts\dialog\definitions.sqf"
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
		_weapons = _this select 0;
		_create = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'CreateNewLoadOut', '%1']", _weapons];
	}
	] call CBA_fnc_addEventHandler;

	["as_delete_loadout", {
		_delete = _this select 0;
		"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'DeleteLoadoutUsingUIDandName', '%1']", _delete];
	}
	] call CBA_fnc_addEventHandler;

	["as_get_loadout_names", {
		_unit = _this select 0;
		_parameters = _this select 1;
		//http://community.bistudio.com/wiki/owner
		_owner = owner _unit;
		_dbloadouts = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'GetLoadoutNamesUsingUID', %1]", _parameters];
		//return the result back to the specific user that called this event
		//http://forums.bistudio.com/showthread.php?136494-ARMA-2-OA-beta-build-94209-%281-60-MP-compatible-build-post-1-60-release%29&p=2179795&viewfull=1#post2179795
		ReturnedDatabaseLoadOutNames = _dbloadouts;
		_owner publicVariableClient "ReturnedDatabaseLoadOutNames";
		//Technically, this variable is kind of like a mutex for the client side
	}
	] call CBA_fnc_addEventHandler;

	["as_update_loadout", {
		_update = _this select 0;
		"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'UpdateLoadoutUsingUIDandName', '%1']", _update];
	}
	] call CBA_fnc_addEventHandler;

	["as_get_loadout", {
		_unit = _this select 0;
		_parameters = _this select 1;
		//http://community.bistudio.com/wiki/owner
		_owner = owner _unit;
		_get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'GetLoadoutByUIDandName', '%1']", _parameters];
		//return the result back to the specific user that called this event
		//http://forums.bistudio.com/showthread.php?136494-ARMA-2-OA-beta-build-94209-%281-60-MP-compatible-build-post-1-60-release%29&p=2179795&viewfull=1#post2179795
		ReturnedDatabaseLoadOuts = _get;
		_owner publicVariableClient "ReturnedDatabaseLoadOuts";
		//Technically, this variable is kind of like a mutex for the client side
	}
	] call CBA_fnc_addEventHandler;
};