rebate_count_wall = 0;

// 1. Verifica se a cor da bola é correspondente à do monstro
var cor_correta = scr_cor_correta(cor_bola, other.cor_monstro);

// 2. Resolve a colisão/rebote usando a função centralizada e robusta
scr_bounce_off_object(other);

// 3. Aplica destruição se a cor estiver correta
if (cor_correta)
{
    instance_destroy(other);
    
    global.pontuacao += 5;
    if (global.pontuacao > global.recorde)
    {
        global.recorde = global.pontuacao;
        salvar_record(global.recorde);
    }
}

// Som
audio_play_sound(snd_collision, 10, false);