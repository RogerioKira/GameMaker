/// @description Inserir descrição aqui

max_vida = 5;
vida = max_vida;

poise_max = 5;
poise = poise_max;

meu_dano = noone;
dano_poise = 6;

imageindex = 0;


estado_idle = new estado();

estado_walk = new estado(); 

estado_atack = new estado(); 

estado_hit = new estado();

estado_morre = new estado();

lida_dano = function(_dano = 1 , _poise =1)
{
	vida -= _dano;
	
	poise = max(poise - _poise,0);
	
	if(vida <= 0)
	{
		troca_estado(estado_morre);
		return;
	}
	
	
	if(poise <= 0 or estado_atual != estado_atack)
	{
		troca_estado(estado_hit);
	}
}

#region estado_idle
estado_idle.inicia = function()
{
	var _sprite = define_sprite(dir,spr_player_idle_side,spr_player_front_idle,spr_player_idle_back)
	
	sprite_index = _sprite;
	
	image_index = 0;
}

estado_idle.roda = function()
{
	if (up xor down or left xor right)
	{
		troca_estado(estado_walk);
	}
	
	if(atack)
	{
		troca_estado(estado_atack);
	}
	
}
#endregion

#region estado_walk
estado_walk.inicia = function()
{
	dir = (point_direction(0,0,right - left,down - up) div 90);
	
	
	
	sprite_index = define_sprite(dir,spr_player_walk_side,spr_player_walk_front,spr_player_walk_back);
	
	image_index = 0;
}

estado_walk.roda = function()
{
	dir = (point_direction(0,0,velh,velv) div 90);
	
	sprite_index = define_sprite(dir, spr_player_walk_side,spr_player_walk_front,spr_player_walk_back);
	
	if(velh != 0)
	{
		image_xscale = sign(velh);
	}
	velv = (down - up) * vel;
	velh = (right - left) * vel;

	
	if(velh == 0 && velv == 0)
	{
		troca_estado(estado_idle);
	}
	if(atack)
	{
		troca_estado(estado_atack);
	}
}
#endregion

#region estado_atack

estado_atack.inicia = function()
{
	
	sprite_index = define_sprite(dir,spr_player_atack_side,spr_player_atack_front,spr_player_atack_back);
	
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	var _x = x + lengthdir_x(16,dir * 90);
	var _y = y + lengthdir_y(16,dir * 90);
	
	meu_dano = instance_create_depth(_x,_y,depth,obj_dano_player);
	
	meu_dano.dano_poise = dano_poise;
	
}

estado_atack.roda = function()
{
	if(image_index >= image_number - 0.2)
	{
		troca_estado(estado_idle);
	}
}

estado_atack.finaliza = function()
{
	instance_destroy(meu_dano);
}

#endregion

#region estado hit
estado_hit.inicia = function()
{
	sprite_index = define_sprite(dir,spr_player_hit_side,spr_player_hit_front,spr_player_hit_back);
	
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	imageindex = 0;
}
estado_hit.roda = function()
{
	if(image_index > imageindex)
	{
		imageindex = image_index;
	}
	
	if(imageindex > image_index)
	{
		troca_estado(estado_idle);
	}

}

#endregion
#region estado_morre
estado_morre.inicia = function()
{
	sprite_index = spr_player_morre;
	image_index = 0;
	imageindex = 0;
}
estado_morre.roda = function()
{
	if(image_index > imageindex)
	{
		imageindex = image_index;
	}
	if(imageindex > image_index)
	{
		image_index = image_index -1;
	}
}

#endregion

#region variaveis

// Você pode escrever seu código neste editor
up = noone;
down = noone;
left = noone;
right = noone;
atack = noone;

velh = 0;
velv = 0;

vel = 2;

dir = 0;

#endregion

inicia_estado(estado_idle);