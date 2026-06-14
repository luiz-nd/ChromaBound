// Verifica se o jogo está pausado; se estiver, interrompe a execução do desenho do HUD para não duplicar elementos
if (global.paused) exit;

// Define a fonte pixelada retro usada para renderizar os textos do HUD
draw_set_font(fnt_game);

// Define o fator de escala para aumentar o tamanho das letras e torná-las mais visíveis na tela
var hud_scale = 1.3;

// Define a função local para desenhar texto com contorno preto de 8 direções e escala ampliada
// Isso garante legibilidade absoluta das estatísticas do jogo por cima de qualquer cor de fundo (especialmente branco)
var draw_hud_element = function(_x, _y, _text, _scale, _color) {
    // Define a cor preta para criar o contorno/sombra ao redor da letra
    draw_set_color(c_black);
    
    // Desenha o texto deslocado nas 8 direções adjacentes para formar o contorno completo de 1 pixel
    draw_text_transformed(_x - 1, _y - 1, _text, _scale, _scale, 0);
    draw_text_transformed(_x + 1, _y - 1, _text, _scale, _scale, 0);
    draw_text_transformed(_x - 1, _y + 1, _text, _scale, _scale, 0);
    draw_text_transformed(_x + 1, _y + 1, _text, _scale, _scale, 0);
    draw_text_transformed(_x - 1, _y, _text, _scale, _scale, 0);
    draw_text_transformed(_x + 1, _y, _text, _scale, _scale, 0);
    draw_text_transformed(_x, _y - 1, _text, _scale, _scale, 0);
    draw_text_transformed(_x, _y + 1, _text, _scale, _scale, 0);
    
    // Desenha uma sombra retro extra projetada para dar efeito de profundidade 3D nas letras
    draw_text_transformed(_x + 2, _y + 2, _text, _scale, _scale, 0);
    
    // Define a cor principal do texto selecionado
    draw_set_color(_color);
    
    // Desenha o texto principal por cima do contorno preto
    draw_text_transformed(_x, _y, _text, _scale, _scale, 0);
};

// --- RENDERIZAÇÃO DAS ESTATÍSTICAS ---

// 1. Desenha a pontuação atual do jogador (SCORE) na cor amarela, com maior espaçamento vertical (y = 10)
draw_hud_element(10, 10, "SCORE: " + string(global.pontuacao), hud_scale, c_yellow);

// 2. Desenha o recorde máximo salvo (RECORD) na cor verde limão (y = 35, compensando o tamanho maior das letras)
draw_hud_element(10, 35, "RECORD: " + string(global.recorde), hud_scale, c_lime);

// 3. Desenha a quantidade de vidas restantes (LIVES) na cor vermelha para melhor destaque de perigo (y = 60)
// Nota: Mudamos a cor das vidas de branco para vermelho/laranja para ficar bem mais visível no cenário branco
draw_hud_element(10, 60, "LIVES: " + string(global.vidas), hud_scale, make_color_rgb(255, 75, 75));

// Reseta a cor padrão do sistema de desenho do GameMaker para evitar conflitos com outros objetos
draw_set_color(c_white);