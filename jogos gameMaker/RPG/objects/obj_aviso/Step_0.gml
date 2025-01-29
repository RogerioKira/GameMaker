/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!p) instance_destroy();

if(!instance_exists(p)) instance_destroy();

x = p.x;
y = p.bbox_top;

image_alpha -= 0.02;

if(image_alpha <= 0) instance_destroy();