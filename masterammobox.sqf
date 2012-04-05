/*
Script by Ghost (main design by Kronzky) Will add all weapons, items, magazines to an ammo box and refill it every 1200 seconds. no more manual typing of weapon/magazine/item names.
put null0 = this execVM "scripts\ammo.sqf"; in the initline of an ammo box.
*/

_wepcount = 10;
_magcount = 70;

clearweaponcargo _this;
clearmagazinecargo _this;

_weaponsList = [];
_namelist = [];
_cfgweapons = configFile >> "cfgWeapons";
for "_i" from 0 to (count _cfgweapons)-1 do {
	_weapon = _cfgweapons select _i;
	if (isClass _weapon) then {
		_wCName = configName(_weapon);
		_wDName = getText(configFile >> "cfgWeapons" >> _wCName >> "displayName");
		_wModel = getText(configFile >> "cfgWeapons" >> _wCName >> "model");
		_wType = getNumber(configFile >> "cfgWeapons" >> _wCName >> "type");
		_wscope = getNumber(configFile >> "cfgWeapons" >> _wCName >> "scope");
		_wPic =  getText(configFile >> "cfgWeapons" >> _wCName >> "picture");
		_wDesc = getText(configFile >> "cfgWeapons" >> _wCName >> "Library" >> "libTextDesc");	

		_isFake = false;
		_wHits=0;
		_mags=[];
		_muzzles = getArray(configfile >> "cfgWeapons" >> _wCName >> "muzzles");
		if ((_muzzles select 0)=="this") then {
			_muzzles=[_wCName];
			_mags = getArray(configfile >> "cfgWeapons" >> _wCName >> "magazines");
		} else {
			{
				_muzzle=_x;
				_mags = getArray(configfile >> "cfgWeapons" >> _wCName >> _muzzle >> "magazines");
			}forEach _muzzles;
		};
		{
			_ammo = getText(configfile >> "cfgMagazines" >> _x >> "ammo");
			_hit = getNumber(configfile >> "cfgAmmo" >> _ammo >> "hit");
			_wHits = _wHits + _hit;
		}forEach _mags;

		if ((_wCName!="") && (_wDName!="") && (_wModel!="") && (_wPic!="")) then {
			if !(_wDName in _namelist) then {
				_weaponsList = _weaponsList + [[_wCName,_wDName,_wPic,_wDesc]];
					_namelist = _namelist + [_wDName];

			};
		};
	};
	if (_i % 10==0) then {
		hintsilent format["Loading Weapons List... (%1)",count _weaponsList];
		sleep .0001;
};
};
hint "";
_namelist=nil;

_magazinesList = [];
_namelist = [];
_cfgmagazines = configFile >> "cfgmagazines";
for "_i" from 0 to (count _cfgmagazines)-1 do {
	_magazine = _cfgmagazines select _i;
	if (isClass _magazine) then {
		_mCName = configName(_magazine);
		_mDName = getText(configFile >> "cfgmagazines" >> _mCName >> "displayName");
		_mModel = getText(configFile >> "cfgmagazines" >> _mCName >> "model");
		_mType = getNumber(configFile >> "cfgmagazines" >> _mCName >> "type");
		_mscope = getNumber(configFile >> "cfgmagazines" >> _mCName >> "scope");
		_mPic =  getText(configFile >> "cfgmagazines" >> _mCName >> "picture");
		_mDesc = getText(configFile >> "cfgmagazines" >> _mCName >> "Library" >> "libTextDesc");	
		
		if ((_mCName!="") && (_mDName!="") && (_mModel!="")) then {
			if !(_mDName in _namelist) then {
				_magazinesList = _magazinesList + [[_mCName,_mDName,_mPic,_mDesc]];
					_namelist = _namelist + [_mDName];

			};
		};
	};
	if (_i % 10==0) then {
		hintsilent format["Loading magazines List... (%1)",count _magazinesList];
		sleep .0001;
};
};
hint "";
_namelist=nil;

while {alive _this} do
{
clearweaponcargo _this;
clearmagazinecargo _this;

for "_i" from 0 to (count _weaponsList)-1 do {
	_weapon = _weaponsList select _i;
	_this addweaponcargo [_weapon select 0,_wepcount];
};

for "_i" from 0 to (count _magazinesList)-1 do {
	_magazine = _magazinesList select _i;
	_this addmagazinecargo [_magazine select 0,_magcount];
};



sleep 200;
};