params ["_ballPos"];

_ball = createVehicleLocal ["Land_Football_01_F",_ballPos,[],0,"CAN_COLLIDE"];
player setVariable ["schnitzel_football",_ball,false];