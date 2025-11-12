schnitzel_start_football = [
	"schnitzel_start_football",
	"Start Football",
	"",
	{
		params ["_target","_player","_params"];
		schnitzelball setVariable ["schnitzel_football_active",true,true];
		[schnitzelball, 0, ["ACE_MainActions","schnitzel_start_football"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",0,false];
		[schnitzelball, 0, ["ACE_MainActions"], schnitzel_end_football] remoteExecCall ["ace_interact_menu_fnc_addActionToObject",0,false];
		[schnitzelball] remoteExec ["SCHNITZEL_fnc_football_calc",2,false];
	},
	{true}
] call ace_interact_menu_fnc_createAction;

schnitzel_end_football = [
	"schnitzel_end_football",
	"End Football",
	"",
	{
		params ["_target","_player","_params"];
		schnitzelball setVariable ["schnitzel_football_active",false,true];
		[schnitzelball, 0, ["ACE_MainActions","schnitzel_end_football"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",0,false];
		[schnitzelball, 0, ["ACE_MainActions"], schnitzel_start_football] remoteExecCall ["ace_interact_menu_fnc_addActionToObject",0,false];
	},
	{true}
] call ace_interact_menu_fnc_createAction;

//----------------------------------------------------------------------------------

if (schnitzelball getVariable ["schnitzel_football_active",false]) then {
	[schnitzelball, 0, ["ACE_MainActions"], schnitzel_end_football] call ace_interact_menu_fnc_addActionToObject;
}else{
	[schnitzelball, 0, ["ACE_MainActions"], schnitzel_start_football] call ace_interact_menu_fnc_addActionToObject;
};