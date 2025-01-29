/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
valor = 10;

ang = 5;

shake_pos = function()
{
	var _val = random_range(-valor,valor);
	
	if(valor != 0)
	{
		valor = lerp(valor,0,.2);
		
		view_set_xport(0, _val);
		view_set_yport(0, _val);
		
		if(valor <= 0.1)
		{
			valor = 0;
			
			view_set_xport(0, _val);
			view_set_yport(0, _val);
		}
	}
}

shake_ang = function()
{
	var _val = random_range(-ang,ang);
	
	if(ang != 0)
	{
		ang = lerp(ang,0,.1);
		
		
		camera_set_view_angle(view_camera[0],_val);
		
		if(ang <= 0.1) {
			ang = 0;
			
			camera_set_view_angle(view_camera[0], 0);
		}
		
	}
	
}