#include "definitions.sqf"

class AS_Loadouts {
	idd = AS_LOADOUTS_DIALOG;
	movingEnable = true;
	onLoad = "[] execVM 'as_loadouts\populateDropDowns.sqf'";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 400; _windowHeight = 300;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = AS_LOADOUTS_BCKGRND;
			x = 0.1; y = 0.101;
			w = 1; h = 1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class TopTitle : HW_RscText {
		   	idc = AS_LOADOUTS_TITLE;
			x = 0.05; y =  0.13;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.04;
			text = "[AS] Loadout System";
		};
	};

	class controls {
		class CreateName : HW_RscText {
			x = 0.05; y = 0.3;
			w = 0.2; h = 0.035;
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.04;
			text = "Name:";
		};
		class LoadoutName : HW_RscText {
			idc = AS_LOADOUTS_LoadoutName;
			type = CT_EDIT;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			colorSelection[] = { 1, 1, 1, 1 };
			colorBorder[] = { 1, 1, 1, 1 };
			BorderSize = 0.01;
			autocomplete = false;
			x = 0.3; y = 0.3;
			w = 0.2; h = 0.035;
			sizeEx = 0.035;
			text = "";
		};
		//http://forums.bistudio.com/showthread.php?t=103810
		class newButton: HW_RscGUIShortcutButton {
			x = 0.6; y = 0.3;
			w = 0.2; h = 0.1;
			text = "Create New Loadout";
			onButtonClick = "execVM 'as_loadouts\createNewLoadout.sqf'";
		};
		
		class updateExistingDropdown : HW_RscComboBox {
			idc = AS_LOADOUTS_dropDownMenu;
			type = CT_COMBO;
			font = "BitStream";
			style = ST_LEFT;
			x = 0.3; y = 0.45;
			w = 0.15; h = 0.028;
			sizeEx = 0.025;
			rowHeight = 0.025;
			wholeHeight = 4 * 0.025; // 3 lines to display + 1 line of the unelapsed control
			color[] = {1,1,1,1};
			colorText[] = {0,0,0,1};
			colorSelectBackground[] = {0,0,0,1};
		};
		
		class updateButton: HW_RscGUIShortcutButton {
			x = 0.05; y = 0.6;
			w = 0.2; h = 0.1;
			text = "Update Existing Loadout";
			onButtonClick = "execVM 'as_loadouts\updateLoadout.sqf'";
		};
		class deleteButton: HW_RscGUIShortcutButton {
			x = 0.3; y = 0.6;
			w = 0.2; h = 0.1;
			text = "Delete Loadout";
			onButtonClick = "execVM 'as_loadouts\deleteLoadout.sqf'";
		};
		class selectButton: HW_RscGUIShortcutButton {
			x = 0.6; y = 0.6;
			w = 0.2; h = 0.1;
			text = "Select Loadout";
			onButtonClick = "execVM 'as_loadouts\selectLoadout.sqf'";
		};
		
		class CloseButton: HW_RscGUIShortcutButton {
			x = 0.2; y = 1.0;
			w = 0.2; h = 0.1;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
	};
};