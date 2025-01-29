/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();


sprite = 
{
	atack : spr_slime3_atack,
	death : spr_slime3_death,
	hurt : spr_slime3_hurt,
	idle : spr_slime3_idle,
	walk : spr_slime3_walk
};

dir = 0;
filhos = [];

image_index_prev = 0;

contador_atack = 0;

image_xscale = 1.5;
image_yscale = 1.5;

#region estado hunt

estado_hunt.inicia = function()
{
	sprite_index = sprite.walk ;
	image_index = 0;
	
	cria_aviso();
	
	if(instance_exists(obj_player))
	{
		alvo = obj_player.id;
		dir = point_direction(alvo.x,alvo.y,x,y);
	}

	
}


estado_hunt.roda = function()
{
	if(!instance_exists(alvo))
	{
		troca_estado(estado_idle);
		exit;
	}
	
	velh = lengthdir_x(1,dir);
	velv = lengthdir_y(1,dir);

	if(velh != 0) xscale = sign(velh);	
	
	var _dist = point_distance(x,y,alvo.x,alvo.y);
	
	if(_dist >= 100)
	{
		troca_estado(estado_atack);	
	}
		
	
}

estado_hunt.finaliza = function()
{
	velh = 0;
	velv = 0;
}


#endregion

#region #atack
estado_atack.inicia = function()
{
	sprite_index = sprite.atack;
	image_index = 0;
	
}
estado_atack.roda = function()
{
	if(image_index >= image_index_prev)
	{
		if(image_index_prev == 0)
		{
			
			var _filho = instance_create_depth(x,y,depth,obj_gera_slime);
			_filho.criador = id;
		}
		image_index_prev = image_index;
	}
	else
	{
		contador_atack++;
		image_index_prev = 0;
		
	}
	
	
	if(image_index >= 7)
	{
		velh = lengthdir_x(1,dir);
		velv = lengthdir_y(1,dir);
	}
	else
	{
		velh = 0;
		velv = 0;
	}
	
	if(contador_atack >= 2)
	{
		troca_estado(estado_idle);
	}
	
}
estado_atack.finaliza = function()
{
	contador_atack = 0;
	
	var _avisa_filho = function(_elemento)
	{
		_elemento.alvo = alvo;
		_elemento.gerado = false;
		
		with(_elemento)
		{
			troca_estado(estado_hunt);
		}
		
	}
	
	array_foreach(filhos, _avisa_filho);
	
	array_resize(filhos,0);
	
}

#endregion


inicia_estado(estado_idle);