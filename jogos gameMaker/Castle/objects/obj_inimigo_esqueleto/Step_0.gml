/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x,y + 1,obj_block);

if(!chao)
{
	velv += GRAVIDADE * massa * global.vel_mult;
}



switch(estado)
{
	case"parado":
	{
		velh = 0;
		timer_estado  ++;
		if(sprite_index != spr_esqueleto_idle)
		{
			image_index = 0;
		}
		sprite_index =spr_esqueleto_idle;
		
		if(position_meeting(mouse_x,mouse_y,self))
		{
			if(mouse_check_button_pressed(mb_right))
			{
				estado = "hit";
			}
		}
		if(irandom(timer_estado) > 300)
		{
			estado = choose("walk","parado","walk");
			timer_estado = 0;
		}
		scr_atack(obj_player,dist,xscale);


		
		break;
	}
	
	case"walk":
	{
		
		timer_estado ++;
		if(sprite_index != spr_esqueleto_walk)
		{
			image_index = 0;
			velh  = choose(1,-1) * global.vel_mult;
		}
		sprite_index = spr_esqueleto_walk;
		
		if(irandom(timer_estado)>300)
		{
			estado = choose("parado","parado","walk");
			timer_estado = 0;
		}
		scr_atack(obj_player,dist,xscale);


		
		break;
	}
	case "atack":
	{
		velh = 0;
		if (sprite_index != spr_esqueleto_atack)
		{
			image_index =0;
			posso = true;
			dano = noone;
		}
		sprite_index = spr_esqueleto_atack;
		if(image_index > image_number -1)
		{
			estado = "parado";
		}
		if(image_index >= 8 && dano =noone && image_index < 15 && posso)
		{
			dano =  instance_create_layer(x + sprite_height/2 ,y - sprite_height/3,layer,obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			posso = false;
		}
		if(dano != noone && image_index >= 15 )
		{
		instance_destroy(dano);
		dano = noone;
		}
		
		
		break;
	}
	
	case"hit":
	{
		if(sprite_index != spr_esqueleto_hit)
		{
			image_index = 0;
			//vida_atual--;
		}
		sprite_index = spr_esqueleto_hit;
		
		if(vida_atual >0)
		{
			if(image_index > image_number -1)
			{
				estado = "parado";
			}
		}
		else
		{
			if(image_index >= 4)
			{
				estado = "dead";
			}
		}
		
		break;
	}
	case "dead":
	{
		velh =0;
		if(sprite_index != spr_esqueleto_morre)
		{
			image_index = 0;
		}
		
		sprite_index = spr_esqueleto_morre;
		if(image_index > image_number -1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if(image_alpha <= 0) instance_destroy();
		}
	}
}
