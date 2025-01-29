/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_set_font(fnt_ponto);

draw_set_color(c_gray);


var _pontos = "pontos:  " + string(round(global.pontos));

draw_text(890,28, _pontos);

var _pontos_alto = "Ma: "  + string(round(global.pontos_alto));


draw_text(800,28, _pontos_alto);



draw_set_color(-1);
draw_set_font(-1);