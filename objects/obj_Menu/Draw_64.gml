draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Funções locais auxiliares para desenhar texto com contorno preto de 8 direções (máxima legibilidade sobre qualquer fundo)
var draw_text_outline = function(_x, _y, _text, _color) {
    draw_set_color(c_black);
    draw_text(_x - 1, _y - 1, _text);
    draw_text(_x + 1, _y - 1, _text);
    draw_text(_x - 1, _y + 1, _text);
    draw_text(_x + 1, _y + 1, _text);
    draw_text(_x - 1, _y, _text);
    draw_text(_x + 1, _y, _text);
    draw_text(_x, _y - 1, _text);
    draw_text(_x, _y + 1, _text);
    draw_text(_x + 2, _y + 2, _text); // Sombra retro projetada
    
    draw_set_color(_color);
    draw_text(_x, _y, _text);
};

var draw_text_transformed_outline = function(_x, _y, _text, _xscale, _yscale, _color) {
    draw_set_color(c_black);
    draw_text_transformed(_x - 1, _y - 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x + 1, _y - 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x - 1, _y + 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x + 1, _y + 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x - 1, _y, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x + 1, _y, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x, _y - 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x, _y + 1, _text, _xscale, _yscale, 0);
    draw_text_transformed(_x + 2, _y + 2, _text, _xscale, _yscale, 0); // Sombra retro projetada
    
    draw_set_color(_color);
    draw_text_transformed(_x, _y, _text, _xscale, _yscale, 0);
};

// -------------------------------------------------------------
// 1. TÍTULO (CHROMABOUND - CORES FLUTUANDO)
// -------------------------------------------------------------
// Sem caixa/quadro preto no topo, apenas o título com letras flutuantes por cima do fundo!
draw_set_alpha(1.0);

var title_text = "ChromaBound";
var char_count = string_length(title_text);
var scale_title = 3;
var total_width = 0;

for (var i = 1; i <= char_count; i++) {
    total_width += string_width(string_char_at(title_text, i)) * scale_title;
}

var start_x = (room_width / 2) - (total_width / 2) + 20
var current_x = start_x;

for (var i = 1; i <= char_count; i++) {
    var char = string_char_at(title_text, i);
    
    // Cores representando o tema de mistura de cores do jogo
    var char_color = c_white;
    switch ((i - 1) % 6) {
        case 0: char_color = make_color_rgb(255, 75, 75); break;   // Vermelho
        case 1: char_color = make_color_rgb(255, 140, 0); break;    // Laranja
        case 2: char_color = make_color_rgb(255, 215, 0); break;    // Amarelo
        case 3: char_color = make_color_rgb(50, 205, 50); break;    // Verde
        case 4: char_color = make_color_rgb(30, 144, 255); break;   // Azul
        case 5: char_color = make_color_rgb(186, 85, 211); break;   // Roxo
    }
    
    // Animação ondulante (letras flutuando suavemente!)
    var char_y = 90 + sin((current_time / 150) + i) * 5;
    
    // Desenhar letra com contorno de 8 direções
    draw_text_transformed_outline(current_x, char_y, char, scale_title, scale_title, char_color);
    
    current_x += string_width(char) * scale_title;
}

// -------------------------------------------------------------
// 2. CONTEÚDO DO MENU (SEM QUADROS/BORDAS)
// -------------------------------------------------------------
draw_set_font(fnt_menu);

if(options_list == 1)
{
	// BOTAO START
	var start_text = (option_selected == 0) ? "> START <" : "START";
	var start_color = (option_selected == 0) ? c_yellow : c_white;
	var btn_scale = 1.3;
	draw_text_transformed_outline(room_width/2, 230, start_text, btn_scale, btn_scale, start_color);
	
	// BOTAO QUIT
	var quit_text = (option_selected == 1) ? "> QUIT <" : "QUIT";
	var quit_color = (option_selected == 1) ? c_yellow : c_white;
	draw_text_transformed_outline(room_width/2, 300, quit_text, btn_scale, btn_scale, quit_color);
	
	// INSTRUÇÕES DE CONTROLE E MISTURA
	draw_set_font(fnt_game);
	
	// Desenhar textos com contorno 8-way para total legibilidade sobre o fundo laranja/marrom

	// Alinha pela esquerda para juntar as cores
draw_set_halign(fa_left);
var cores_escrita = (room_width / 2) - (string_width("(Red, Blue, Yellow)") / 2);

draw_text_outline(cores_escrita, 400, "(Red, ", c_red);
draw_text_outline(cores_escrita + string_width("(Red, "), 400, "Blue, ", c_blue);
draw_text_outline(cores_escrita + string_width("(Red, Blue, "), 400, "Yellow)", c_yellow);

// Alinha pelo centro para a linha de baixo
draw_set_halign(fa_center);
draw_text_outline(room_width / 2, 435, "W/S: NAVIGATE   |    ENTER: SELECT", c_silver);


}
else if (options_list == 2)
{
	var diff_scale = 1.2;
	
	// DIFICULDADE: EASY
	var easy_text = (option_selected == 0) ? "> EASY <" : "EASY";
	var easy_color = (option_selected == 0) ? c_yellow : c_white;
	draw_text_transformed_outline(room_width/2, 205, easy_text, diff_scale, diff_scale, easy_color);
	
	// DIFICULDADE: HARD
	var hard_text = (option_selected == 1) ? "> HARD <" : "HARD";
	var hard_color = (option_selected == 1) ? c_yellow : c_white;
	draw_text_transformed_outline(room_width/2, 250, hard_text, diff_scale, diff_scale, hard_color);
	
	// DIFICULDADE: VERY HARD
	var vhard_text = (option_selected == 2) ? "> VERY HARD <" : "VERY HARD";
	var vhard_color = (option_selected == 2) ? c_yellow : c_white;
	draw_text_transformed_outline(room_width/2, 295, vhard_text, diff_scale, diff_scale, vhard_color);
	
	// BOTAO MENU
	var menu_text = (option_selected == 3) ? "> MENU <" : "MENU";
	var menu_color = (option_selected == 3) ? c_yellow : c_white;
	draw_text_transformed_outline(room_width/2, 340, menu_text, diff_scale, diff_scale, menu_color);
	
	// INSTRUÇÕES DE JOGO
	draw_set_font(fnt_game);
	
	draw_text_outline(room_width/2, 390, "CONTROLS", c_aqua);
	draw_text_outline(room_width/2, 410, "A / D: MOVE   |   SPACE: LAUNCH BALL", c_white);
	draw_text_outline(room_width/2, 430, "[1] [2] [3]  | MIX COLOR | ENTER: MENU", c_white);
	draw_text_outline(room_width/2, 450, "W/S: NAVIGATE   |   ENTER: CONFIRM", c_silver);
	
}

draw_set_font(fnt_game);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_colour(-1);