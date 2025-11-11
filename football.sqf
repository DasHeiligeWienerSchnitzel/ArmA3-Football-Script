params ["_ball"];

_schnitzel_start_football = [
	"schnitzel_start_football",
	"Start Football",
	"",
	{
		params ["_target","_player","_params"];
		[_params select 0,_target] remoteExec ["SCHNITZEL_fnc_football",0,true];
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[_ball, 0, ["ACE_MainActions"], _schnitzel_start_football] call ace_interact_menu_fnc_addActionToObject;