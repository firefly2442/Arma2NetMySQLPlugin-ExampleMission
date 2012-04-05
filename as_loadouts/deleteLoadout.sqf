// AS Loadouts - Delete Loadout
#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Identify Player
_puid = getPlayerUID p1;

_dlg = findDisplay AS_LOADOUTS_DIALOG;
_loadoutName = ctrlText (_dlg displayCtrl AS_LOADOUTS_dropDownMenu);

_strDelete = format ["u=%1,n=%2", _puid, _loadoutName];

_delete = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'DeleteLoadoutUsingUIDandName', %1]", _strDelete];

closedialog 0;
