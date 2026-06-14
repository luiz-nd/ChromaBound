// =========================================================================
// 1. CONFIGURAÇÕES QUE RODAM SEMPRE (MESMO SE O JOGO ESTIVER PAUSADO)
// =========================================================================

// Limita o Player dentro das bordas da tela
x = clamp(x, 32 , room_width-32);

// Atualização dinâmica da cor do Player baseada na HUD
if (instance_exists(Obj_hub)) 
{
    var cor_hub = Obj_hub.cor_ativa;

   switch (cor_hub)
    {
        case CORES.VERMELHO: image_blend = make_color_rgb(180, 0, 0);     break; // Vermelho mais Escuro
        case CORES.AMARELO:  image_blend = make_color_rgb(255, 235, 0);   break; // Amarelo Limão Luminoso
        case CORES.AZUL:     image_blend = make_color_rgb(0, 162, 255);   break; // Azul Celeste Vivo
        case CORES.VERDE:    image_blend = make_color_rgb(0, 230, 0);     break; // Verde Vivo
        case CORES.ROXO:     image_blend = make_color_rgb(130, 0, 220);   break; // Roxo mais escuro / menos rosa
        case CORES.LARANJA:  image_blend = make_color_rgb(255, 165, 0);   break; // Laranja mais Claro / Dourado
        default:             image_blend = c_white;                       break; // Padrão original
    }
}

// Interrompe o script aqui se o jogo estiver pausado
if (global.paused) exit;


// =========================================================================
// 2. SISTEMA DE MOVIMENTAÇÃO E ANIMAÇÃO
// =========================================================================
if (pode_andar)
{
    hsp = 0;

    // DIREITA
    if (keyboard_check(ord("D")))
    {
        hsp = movement_speed;

        // Evita trocar sprite durante outras animações
        if (!atacando && !puxando_arma)
        {
            if (com_arma)   sprite_index = Spr_Player_Walk_Pincel;
            else            sprite_index = Spr_Player_Normal_walk;
        }

        image_xscale = 1; // Olhando para a direita
    }

    // ESQUERDA
    if (keyboard_check(ord("A")))
    {
        hsp = -movement_speed;

        // Evita trocar sprite durante outras animações
        if (!atacando && !puxando_arma)
        {
            if (com_arma)   sprite_index = Spr_Player_Walk_Pincel;
            else            sprite_index = Spr_Player_Normal_walk;
        }

        image_xscale = -1; // Olhando para a esquerda (espelhado)
    }

    // Aplica o movimento final no eixo X
    x += hsp;

    // PARADO
    if (!keyboard_check(ord("A")) && !keyboard_check(ord("D")))
    {
        if (!atacando && !puxando_arma)
        {
            if (com_arma)   sprite_index = Spr_Player_Stand_Pincel;
            else            sprite_index = spr_player_Stand;
        }
    }
}


// =========================================================================
// 3. SISTEMA DE COMBATE / AÇÕES (ESPAÇO)
// =========================================================================

// PRIMEIRO ESPAÇO: Animação de puxar a arma
if (keyboard_check_pressed(vk_space) && !arma_pronta && !puxando_arma)
{
    pode_andar = false;
    puxando_arma = true;
    sprite_index = Spr_Player_TakeWeapon;
    image_index = 0;

    // Tempo de espera da animação terminar
    alarm[0] = room_speed;
}

// SEGUNDO ESPAÇO: Cria ou Lança a bola
if (keyboard_check_pressed(vk_space) && arma_pronta)
{
    if (!atacando) // Impede spam de ataques
    {
        atacando = true;
        sprite_index = Spr_Player_Attack;
        image_index = 0;

        // Se ainda não existe bola na tela, cria uma nova
        if (!instance_exists(obj_ball))
        {
            var b = instance_create_layer(x, y - 40, "Instances", obj_ball);
            b.saiu = true;
            b.speed = b.speed_ball;
            b.direction = 90;
            
            // Passa a cor atual da HUD para a bola recém-criada
            if (instance_exists(Obj_hub)) 
            {
                b.cor_bola = Obj_hub.cor_ativa;
            }
            else 
            {
                b.cor_bola = noone;
            }
        }
        else // Se a bola já existe, rebate se estiver perto
        {
            var b = instance_find(obj_ball, 0);

            if (point_distance(x, y, b.x, b.y) < 80)
            {
                with (b)
                {
                    var max_angle = 60;
                    var factor = (x - other.x) / (abs(other.sprite_width) / 2);
                    factor = clamp(factor, -1.0, 1.0);
                    direction = 90 - (factor * max_angle);
                    speed = speed_ball;
                    
                    // Atualiza a cor da bola com a cor ativa do Hub no momento do ataque
                    if (instance_exists(Obj_hub))
                    {
                        cor_bola = Obj_hub.cor_ativa;
                    }
                    
                    // Define o cooldown para evitar colisão física na sequência
                    cooldown_rebate = 8;
                }
            }
        }
    }
}


// =========================================================================
// 4. CONTROLE DE FINAL DE ANIMAÇÕES
// =========================================================================

// Terminou a animação de ataque?
if (sprite_index == Spr_Player_Attack)
{
    if (image_index >= image_number - 1)
    {
        atacando = false;

        // Retorna para a sprite de parado correta
        if (com_arma)   sprite_index = Spr_Player_Stand_Pincel;
        else            sprite_index = spr_player_Stand;
    }
}