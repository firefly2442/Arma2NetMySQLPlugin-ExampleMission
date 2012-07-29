// AS Loadouts - Create Loadout
#define DEBUG_MODE_FULL
#include "script_component.hpp"

_allWeapons = [] call FUNC(getAllWeapons);

#include "dialog\definitions.sqf"
disableSerialization;
_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_LoadoutName);


_strCreate = format ["[u=%1,n=%2,a=%3,b=%4,c=%5,d=%6,e=%7]", _allWeapons select 0, _loadoutName, _allWeapons select 1,
															_allWeapons select 2, _allWeapons select 3, 
															_allWeapons select 4, _allWeapons select 5];
											
//TRACE_2("strCreate variable and loadout name: ",_strCreate,_loadoutName);

//check to make sure the user entered a loadout name
if (_loadoutName != "") then{
	_create = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'CreateNewLoadOut', '%1']", _strCreate];
	closedialog 0;
};