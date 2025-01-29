/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

draw_sprite(spr_item,0,x,y - 16);

draw_set_valign(1);
draw_set_halign(1);

var _x = x;
var _y = y+24;

draw_ellipse_color(_x- 32,_y -16,_x +32,_y +16, c_gray,c_dkgray,false);

draw_text(_x,_y ,level);


draw_rectangle_color();

draw_set_valign(-1);
draw_set_halign(-1);