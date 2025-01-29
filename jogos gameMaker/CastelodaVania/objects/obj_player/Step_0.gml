/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var right,left,jump,atack,dash;
var chao = place_meeting(x,y + 1 , obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("K"));
atack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(ord("L"));

if(ataque_buff > 0)ataque_buff -= 1;


if(!chao){
	
	if (velv < max_velv * 2)
	{
		
		velv += GRAVIDADE* massa * global.vel_mult;
	}
}

velh = (right - left) * max_velh *  global.vel_mult;

switch(estado){
#region parado
case"parado":
{
	sprite_index = spr_player_parado1;
	
	if(right || left)
	{
		estado = "movendo";
		
	}
	else if (jump || velv !=0)
	{
		estado = "pulando";
		velv = (-max_velv * jump);
		image_index = 0;
	}
	else if (atack)
	{
		estado = "ataque";
		velh = 0;
		image_index = 0;
	}
	else if(dash)
	{
		estado = "dash"
		image_index = 0;
	}
	
	break;
}
#endregion
	
	#region movendo
	case"movendo":
	{
		sprite_index = spr_player_run;
		
		if(abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		else if (jump || velv !=0)
		{
		estado = "pulando";
		velv = (-max_velv * jump);
		image_index = 0;
		}
		else
		if(atack){
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		else if(dash)
		{
			estado ="dash";
			image_index =0;
		
		}
		
		break;
	}
	
	#endregion
	
	#region pulando
	
	case"pulando":
	{
	if(velv > 0)
	{
		sprite_index = spr_player_fall;
	}
	else
	{
		sprite_index =spr_player_pulando;
		if(image_index >= image_number -1 )
		{
			image_index = image_number-1;
		}
	}
	
	if(chao)
	{
		estado = "parado";
	}
	
		break;
	}
	
	#endregion
	#region ataque
	case "ataque":
	{
		velh = 0;
		
		if(combo == 0)
		{
		sprite_index = spr_atack1;
		}
		else if(combo == 1)
		{
			sprite_index = spr_atack2;
		}
		else if(combo == 2)
		{
			sprite_index = spr_atack3;
		}
		
		
		
		if(image_index >= 2 && dano == noone && posso)
		{
			dano = instance_create_layer(x + sprite_width/2,y - sprite_height/2,layer,obj_dano);
			dano.dano = ataque * ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		if(atack && combo <2)
		{
			ataque_buff = room_speed;
		}
		
		
		if(ataque_buff && combo <2 && image_index >= image_number - 1)
		{
			combo ++;
			image_index = 0;
			posso = true;
			ataque_mult += .5;
			if(dano)
			{
				instance_destroy(dano,false);
				dano = noone;
			
			}
			
			ataque_buff = 0;
		}
	
		if(image_index > image_number-1)
		{
			estado = "parado";	
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			if(dano)
			{
				instance_destroy(dano,false);
				dano = noone;
			}
		}
		 if(dash)
		{
			estado ="dash";
			image_index =0;
			combo = 0;
			if(dano)
			{
				instance_destroy(dano,false);
				dano =noone;
			}
			
		
		}
		
		 if (velv !=0)
		{
		estado = "pulando";
		image_index = 0;
		}
		break;
	}
	#endregion
	
	#region dash
	case "dash":
	{
		if(sprite_index != spr_dash)
		{
			sprite_index =spr_dash;
			image_index = 0;
		}
		velh = image_xscale * dash_vel;
		if (image_index >= image_number - 1)
		{
			estado = "parado";
		}
		break;
	}
	
	#endregion
	
	#region hit
	case "hit":
	{
		if(sprite_index != spr_player_hit)
		{
			sprite_index =spr_player_hit;
			image_index = 0;
		}
		
		velh = 0;
		
		if(vida_atual> 0)
		{
			if(image_index >= image_number -1)
			{
				estado = "parado";
			}
		}
		else
		{
			if(image_index >= image_number -1)
			{
				estado = "dead";
			}	
		}
		break;
	}

	
	#endregion
	
	#region dead
	case "dead":
	{
		if(instance_exists(obj_control))
		{
			 with(obj_control)
			 {
				 game_over = true;
			 }
		}
		
		velh = 0;
		
		if(sprite_index != Spr_player_died)
		{
			image_index = 0;
			sprite_index = Spr_player_died;
		
		}
		if(image_index >= image_number - 1)
		{
			image_index = image_number-1;
		}
		break;
	}
	
	#endregion
	default:
	{
		estado = "parado";
	}
}