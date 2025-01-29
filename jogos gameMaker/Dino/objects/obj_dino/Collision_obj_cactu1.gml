/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//game_restart();

//global.pontos = 0;

if (global.acabou == false)
{

	global.acabou = true;
	layer_set_visible("reiniciar",true);
	
	layer_hspeed("chao", 0);
	layer_hspeed("nuvem1",0);
	layer_hspeed("nuvem2",0);

	if(global.pontos > global.pontos_alto)
	{
		global.pontos_alto = global.pontos;
	}
	
	global.dificuldade = 1;
	
	audio_play_sound(sound_2,0,0);
}




