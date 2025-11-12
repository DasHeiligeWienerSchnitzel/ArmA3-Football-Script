params ["_ball"];

_nearestMan = objNull;
_schnitzel_football_active = _ball getVariable ["schnitzel_football_active",true];

while {_ball getVariable ["schnitzel_football_active",true]} do {
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
		
		[_ball,[(_vel select 0) + (sin _dir * _additionalSpeed),(_vel select 1) + (cos _dir * _additionalSpeed),(_vel select 2)]] remoteExec ["setVelocity",owner _ball];
	};
	sleep 0.02;
};
