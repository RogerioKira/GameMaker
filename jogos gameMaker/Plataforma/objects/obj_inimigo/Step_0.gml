/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

c = place_meeting(x,y +1 , obj_block);
p = place_meeting(x + sign(velh),y, obj_block);


if(p) velh *= -1;

if(velh !=0) image_xscale = sign(velh);

if(!c)
{
	velv += grav;
}