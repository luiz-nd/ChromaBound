if(!instance_exists(obj_block_blue)&& !instance_exists(obj_block_purple)
 && !instance_exists(obj_block_green) && !instance_exists(obj_block_orange) 
 && !instance_exists(obj_block_red) && !instance_exists(obj_block_yellow))// se não existir "!" obj_...
{
	if (room != Fase6)
	{
		if (global.vidas == 1)
		global.vidas ++;
		alarm [1] = 60;
	{
	
	}
		
     room_goto_next()//passa para a proxima room 
	}
	
	else
	{
        // Desativa a persistência para que nenhum objeto de gameplay permaneça na tela de agradecimentos
        if (instance_exists(obj_control)) obj_control.persistent = false;
        if (instance_exists(Obj_hub)) Obj_hub.persistent = false;
        if (instance_exists(obj_player)) obj_player.persistent = false;
        if (instance_exists(obj_ball)) obj_ball.persistent = false;
        if (instance_exists(obj_screen_paused)) obj_screen_paused.persistent = false;
        
        audio_stop_all();
        room_goto(TelaFinal);
	}
	audio_sound_gain(snd_background ,0.75, 0);
	audio_sound_gain(snd_background, 0, 1000);
	audio_play_sound(snd_levelup, 10, false);
}
if( global.delay_itens = true and !alarme_chamado)
{
	alarme_chamado = true; 
	alarm[0] = 60*8; 
}
show_debug_message(global.delay_itens)

// Movimentação lateral lenta para os monstros amarelo e laranja (apenas quando não pausado)
if (!global.paused) {
    var lvl = 1;
    if (room == Fase2) lvl = 2;
    else if (room == Fase3) lvl = 3;
    else if (room == Fase4) lvl = 4;
    else if (room == Fase5) lvl = 5;
    else if (room == Fase6) lvl = 6;
    
    // Multiplicador de velocidade com base na dificuldade (global.speed_ball)
    var diff_mult = 1.0;
    if (global.speed_ball == 7.5) diff_mult = 1.5;      // Hard
    else if (global.speed_ball >= 9) diff_mult = 2.0;    // Very Hard
    
    var lvl_speed = (1.0 + (lvl - 1) * 0.2) * diff_mult; // Aumenta a velocidade suavemente por nível e escala com a dificuldade

    with (obj_block_yellow) {
        if (!variable_instance_exists(id, "dir_move")) {
            dir_move = 1; // 1 = direita, -1 = esquerda
        }
        velocidade = lvl_speed;
        
        x += dir_move * velocidade;
        
        var left_limit = sprite_xoffset;
        var right_limit = room_width - (sprite_width - sprite_xoffset);
        
        if (x >= right_limit) {
            x = right_limit;
            dir_move = -1;
        } else if (x <= left_limit) {
            x = left_limit;
            dir_move = 1;
        }
        
	}
    
    with (obj_block_orange) {
        if (!variable_instance_exists(id, "dir_move")) {
            dir_move = 1; // 1 = direita, -1 = esquerda
        }
        velocidade = lvl_speed;
        
        x += dir_move * velocidade;
        
        var left_limit = sprite_xoffset;
        var right_limit = room_width - (sprite_width - sprite_xoffset);
        
        if (x >= right_limit) {
            x = right_limit;
            dir_move = -1;
        } else if (x <= left_limit) {
            x = left_limit;
            dir_move = 1;
        }
    }
}

// Controle de ativação do pause
if (keyboard_check_pressed(vk_enter)) {
    if (!global.paused) {
        global.paused = true;
        audio_play_sound(snd_pause, 10, false);
        if (!instance_exists(obj_screen_paused)) {
            instance_create_layer(0, 0, "Instances", obj_screen_paused);
        }
    }
}