#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Identify Player
_puid = getPlayerUID p1;


// Grab all player weapons
_weparray = weapons player;
_strWep = "";

for "_i" from 0 to (count _weparray) -1 do
{
	if (_i == ((count _weparray) -1)) then 
	{
		_strWep1 = format ["""%1""", _weparray select _i];
		_strWep = _strWep + _strWep1;
	}else 
	{
		_strWep1 = format ["""%1""`", _weparray select _i];
		_strWep = _strWep + _strWep1;
	};
};


// Grab all player magazines
_mags = magazines player;

_strMags = "";

for "_i" from 0 to (count _mags) -1 do
{
	if (_i == ((count _mags) -1)) then 
	{
		_strMags1 = format ["""%1""", _mags select _i];
		_strMags = _strMags + _strMags1;
	}else 
	{
		_strMags1 = format ["""%1""`", _mags select _i];
		_strMags = _strMags + _strMags1;
	};
};


// Grab player ACE_WeaponOnBack
_WOB = [player] call ACE_fnc_WeaponOnBackName;

//hint format["%1",_WOB];

_strWOB = "";
_strWOB1 = format ["""%1""", _WOB];
_strWOB = _strWOB1;


// Grab player ACE backpack weapons
_WeaponsRuckList = [player] call ACE_fnc_RuckWeaponsList;

_tempRuckwepList = [];

{
	_tempnum = _x select 1;
	_tempclass = _x select 0;
	for [{_i=0}, {_i<_tempnum}, {_i=_i+1}] do
	{
		_tempRuckwepList = _tempRuckwepList + [_tempclass];
	};
} forEach _WeaponsRuckList;


_strRWep = "";

for "_i" from 0 to (count _tempRuckwepList) -1 do
{
	if (_i == ((count _tempRuckwepList) -1)) then 
	{
		_strRWep1 = format ["""%1""", _tempRuckwepList select _i];
		_strRWep = _string + _strRWep1;
	}else 
	{
		_strRWep1 = format ["""%1""`", _tempRuckwepList select _i];
		_strRWep = _string + _strRWep1;
	};
};


// Grab player ACE backpack magazines
_MagazinesRuckList = [player] call ACE_fnc_RuckMagazineslist;

// _ruckMags = player getVariable "ACE_RuckMagContents";


//_filtered = [_MagazinesRuckList, { (_x select 0)+ 1 }] call CBA_fnc_filter;

_tempRuckMagList = [];

{
	_tempnum = _x select 1;
	_tempclass = _x select 0;
	for [{_i=0}, {_i<_tempnum}, {_i=_i+1}] do
	{
		_tempRuckMagList = _tempRuckMagList + [_tempclass];
	};
} forEach _MagazinesRuckList;

_strRMags = "";

for "_i" from 0 to (count _tempRuckMagList) -1 do
{
	if (_i == ((count _tempRuckMagList) -1)) then 
	{
		_strRMags1 = format ["""%1""", _tempRuckMagList select _i];
		_strRMags = _string + _strRMags1;
	}else 
	{
		_strRMags1 = format ["""%1""`", _tempRuckMagList select _i];
		_strRMags = _strRMags + _strRMags1;
	};
};

//format return value, all weapons separated out into an array
_return_response = [_puid, _strWep, _strMags, _strWOB, _strRWep, _strRMags];

_return_response
