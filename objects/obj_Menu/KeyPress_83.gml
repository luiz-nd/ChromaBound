option_selected += 1;

if(options_list == 1)
{
	if(option_selected == 2) option_selected  = 1;	
	else audio_play_sound(snd_collision,0,false)
}
else if (options_list  == 2)
{
	if(option_selected == 4) option_selected = 3; 
	else audio_play_sound(snd_collision,0,false)
}