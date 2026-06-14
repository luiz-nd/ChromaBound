draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _screen_w = display_get_gui_width();
var _screen_h = display_get_gui_height();

// Função local para desenhar texto com contorno preto de 8 direções
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
    draw_text(_x + 2, _y + 2, _text);
    
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
    draw_text_transformed(_x + 2, _y + 2, _text, _xscale, _yscale, 0);
    
    draw_set_color(_color);
    draw_text_transformed(_x, _y, _text, _xscale, _yscale, 0);
};

// --- TÍTULO (PARABENS! COM ANIMAÇÃO CHROMABOUND) ---
draw_set_font(fnt_menu);
var title_text = "PARABENS!";
var char_count = string_length(title_text);
var scale_title = 1.6;
var total_width = 0;

for (var i = 1; i <= char_count; i++) {
    total_width += string_width(string_char_at(title_text, i)) * scale_title;
}

var start_x = (_screen_w / 2) - (total_width / 2);
var current_x = start_x;

for (var i = 1; i <= char_count; i++) {
    var char = string_char_at(title_text, i);
    
    // Cores animadas/variadas do tema de cores
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
    var char_y = 50 + sin((current_time / 150) + i) * 5;
    
    // Alinha horizontalmente à esquerda para as letras individuais
    draw_set_halign(fa_left);
    draw_text_transformed_outline(current_x, char_y, char, scale_title, scale_title, char_color);
    
    current_x += string_width(char) * scale_title;
}
// Restaura alinhamento central
draw_set_halign(fa_center);

draw_text_transformed_outline(_screen_w / 2, 95, "OBRIGADO POR JOGAR!", 1.1, 1.1, c_white);

// --- CORPO DO TEXTO (Resumo Divertido do TCC) ---
draw_set_font(fnt_game);
var text_y = 135;
var line_height = 28;
var body_scale = 0.95;

var lines = [
    "ChromaBound prova que aprender a",
    "Teoria das Cores pode ser muito divertido!",
    "",
    "Misturando diversao e educacao,",
    "este jogo de TCC ensina de forma",
    "pratica, colorida e interativa.",
    "",
    "A experimentacao em tempo real",
    "estimula o aprendizado e valida",
    "o poder dos jogos pedagogicos!"
];

for (var i = 0; i < array_length(lines); i++) {
    draw_text_transformed_outline(_screen_w / 2, text_y + (i * line_height), lines[i], body_scale, body_scale, c_white);
}

// --- BOTÃO VOLTAR ---
var btn_y = 450;
// Faz o botão pulsar de tamanho suavemente para ficar dinâmico e premium!
var btn_pulse = 1.1 + sin(current_time / 150) * 0.05;
draw_text_transformed_outline(_screen_w / 2, btn_y, "> VOLTAR AO MENU <", btn_pulse, btn_pulse, c_yellow);

// Reseta padrões do GM
draw_set_font(fnt_game);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(-1);
