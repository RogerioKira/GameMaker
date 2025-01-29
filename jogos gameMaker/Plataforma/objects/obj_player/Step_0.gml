/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
c = place_meeting(x,y + 1,obj_block);

var left,right,jump, jump_s, run, dash;

left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
jump = keyboard_check(vk_space);
jump_s = keyboard_check_released(vk_space);
run = keyboard_check(vk_shift);
dash = keyboard_check_pressed(ord("Z"));



if(run)
{
	var velocidade = velh_cor;
}
else
{
	var velocidade = max_velh;
}
if(dash)
{
	slide = true;
}



velh = (right - left) * velocidade;

if(velh != 0) 
{
	image_xscale = sign(velh);

	if(run)
	{
	sprite = spr_player_run;
	}
	else
	{
		sprite = spr_player_walk;
	}
}
else
{
	sprite = spr_player_idle;
}


if(c)
{
	if(jump) velv = -max_velv;
	pulo = max_pulo;
}
else
{
	velv += grav;
	
	if(jump_s)
	{
		if(velv <0)
		{
			velv = velv * .5;
		}
	}
	
	if(jump && pulo > 1)
	{
		velv = -max_velv;
		pulo--;
	}
	
	if(velv < 0) sprite = spr_player_jump;
	else sprite = spr_player_caindo;
	
}


if(slide && c)
{
	slide_timer--;
	sprite = spr_player_slide;
	velh = image_xscale * slide_vel;
	image_yscale = .5;
	var sem_teto = !place_meeting(x,y - sprite_height,obj_block);
	
	if(slide_timer <=0 && sem_teto)
	{
		slide = false;
		slide_timer = room_speed /4;
		image_yscale = 1;
	}
}


var dano_i = instance_place(x,y+1,obj_inimigo);
if(dano_i)
{
	velv = -max_velv;
	instance_destroy(dano_i);
}
if(place_meeting(x,y,obj_inimigo))
{
	dano = true;
}
if(dano && !dano_i)
{
	if(controle_dano)
	{
		velv = -3;
		controle_dano = false;
		dano_dir = sign(velh) * -5;
		image_speed = .1;
	}
	sprite = spr_player_dano;
	velh = dano_dir;
	image_blend = c_red;
	
	dano_timer--;
	if(dano_timer <=0)
	{
		dano = false;
		dano_timer = room_speed/2;
		image_blend = c_white;
		controle_dano = true;
	}
}




sprite_index = sprite;
