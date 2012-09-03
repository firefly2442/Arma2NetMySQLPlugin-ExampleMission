// Local Ammo Crates - Gnome_AS
private ["_crate","_crate_pos","_crate_script"];
_crate_pos = getMarkerPos "ammo_crate";
_crate_loadout = "";
_crate = "USVehicleBox" createVehicleLocal _crate_pos;
if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
	_crate_loadout = "ACE_Loadouts.sqf";
    _clearRuck = _crate addAction ["<t color='#B0C4DE'>Clear ACE Ruck</t>","clearACERuck.sqf",[],-1,false,true];
} else {
	_crate_loadout = "Vanilla_Loadouts.sqf";
};
_crate setDir 90;
_crate setPos _crate_pos;
player reveal _crate;
[_crate] execVM _crate_loadout;

// Add the action to clear ALL gear
_crate addAction ["<t color='#B0C4DE'>Clear All Gear</t>","clearAllGear.sqf",[],-1,false,true];

// Add the action to the ammo box for Custom loadouts
_crate addAction ["<t color='#FFFFFF'>AS Loadout System</t>","as_loadouts\dialog\as_plo_gui_start.sqf"];