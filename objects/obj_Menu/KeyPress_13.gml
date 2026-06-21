
	global.recorde =ler_record()
	audio_play_sound(snd_shoot,0,false)

if(options_list == 1)
{
	if(option_selected == 0) options_list =2; 
	if(option_selected == 1) game_end();
}
else if (options_list == 2) 
{
	//Easy
	if(option_selected == 0) 
	{
	 global.speed_ball = 6
	 global.speed_player = 7
	 alarm[0] = 60;
	
	}
	
	//Hard
	else if (option_selected == 1) 
	{
	global.speed_ball = 7.5
	global.speed_player =  8.5
	 alarm[0] = 60;
	}
	//Very Hard
	else if(option_selected == 2)
	{
	global.speed_ball =  10
	global.speed_player = 11
	  alarm[0] = 60;
	}
	//Voltar para o Menu
	else if(option_selected == 3)
	{
		options_list = 1;
		option_selected = 0;
	}
}