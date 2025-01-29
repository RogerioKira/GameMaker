/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

dano = noone;
dano_valor = 1;


xscale = 1;
dead = false;

velh = 0 ;
velv = 0;

poise = poise_max;

gerado = false;

cria_aviso = function()
{
	var _aviso = instance_create_depth(x,y,depth,obj_aviso);
	_aviso.p = id;
	
}

lida_dano = function(_dano = 1, _poise = 1)
{
	vida -= _dano;
	
	poise = max(poise - _poise,0);
	
	if(poise <= 0 or estado_atual != estado_atack)
	
	{
	
		troca_estado(estado_hurt);
	}
	
}

estado_idle = new estado();
estado_walk = new estado();
estado_atack = new estado();
estado_hurt = new estado();
estado_death = new estado();

inicia_estado(estado_idle);