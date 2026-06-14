// 1. Desenhar contorno preto de 8 direções para descolar a bola do fundo pintado
draw_sprite_ext(sprite_index, image_index, x - 2, y - 2, image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x + 2, y - 2, image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x - 2, y + 2, image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x - 2, y,     image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x + 2, y,     image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x,     y - 2, image_xscale, image_yscale, image_angle, c_black, 1.0);
draw_sprite_ext(sprite_index, image_index, x,     y + 2, image_xscale, image_yscale, image_angle, c_black, 1.0);

// 2. Desenhar a bola principal colorida por cima
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
