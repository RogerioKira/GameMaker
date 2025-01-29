/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

depth = -y;

up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
atack = keyboard_check_pressed(vk_space) or keyboard_check(ord("J"));




roda_estado();