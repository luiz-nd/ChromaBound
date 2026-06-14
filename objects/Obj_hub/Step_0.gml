// Evita executar ações se o jogo estiver pausado
if (global.paused) exit;


// Detecta pressionamentos de teclas
var tecla_vermelho = keyboard_check_pressed(ord("1"));
var tecla_azul     = keyboard_check_pressed(ord("2"));
var tecla_amarelo  = keyboard_check_pressed(ord("3"));

// ==========================================
// TECLA 1: VERMELHO
// ==========================================
if (tecla_vermelho)
{
    if (primeira_cor == noone)
    {
        primeira_cor = CORES.VERMELHO;
        image_index = 1; // 2ª sprite: Vermelho + sem cor
    }
    else if (primeira_cor == CORES.VERMELHO)
    {
        cor_ativa = CORES.VERMELHO;
        image_index = 3; // 4ª sprite: Vermelho + Vermelho
        primeira_cor = noone; // Mistura concluída
    }
    else if (primeira_cor == CORES.AZUL)
    {
        cor_ativa = CORES.ROXO;
        image_index = 11; // 12ª sprite: Azul + Vermelho
        primeira_cor = noone;
    }
    else if (primeira_cor == CORES.AMARELO)
    {
        cor_ativa = CORES.LARANJA;
        image_index = 15; // 16ª sprite: Amarelo + Vermelho
        primeira_cor = noone;
    }
}

// ==========================================
// TECLA 2: AZUL
// ==========================================
if (tecla_azul)
{
    if (primeira_cor == noone)
    {
        primeira_cor = CORES.AZUL;
        image_index = 4; // 5ª sprite: Azul + sem cor
    }
    else if (primeira_cor == CORES.AZUL)
    {
        cor_ativa = CORES.AZUL;
        image_index = 6; // 7ª sprite: Azul + Azul
        primeira_cor = noone;
    }
    else if (primeira_cor == CORES.VERMELHO)
    {
        cor_ativa = CORES.ROXO;
        image_index = 10; // 11ª sprite: Vermelho + Azul
        primeira_cor = noone;
    }
    else if (primeira_cor == CORES.AMARELO)
    {
        cor_ativa = CORES.VERDE;
        image_index = 13; // 14ª sprite: Amarelo + Azul
        primeira_cor = noone;
    }
}

// ==========================================
// TECLA 3: AMARELO
// ==========================================
if (tecla_amarelo)
{
    if (primeira_cor == noone)
    {
        primeira_cor = CORES.AMARELO;
        image_index = 7; // 8ª sprite: Amarelo + sem cor
    }
    else if (primeira_cor == CORES.AMARELO)
    {
        cor_ativa = CORES.AMARELO;
        image_index = 9; // 10ª sprite: Amarelo + Amarelo
        primeira_cor = noone;
    }
    else if (primeira_cor == CORES.VERMELHO)
    {
        cor_ativa = CORES.LARANJA;
        image_index = 14; // 15ª sprite: Vermelho + Amarelo
        primeira_cor = noone;
    }
    else if (primeira_cor == CORES.AZUL)
    {
        cor_ativa = CORES.VERDE;
        image_index = 12; // 13ª sprite: Azul + Amarelo
        primeira_cor = noone;
    }
}
