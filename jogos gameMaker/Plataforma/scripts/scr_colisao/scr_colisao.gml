// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_colisao(){
	
repeat(abs(velh))
{
	if(place_meeting(x + sign(velh),y,obj_block)&&
	!place_meeting(x+ sign(velh),y -1,obj_block)) y --;
	
	if(!place_meeting(x + sign(velh),y,obj_block)&&
	!place_meeting(x+ sign(velh),y + 1,obj_block)) &&
	place_meeting( x + sign(velh),y +2, obj_block) y++;
	
	
	if(!place_meeting(x +sign(velh),y ,obj_block))
	{
		x += sign(velh);
	}
	else
	{
		velh = 0;
		break;
	}
}

repeat(abs(velv))
{
	if(!place_meeting(x,y+sign(velv),obj_block))
	{
		y += sign(velv);
	}
	else
	{
		velv = 0;
		break;
	}
}


}