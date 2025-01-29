/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _dir = point_direction(other.x,other.y,x,y);

var _velh = lengthdir_x(1,_dir);
var _velv = lengthdir_y(1, _dir);

if(!place_meeting(x + _velh, y + _velv, obj_colisor))
{
	x += _velh;
	y += _velv;
}