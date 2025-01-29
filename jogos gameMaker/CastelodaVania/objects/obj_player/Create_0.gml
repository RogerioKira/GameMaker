/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
randomize();

var cam = instance_create_layer(x,y,layer,obj_Camera);
cam.alvo = id;
// Inherit the parent event
event_inherited();

vida_max = 2;
vida_atual = vida_max;

max_velh = 4;
max_velv = 6;
dash_vel = 4;

mostra_estado= true;

ataque = 1;
dano = noone;

combo = 0;
posso = true;
ataque_mult = 1;
ataque_buff = room_speed;
