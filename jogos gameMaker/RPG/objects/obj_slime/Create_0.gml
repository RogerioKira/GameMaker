/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

tempo_estado =  game_get_speed(gamespeed_fps) * 15;
timer_estado = tempo_estado;

range = 15;
dano_valor = 1;
dano = noone;

sprite = 
{
	atack : spr_slime_atack,
	death : spr_slime_die,
	hurt : spr_slime_hurt,
	idle : spr_slime_idle,
	walk : spr_slime_walk
};

destino_x = 0;
destino_y = 0;

alvo = noone;

// Inherit the parent event
event_inherited();

estado_hunt = new estado();

#region estado_idle
estado_idle.inicia =function()
{
	sprite_index = sprite.idle;
	image_index = 0;
	
	timer_estado = tempo_estado;
}

estado_idle_roda = function()
{
	timer_estado --;
	
	var _tempo = irandom(timer_estado);
	
	if(_tempo <= tempo_estado * .01)
	{
		var _estado_novo = choose(estado_idle,estado_walk,estado_walk);
		
		troca_estado(_estado_novo);
	}
}

#endregion

#region estado_walk
estado_walk.inicia = function()
{
	sprite_index = sprite.walk;
	image_index = 0;
	timer_estado = tempo_estado;
	
	
	destino_x = irandom(room_width);
	destino_y = irandom(room_height);
	
	xscale = sign(destino_x - x);
}
estado_walk.roda= function()
{
		timer_estado --;
		
		var _tempo = irandom(timer_estado);
	
	if(_tempo <= 5)
	{
		var _estado_novo = choose(estado_idle,estado_walk);
		
		//troca_estado(_estado_novo);
	}
	
	mp_potential_step_object(destino_x,destino_y,1,all);
}
#endregion
#region estado_atack
estado_atack.inicia = function()
{
	sprite_index = sprite.atack;
	image_index =0;
}
estado_atack.roda= function()
{
	if(dano == noone && image_index >= 7)
	{
		dano = instance_create_depth(x,y,depth,obj_dano_inimigo);
		dano.dano = dano_valor;
	}
	
	if(image_index >= image_number - .5)
	{
		troca_estado(estado_idle);
	}
}
estado_atack.finaliza = function()
{
		alvo = noone;
		
		if(instance_exists(dano))
		{
			instance_destroy(dano);
		}
		
	dano = noone;
}
#endregion
#region estado_hurt
estado_hurt.inicia = function()
{
	sprite_index = sprite.hurt;
	image_index =0;

	
}
estado_hurt.roda= function()
{
	if(image_index >= image_number = .5)
	{
		if(vida >0)
		{
			troca_estado(estado_hunt);
		}
		else{
			troca_estado(estado_death);
		}
	}
}
estado_hurt.finaliza = function()
{

	if(poise < 1)
	{
		poise = poise_max;
	}

}
#endregion
#region estado_die
estado_death.inicia = function()
{
	sprite_index = sprite.death;
	image_index =0;
	
	mask_index = -1;
	
	dead = true;
}
estado_death.roda= function()
{
	if(image_index >= image_number - .5)
	{
		instance_destroy();
	}
}
#endregion
#region estado_hunt

estado_hunt.inicia = function()
{
	sprite_index = sprite.walk;
	image_index =0;
	
	if(instance_exists(obj_player))
	{
		alvo = obj_player.id;
	}
	
	cria_aviso();
	
}
estado_hunt.roda = function()
{
	if(!instance_exists(obj_player))
	{
		alvo = noone;
		troca_estado(estado_idle);
	}
	
	mp_potential_step_object(alvo.x,alvo.y,1,all);
	
	var _dist = point_distance(x,y,alvo.x,alvo.y);
	
	if(_dist <= range)
	{
		troca_estado(estado_atack);
	}
	
	var _n = instance_number(object_index);
	
	for(var i = 0;i < _n; i++)
	{
		var _slime = instance_find(object_index,i);
		if(_slime == id)
		{
			
		}
		else
		{
			if(_slime.alvo != alvo)
			{
				var _dist = point_distance(x,y, _slime.x,_slime.y);
				if(_dist < 50)
				{
					with(_slime)
					{
						if(estado_atual != estado_death)
						{
						troca_estado(estado_hunt);
						}
					}
				}
			}	
		}
	}
	
}


#endregion




inicia_estado(estado_idle);