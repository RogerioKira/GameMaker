/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(global.acabou)
{
exit;
}

global.pontos += 0.1;

if (global.pontos >= global.dificuldade * 100)
{
	global.dificuldade ++;
	
	layer_hspeed("chao", - (7 + global.dificuldade));

}