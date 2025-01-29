/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

depth = bbox_bottom;

if(transparente)
{
	
	if(instance_exists(obj_player))
	{
		if(obj_player.y<y)
		{
			if(point_in_rectangle(obj_player.x,obj_player.y,bbox_left -10,bbox_top - 25, bbox_right + 10,bbox_top))
			{
				image_alpha = lerp(image_alpha,.2,.02);
			}
			else
			{
				image_alpha = lerp(image_alpha,1,.1);
			}
		}
	}
}