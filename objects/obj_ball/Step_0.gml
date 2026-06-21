has_bounced = false;

if (saiu == false)
{
    x = obj_player.x;

    y = obj_player.y - sprite_height;

    speed = 0;

}
if (cooldown_rebate > 0)
{
    cooldown_rebate--;
}

// Altera dinamicamente a cor visual da bola via código usando cores muito mais vivas e saturadas
switch (cor_bola)
{
    case CORES.VERMELHO: image_blend = make_color_rgb(180, 0, 0); break;     // Vermelho mais Escuro
    case CORES.AZUL:     image_blend = make_color_rgb(0, 162, 255); break;   // Azul Celeste Vivo
    case CORES.AMARELO:  image_blend = make_color_rgb(255, 235, 0); break;   // Amarelo Limão Luminoso
    case CORES.ROXO:     image_blend = make_color_rgb(130, 0, 220); break;   // Roxo mais escuro / menos rosa
    case CORES.VERDE:    image_blend = make_color_rgb(0, 230, 0); break;     // Verde Vivo
    case CORES.LARANJA:  image_blend = make_color_rgb(255, 165, 0); break;   // Laranja mais Claro / Dourado
    default:             image_blend = c_white; break;                       // Sem cor / Branca
}
 