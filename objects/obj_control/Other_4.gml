// quanso a room iniciar 

if(room == Fase1)

{
	
	//executa a musica da primeira fase
	audio_pause_sound(snd_background)//pausa oque está tocando e execulta
	snd_background = audio_play_sound(snd_background_level1,0,true);
}
else if (room = Fase2)
{
	//executa a musica da segunda fase 
	snd_background = audio_play_sound(snd_background_level2,0,true);
}
else if(room == Fase3)
{
	audio_pause_sound(snd_background)
	snd_background = audio_play_sound(snd_background_level3,0,true);
}

audio_sound_gain(snd_background ,0, 0);
	audio_sound_gain(snd_background, 0.75, 5000);