// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

#macro FRAMES 60
game_set_speed(FRAMES,gamespeed_fps);
	
global.game_spd = 1;

global.framerate = global.game_spd / FRAMES;

global.gamesegundo = 0;

function atualiza_tempo(){

	global.gamesegundo = delta_time / 1000000;
	global.framerate = global.gamesegundo * global.game_spd;

}