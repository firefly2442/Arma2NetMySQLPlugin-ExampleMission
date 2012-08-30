// Local Ammo Crates - Gnome_AS
private ["_crate","_crate_pos","_crate_script"];
_crate_pos = getMarkerPos "ammo_crate";
if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
	_crate_loadout = "ACE_Loadouts.sqf";
} else {
	_crate_loadout = "Vanilla_Loadouts.sqf";
};
_crate = "USVehicleBox" createVehicleLocal _crate_pos;
_crate setDir 90;
_crate setPos _crate_pos;
player reveal _crate;
[_crate] execVM _crate_loadout;
_clearRuck = _crate addAction ["<t color='#B0C4DE'>Clear Ruck</t>","clearRuck.sqf",[],-1,false,true];

//Custom loadouts
_crate addAction ["<t color='#FFFFFF'>AS Loadout System</t>","as_loadouts\init_loadouts.sqf"];