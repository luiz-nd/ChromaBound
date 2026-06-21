depth = -10000; // Garante que a tela de pausa desenhe por cima dos monstros e de tudo no jogo
var _screen_w = display_get_gui_width();
var _screen_h = display_get_gui_height();

// -------------------------------------------------------------
// RENDERIZAÇÃO DA TELA DE PAUSA
// -------------------------------------------------------------
if (global.paused)
{
    // Escurecimento de fundo sutil (sem molduras/quadros na tela)
    draw_set_colour(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, _screen_w, _screen_h, false);
    draw_set_alpha(1.0);
    
    // Funções locais de contorno para garantir leitura direta em qualquer fundo
    var draw_pause_text_outline = function(_x, _y, _text, _color) {
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

    var draw_pause_text_transformed_outline = function(_x, _y, _text, _xscale, _yscale, _color) {
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
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var show_options = false;
    if (variable_instance_exists(id, "options_menu_active")) {
        show_options = options_menu_active;
    }
    
    if (show_options) 
    {
        // -------------------------------------------------------------
        // TELA DE OPÇÕES / COMO JOGAR
        // -------------------------------------------------------------
        draw_set_font(fnt_menu);
        draw_pause_text_transformed_outline(_screen_w / 2, _screen_h / 2 - 170, "HOW TO PLAY", 1.5, 1.5, c_yellow);
        
        draw_set_font(fnt_game);
        
        // Seção: CONTROLES
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 - 120, "--- CONTROLS ---", c_yellow);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 - 95, "A / D : MOVE PADDLE", c_white);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 - 75, "SPACE : LAUNCH / REBOUND BALL", c_white);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 - 55, "1, 2, 3 : CHOOSE COLOR (RED, BLUE, YELLOW)", c_white);
        
        // Seção: REGRAS DE MISTURA
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 - 10, "--- COLOR MIXING RULES ---", c_yellow);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 15, "RED + BLUE = PURPLE   |   RED + YELLOW = ORANGE", c_white);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 35, "BLUE + YELLOW = GREEN   |  ", c_white);
        
        // Seção: OBJETIVO
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 80, "--- GAMEPLAY GOAL ---", c_yellow);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 105, "MATCH THE BALL'S COLOR TO THE ENEMY'S COLOR", c_white);
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 125, "TO SUCCESSFULLY BREAK IT!", c_white);
        
        // Voltar
        draw_pause_text_outline(_screen_w / 2, _screen_h / 2 + 175, "PRESS ENTER OR ESC TO RETURN", c_silver);
    }
    else 
    {
        // -------------------------------------------------------------
        // MENU DE PAUSA NORMAL
        // -------------------------------------------------------------
        draw_set_font(fnt_menu);
        var scale_title = 1.8;
        var pause_y = (_screen_h / 2) - 110;
        draw_pause_text_transformed_outline(_screen_w / 2, pause_y, "PAUSE", scale_title, scale_title, c_yellow);
        
        // Opções do menu
        var option_scale = 1.2;
        var selected = variable_instance_exists(id, "option_selected") ? option_selected : 0;
        
        // Opção 0: CONTINUAR
        var text_0 = (selected == 0) ? "> CONTINUE <" : "CONTINUE";
        var color_0 = (selected == 0) ? c_yellow : c_white;
        draw_pause_text_transformed_outline(_screen_w / 2, (_screen_h / 2) - 30, text_0, option_scale, option_scale, color_0);
        
        // Opção 1: OPTIONS (Como Jogar)
        var text_1 = (selected == 1) ? "> OPTIONS <" : "OPTIONS";
        var color_1 = (selected == 1) ? c_yellow : c_white;
        draw_pause_text_transformed_outline(_screen_w / 2, (_screen_h / 2) + 15, text_1, option_scale, option_scale, color_1);
        
        // Opção 2: MENU
        var text_2 = (selected == 2) ? "> MENU <" : "MENU";
        var color_2 = (selected == 2) ? c_yellow : c_white;
        draw_pause_text_transformed_outline(_screen_w / 2, (_screen_h / 2) + 60, text_2, option_scale, option_scale, color_2);
        
        // Opção 3: SAIR
        var text_3 = (selected == 3) ? "> QUIT <" : "QUIT";
        var color_3 = (selected == 3) ? c_yellow : c_white;
        draw_pause_text_transformed_outline(_screen_w / 2, (_screen_h / 2) + 105, text_3, option_scale, option_scale, color_3);
        
        // Dica de navegação
        draw_set_font(fnt_game);
        draw_pause_text_outline(_screen_w / 2, (_screen_h / 2) + 160, "W/S: MOVE   |   ENTER: CONFIRM", c_silver);
    }
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_colour(-1);
}
