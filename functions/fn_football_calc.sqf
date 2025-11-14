params ["_ballPos"];

_masterBall = createVehicleLocal ["Land_Football_01_F",_ballPos,[],0,"CAN_COLLIDE"];

[_ballPos] remoteExec ["SCHNITZEL_fnc_createFootball",-2];

_nearestMan = objNull;
_schnitzel_football_active = schnitzelball getVariable ["schnitzel_football_active",true];

while {schnitzelball getVariable ["schnitzel_football_active",true]} do {
	_nearbyMen = _masterBall nearEntities [["Man"],0.5];
	if (count _nearbyMen > 0) then {
		
		if (count _nearbyMen > 1) then {
			_sortedNearbyMen = [[_nearbyMen], [], {_masterBall distance _x}, "ASCEND"] call BIS_fnc_sortBy;
			_nearestMan = _sortedNearbyMen select 0;
		}else{
			_nearestMan = _nearbyMen select 0;
		};
		
		_vel = velocity _nearestMan;
		_dir = getDir _nearestMan;
		_additionalSpeed = 5;
		
		_velSet = [
			(_vel select 0) + (sin _dir * _additionalSpeed),
			(_vel select 1) + (cos _dir * _additionalSpeed),
			(_vel select 2)
		];
		
		_masterBall setVelocity _velSet;
		
		[_velSet] remoteExec ["SCHNITZEL_fnc_moveFootball",-2];
		
		schnitzelball setVariable ["schnitzel_football_pos",getPos _masterBall];
		
	};
	sleep 0.02;
};

deleteVehicle _masterBall;
remoteExec ["SCHNITZEL_fnc_deleteFootball",-2];



