/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.acabou == true){

image_speed = 0;
exit;	
}

x -= velh + global.dificuldade;

if (x <= -64)
{
	instance_destroy();
}