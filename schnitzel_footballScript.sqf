params ["_ball"];

_schnitzel_football = {
	params ["_function","_ball"];

	[_ball, 0, ["ACE_MainActions","schnitzel_start_football"]] call ace_interact_menu_fnc_removeActionFromObject;

	_schnitzel_end_football = [
		"schnitzel_end_football",
		"End Football",
		"",
		{
			params ["_target","_player","_params"];
			[_target, 0, ["ACE_MainActions","schnitzel_end_football"]] call ace_interact_menu_fnc_removeActionFromObject;
			[_target] execVM "schnitzel_footballScript.sqf";
			_target setVariable ["schnitzel_football_active",false,true];
		},
		{true}
	] call ace_interact_menu_fnc_createAction;
	[_ball, 0, ["ACE_MainActions"], _schnitzel_end_football] call ace_interact_menu_fnc_addActionToObject;
	
	_nearestMan = objNull;
	_schnitzel_football_active = _ball getVariable ["schnitzel_football_active",true];
	while {_schnitzel_football_active == true} do {
		_nearbyMen = _ball nearEntities [["Man"],0.5];
		if (count _nearbyMen > 0) then {
			if (count _nearbyMen > 1) then {
				_sortedNearbyMen = [[_nearbyMen], [], {_ball distance _x}, "ASCEND"] call BIS_fnc_sortBy;
				_nearestMan = _sortedNearbyMen select 0;
			}else{
				_nearestMan = _nearbyMen select 0;
			};
			_vel = velocity _nearestMan;
			_dir = getDir _nearestMan;
			_additionalSpeed = 5;
			_ball setVelocity [
				(_vel select 0) + (sin _dir * _additionalSpeed),
				(_vel select 1) + (cos _dir * _additionalSpeed),
				(_vel select 2)
			];
		};
		sleep 0.001;
	};
};

_schnitzel_start_football = [
	"schnitzel_start_football",
	"Start Football",
	"",
	{
		params ["_target","_player","_params"];
		[_params select 0,_target] spawn {call (_this select 0)};
	},
	{true},
	{},
	[_schnitzel_football]
] call ace_interact_menu_fnc_createAction;
[_ball, 0, ["ACE_MainActions"], _schnitzel_start_football] call ace_interact_menu_fnc_addActionToObject;
