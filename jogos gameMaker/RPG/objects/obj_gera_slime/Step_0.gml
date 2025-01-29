/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

image_alpha += 0.02;

if(image_alpha >= 1)
{
	var _inimigo = instance_create_depth(x,y,depth, inimigo);
	instance_destroy();
	_inimigo.gerado = true;
	
	if(criador)
	{
		array_push(criador.filhos, _inimigo);
	}
}