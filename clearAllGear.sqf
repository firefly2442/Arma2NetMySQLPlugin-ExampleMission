// Clear All Gear

removeAllItems player;
removeAllWeapons player;
removeBackpack player;
if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
{
	[player, "WOB"] call ACE_fnc_RemoveGear;
	if ([player] call ACE_fnc_HasRuck) then
    {
		[player, "BTH"] call ACE_fnc_RemoveGear;
	};
};