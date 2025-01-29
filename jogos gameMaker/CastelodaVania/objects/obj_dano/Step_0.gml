/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var outro ;
var outro_lista = ds_list_create();
var quantidade = instance_place_list(x,y,obj_entidade,outro_lista,0);

for(var i = 0; i< quantidade; i++)
{
	var atual = outro_lista[| i];
	
	if(object_get_parent(atual.object_index) !=object_get_parent(pai.object_index))
	{
		
		var pos = ds_list_find_index(aplicar_dano,atual);
		if (pos == -1)
		{
			ds_list_add(aplicar_dano,atual);
		}
	}
}


var tam = ds_list_size(aplicar_dano);
for(var i =0; i < tam; i++)
{
	outro =aplicar_dano[|i].id;
	if(outro.vida_atual > 0)
		{
				outro.image_index =0;
				outro.estado = "hit";
				outro.vida_atual -= dano;
		}
}


ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_lista);
instance_destroy();
