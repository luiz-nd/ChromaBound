
id_snd = audio_play_sound(snd_menu, 0, true);

	audio_sound_gain(id_snd ,0.75, 0);
	audio_sound_gain(id_snd, 0.75, 1000)

options_list =1//	controla lista exibida no menu
option_selected = 0; // Relacionada a opção selecionada no Menu e_master = 100;

// Reseta o estado do jogo (vidas, pontuação e recorde) ao voltar para o menu
global.vidas = 3;
global.pontuacao = 0;
global.recorde = 0;
salvar_record(0);