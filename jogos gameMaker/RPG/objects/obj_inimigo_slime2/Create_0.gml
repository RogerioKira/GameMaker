/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



// Inherit the parent event
event_inherited();

range = 30;

dano_valor = 2;

dir = 0;

sprite = 
{
	atack : spr_slime2_atack,
	death : spr_slime2_death,
	hurt :	spr_slime2_hurt,
	idle : spr_slime2_idle,
	walk : spr_slime2_walk
};

estado_atack.inicia = function()
{
	sprite_index = sprite.atack;
	image_index = 0;
	
	dir = point_direction(x,y,alvo.x,alvo.y);
}

estado_atack.roda = function()
{
	if(image_index >= 7)
	{
		var _dir = point_direction(x,y,alvo.x,alvo.y);
		
		var	_x = lengthdir_x(1,dir);
		var	_y = lengthdir_y(1,dir);
		
		if(!place_meeting(x + _x, y + _y,obj_colisor))
		{
			x += _x;
			y += _y;
			
			if(instance_exists(dano))
			{
				dano.x = x;
				dano.y = y;
			}
		}
		
		if(dano == noone)
		{
		dano = instance_create_depth(x,y,depth,obj_dano_inimigo);
		dano.dano = dano_valor;
		}
	}
	if(image_index >= image_number - 0.2)
	{
		troca_estado(estado_idle);
	}
	
}

estado_atack.finaliza = function()
{
	if(instance_exists(dano))
	{
	troca_estado(estado_idle);	
	}
	
	
}

inicia_estado(estado_idle);