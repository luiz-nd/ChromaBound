// -------------------------------------------------------------
// LÓGICA DE CONTROLE DO PAUSE (SALVAR/RESTAURAR ESTADOS E INPUT)
// -------------------------------------------------------------
if (global.paused)
{
    // Inicializar variável de seleção se não existir
    if (!variable_instance_exists(id, "option_selected")) {
        option_selected = 0;
    }
    
    // Inicializar estado do subsetup de opções se não existir
    if (!variable_instance_exists(id, "options_menu_active")) {
        options_menu_active = false;
    }
    
    // Pausar velocidades físicas e animações de todas as instâncias (exceto este objeto de pause)
    with (all) {
        if (id != other.id) {
            // Salvar e parar velocidade física
            if (speed != 0 && !variable_instance_exists(id, "saved_speed")) {
                saved_speed = speed;
                speed = 0;
            }
            // Salvar e parar animação
            if (image_speed != 0 && !variable_instance_exists(id, "saved_image_speed")) {
                saved_image_speed = image_speed;
                image_speed = 0;
            }
        }
    }
    
    // Evitar que o input que pausou o jogo seja processado no mesmo frame (evita despausar instantaneamente)
    var just_paused = false;
    if (!variable_instance_exists(id, "was_paused") || !was_paused) {
        was_paused = true;
        just_paused = true;
    }
    
    if (!just_paused)
    {
        if (options_menu_active) 
        {
            // Se a tela de opções estiver ativa, qualquer tecla Enter ou Esc volta ao menu anterior
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)) {
                options_menu_active = false;
                audio_play_sound(snd_collision, 0, false);
                keyboard_clear(vk_enter);
                keyboard_clear(vk_escape);
            }
        }
        else 
        {
            // Ler inputs de navegação no menu de pausa normal
            if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) {
                option_selected -= 1;
                if (option_selected < 0) option_selected = 3; // 0: Continuar, 1: Options, 2: Menu, 3: Sair
                audio_play_sound(snd_collision, 0, false);
            }
            if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)) {
                option_selected += 1;
                if (option_selected > 3) option_selected = 0;
                audio_play_sound(snd_collision, 0, false);
            }
            
            // Confirmar opção
            if (keyboard_check_pressed(vk_enter)) {
                if (option_selected == 0) {
                    global.paused = false;
                    keyboard_clear(vk_enter);
                    audio_play_sound(snd_pause, 10, false);
                }
                else if (option_selected == 1) {
                    options_menu_active = true;
                    audio_play_sound(snd_shoot, 0, false);
                    keyboard_clear(vk_enter);
                }
                else if (option_selected == 2) {
                    global.paused = false;
                    audio_stop_all();
                    
                    // Destruir objetos persistentes do jogo para evitar que fiquem ativos na tela de menu
                    if (instance_exists(obj_control)) instance_destroy(obj_control);
                    if (instance_exists(Obj_hub)) instance_destroy(Obj_hub);
                    if (instance_exists(obj_player)) instance_destroy(obj_player);
                    if (instance_exists(obj_ball)) instance_destroy(obj_ball);
                    
                    room_goto(Menu);
                    instance_destroy(); // Destrói o próprio obj_screen_paused
                    keyboard_clear(vk_enter);
                }
                else if (option_selected == 3) {
                    game_end();
                }
            }
        }
    }
}
else
{
    was_paused = false;
    options_menu_active = false; // Garante que fecha a tela de opções ao voltar ao jogo
    // Se o jogo NÃO está pausado, restaurar velocidades e animações
    with (all) {
        if (variable_instance_exists(id, "saved_speed") && saved_speed != undefined) {
            speed = saved_speed;
            saved_speed = undefined;
        }
        if (variable_instance_exists(id, "saved_image_speed") && saved_image_speed != undefined) {
            image_speed = saved_image_speed;
            saved_image_speed = undefined;
        }
    }
}
