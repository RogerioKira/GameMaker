function scr_atack(argument0, argument1, argument2)
{

var outro = argument0;
var dist = argument1;
var xscale = argument2;

//Checando se o player está na minha linha de visão
var player = collision_line(x, y - sprite_height/2, x + (dist * xscale), y - sprite_height/2, outro, 0, 1);

//Se o player entrou na minha linha de visão, eu ataco
if (player)
{
	estado = "atack";	
}
}