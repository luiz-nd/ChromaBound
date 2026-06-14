if (global.paused) exit;

if (keyboard_check_pressed(vk_enter)) {
    global.paused = !global.paused;
}
audio_play_sound(snd_pause,10,false);