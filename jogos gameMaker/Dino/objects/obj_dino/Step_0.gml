/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.acabou == true){
sprite_index =spr_derrota;

exit;
}

if( y >= 544)
{
	y = 544;
	velv = 0;
	
	if(keyboard_check_pressed(vk_space) or  keyboard_check_pressed(vk_up))
	{
		velv -= 18;
		
		audio_play_sound(sound_1,0,0);
	}
	
	image_speed = 1;

	if(keyboard_check(vk_down)){
		
		sprite_index = spr_abaixar;
	}
	
	else{
	sprite_index = spr_dino;
	}

}

else{
	
	if(keyboard_check(vk_down)){
	grav = 2;
	}
	else{
	grav = 0.7;
	}
	
	velv += grav;
	image_speed = 0;
}
y = y + velv;