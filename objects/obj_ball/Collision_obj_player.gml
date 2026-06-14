if (saiu == false) exit;

// 1. Evita múltiplas alterações de direção seguidas
if (cooldown_rebate > 0) exit;

// 2. Resolve overlap first so the ball never sticks to the player
while (place_meeting(x, y, other))
{
    y -= 2;
}
if (y > other.bbox_top - 8) {
    y = other.bbox_top - 8;
}

rebate_count_wall = 0;

// 3. Rebate baseado na posição (suave e limitado para evitar ângulos muito horizontais)
var max_angle = 60; // Desvio máximo de 60 graus a partir da vertical (90 graus)
var factor = (x - other.x) / (abs(other.sprite_width) / 2);
factor = clamp(factor, -1.0, 1.0);
direction = 90 - (factor * max_angle);

// Atualiza a velocidade da bola com base no valor global (dificuldade)
speed_ball = global.speed_ball;
speed = speed_ball;

// Pequeno cooldown
cooldown_rebate = 8;

// Som
audio_play_sound(snd_collision, 10, false);

// Atualiza a cor da bola com a cor ativa do Hub no momento do rebote
show_debug_message("COLISAO PLAYER: cor_bola antes = " + string(cor_bola));
if (instance_exists(Obj_hub))
{
    cor_bola = Obj_hub.cor_ativa;
    show_debug_message("COLISAO PLAYER: cor_bola depois = " + string(cor_bola));
}
else
{
    show_debug_message("COLISAO PLAYER: Obj_hub nao encontrado na sala!");
}

// Animação do player
if (!other.atacando)
{
    other.atacando = true;
    other.sprite_index = Spr_Player_Attack;
    other.image_index = 0;
}