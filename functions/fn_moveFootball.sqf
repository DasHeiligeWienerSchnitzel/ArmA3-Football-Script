params ["_velSet"];

_clientBall = player getVariable ["schnitzel_football",objNull];
_clientBall setVelocity _velSet;