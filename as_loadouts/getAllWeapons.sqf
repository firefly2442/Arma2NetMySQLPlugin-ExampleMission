#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"

// Identify Player
_puid = getPlayerUID player;


// Grab all player weapons
_weparray = weapons player;
_strWep = "";

for "_i" from 0 to (count _weparray) -1 do
{
	if (_i == ((count _weparray) -1)) then
	{
		_strWep1 = format ["%1", _weparray select _i];
		_strWep = _strWep + _strWep1;
	}else 
	{
		_strWep1 = format ["%1`", _weparray select _i];
		_strWep = _strWep + _strWep1;
	};
};

//TRACE_1("Weapons: ",_strWep);


// Grab all player magazines
_mags = magazines player;

_strMags = "";

for "_i" from 0 to (count _mags) -1 do
{
	if (_i == ((count _mags) -1)) then
	{
		_strMags1 = format ["%1", _mags select _i];
		_strMags = _strMags + _strMags1;
	}else 
	{
		_strMags1 = format ["%1`", _mags select _i];
		_strMags = _strMags + _strMags1;
	};
};

//TRACE_1("Magazines: ",_strMags);
// Init all the strings here so we can return them down below.
_strWOB = "";
_strRWep = "";
_strRMags = "";
_strOABack = "";


// This if statement checks if the user has ACE running and then either uses the ACE ruck set up or the OA backpack setup.
if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
{
    // ***************************    
    // Grab player ACE_WeaponOnBack
    // ***************************    
    _WOB = [player] call ACE_fnc_WeaponOnBackName;

    //TRACE_1("Weapons on Back (WOB): ",_WOB);


    if (_WOB != "") then {
	_strWOB = format ["%1", _WOB];
    };

    //TRACE_1("_strWOB: ",_strWOB);

    // ***************************
    // Grab player ACE backpack weapons
    // *************************** 
    
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


    for "_i" from 0 to (count _tempRuckwepList) -1 do
    {
        if (_i == ((count _tempRuckwepList) -1)) then
        {
            _strRWep1 = format ["%1", _tempRuckwepList select _i];
            _strRWep = _string + _strRWep1;
        }else 
        {
            _strRWep1 = format ["%1`", _tempRuckwepList select _i];
            _strRWep = _string + _strRWep1;
        };
    };

    //TRACE_1("_strRWep: ",_strRWep);
    
    // ***************************
    // Grab player ACE backpack magazines
    // ***************************    
    _MagazinesRuckList = [player] call ACE_fnc_RuckMagazineslist;

    //???
    //Is this for filtering based on the mission?
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


    for "_i" from 0 to (count _tempRuckMagList) -1 do
    {
        if (_i == ((count _tempRuckMagList) -1)) then
        {
            _strRMags1 = format ["%1", _tempRuckMagList select _i];
            _strRMags = _strRMags + _strRMags1;
        }else 
        {
            _strRMags1 = format ["%1`", _tempRuckMagList select _i];
            _strRMags = _strRMags + _strRMags1;
        };
    };
}

// This is where we get all the non ACE or OA gear info.
else  
{
   
   //TRACE_1("_strRMags: ",_strRMags);
    
    // ***************************
   //Get the type of OA backpack
  // ***************************
    
    _OAbp = typeOf unitBackpack player;
    _string1 = format ["""%1""", _OAbp];
    _strOABack = _strOABack + _string1;

    // ***************************
   //Get the magazines from the OA backpack
  // ***************************
    _MagazinesRuckList = getMagazineCargo unitBackpack player;

    _tempRuckMagList = [];

    for "_i" from 0 to (count (_MagazinesRuckList select 0) - 1) do {
    
        _tempclass = (_MagazinesRuckList select 0)  select _i;
        _tempnum = (_MagazinesRuckList select 1)  select _i;
    
    
        for "_j" from 0 to (_tempnum - 1) do {
        
            _tempRuckMagList = _tempRuckMagList + [_tempclass];
        
        };

    };


    for "_i" from 0 to (count _tempRuckMagList) -1 do
    {
        if (_i == ((count _tempRuckMagList) -1)) then 
        {
            _strRMags1 = format ["""%1""", _tempRuckMagList select _i];
            _strRMags = _strRMags + _strRMags1;
        }else 
        {
            _strRMags1 = format ["""%1"",", _tempRuckMagList select _i];
            _strRMags = _strRMags + _strRMags1;
        };
    };

    // ***************************
   // Get the Weapons from the OA backpack
  // ***************************

    _WeaponsRuckList = getWeaponCargo unitBackpack player;

    _tempRuckwepList = [];

    {
        _tempnum = _x select 1;
        _tempclass = _x select 0;
        for [{_i=0}, {_i<_tempnum}, {_i=_i+1}] do
        {
            _tempRuckwepList = _tempRuckwepList + [_tempclass];
        };
    } forEach _WeaponsRuckList;



    for "_i" from 0 to (count _tempRuckwepList) -1 do
    {
        if (_i == ((count _tempRuckwepList) -1)) then 
        {
            _string1 = format ["""%1""", _tempRuckwepList select _i];
            _strRWep = _strRWep + _string1;
        }else 
        {
            _strRWep1 = format ["""%1"",", _tempRuckwepList select _i];
            _strRWep = _strRWep + _strRWep1;
        };
    };
  
};

//format return value, all weapons separated out into an array
_return_response = [_puid, _strMags, _strWep, _strRMags, _strRWep, _strWOB, _strOABack];

//TRACE_1("Returning weapon response: ",_return_response);

_return_response
