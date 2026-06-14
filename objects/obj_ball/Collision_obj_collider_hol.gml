rebate_count_wall = 0;

global.vidas --;

if(global.vidas < 1)
{
    global.pontuacao = 0;

    global.vidas = 3;

    if (instance_exists(obj_control)) instance_destroy(obj_control);
    if (instance_exists(Obj_hub)) instance_destroy(Obj_hub);
    if (instance_exists(obj_player)) instance_destroy(obj_player);
    if (instance_exists(obj_screen_paused)) instance_destroy(obj_screen_paused);
    
    audio_pause_all();
    room_goto(Menu);
    audio_play_sound(snd_gameover, 10, false);
    
    instance_destroy(); // destrói a própria bola
}
else
{
    // destrói bola atual
    instance_destroy();

    // pega player
    var p = instance_find(obj_player, 0);

    // reseta estados do player
    p.pode_andar = true;

    p.atacando = false;

    p.sprite_index = spr_player_Stand;

    audio_play_sound(snd_lose, 10, false);
}