// AS Loadouts - Select Loadout
#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Identify Player
_puid = getPlayerUID p1;

_loadoutName = _this select 0;

_strGet = format ["u=%1,n=%2", _puid, _loadoutName];

_get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['weapons', 'GetLoadoutByUIDandName', %1]", _strGet];




//TODO: set weapons loadout to player here







closedialog 0;
