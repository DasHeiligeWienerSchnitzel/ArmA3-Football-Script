params ["_function","_ball"];

[_ball, 0, ["ACE_MainActions","schnitzel_start_football"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",0,true];

_schnitzel_end_football = [
	"schnitzel_end_football",
	"End Football",
	"",
	{
		params ["_target","_player","_params"];
		[_target, 0, ["ACE_MainActions","schnitzel_end_football"]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject",0,true];
		_target setVariable ["schnitzel_football_active",false,true];
		[[_target],"football.sqf"] remoteExec ["execVM",0,true];
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[_ball, 0, ["ACE_MainActions"], _schnitzel_end_football] remoteExecCall ["ace_interact_menu_fnc_addActionToObject",0,true];

[_ball] remoteExec ["SCHNITZEL_fnc_football_calc",2];