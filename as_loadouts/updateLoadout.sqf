// AS Loadouts - Update Loadout
#define DEBUG_MODE_FULL
#include "script_component.hpp"

_allWeapons = [] call FUNC(getAllWeapons);

#include "dialog\definitions.sqf"
disableSerialization;
_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_dropDownMenu);


_strUpdate = format ["[u=%1,n=%2,a=%3,b=%4,c=%5,d=%6,e=%7]", _allWeapons select 0, _loadoutName, _allWeapons select 1,
															_allWeapons select 2, _allWeapons select 3, 
															_allWeapons select 4, _allWeapons select 5];

_update = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'UpdateLoadoutUsingUIDandName', '%1']", _strUpdate];

closedialog 0;
