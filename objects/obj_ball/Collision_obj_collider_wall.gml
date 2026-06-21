// Resolve a colisão/rebote usando a função centralizada e robusta
if (!has_bounced) {
    scr_bounce_off_object(other);
    has_bounced = true;
}

// som da colisão
audio_play_sound(snd_collision, 10, false);