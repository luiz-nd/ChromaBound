function scr_colisao_blocos(){
	//Rebateu a bola s
	if(global.rebate_bola == true) move_bounce_all(true);
	
	//Destruiu bloco
	instance_destroy(other);
	
	//Somar pontos
	global.pontuacao += 5; // deixa randomico <irandom_range(1,3)>
	
	//Verificar e Atualizar o Recorde
	if(global.pontuacao > global.recorde )
	{
		global.recorde = global.pontuacao; 
		salvar_record(global.recorde);
	}
}

/*function scr_sorteio_powerup()
{
	if(global.delay_itens == false)
	{
		randomize();// deixa randomico 
		
		var sorteio_item1 = irandom_range(1,15);
		var sorteio_item2 = irandom_range(1,20);
		var sorteio_item3 = irandom_range(1,26);
		
		if(sorteio_item1 == 1)
		{
			global.delay_itens = true; 
			instance_create_layer(x,y, "instances", obj_item_powerup);
			audio_play_sound(snd_item_powerup, 10, false);
		}
		else if (sorteio_item2 == 1)
		{
			global.delay_itens = true; 
			instance_create_layer(x,y, "instances", obj_item_powerup_down);
			audio_play_sound(snd_item_powerup, 10, false);	
		}
		else if (sorteio_item3 == 1)
		{
			global.delay_itens = true; 
			instance_create_layer(x,y, "instances", obj_item_powerup_ball);
			audio_play_sound(snd_item_powerup, 10, false);	
		}
	}
}
*/

/// @function scr_bounce_off_object(rect)
/// @description Resolve a colisão física da bola com um retângulo (bloco ou parede) e previne que ela grude ou fique em ângulos mortos, tratando quinas.
function scr_bounce_off_object(rect) {
    // Resolve a colisão usando a distância entre o centro da bola e o ponto mais próximo do bloco
    var _nearest_x = clamp(x, rect.bbox_left, rect.bbox_right);
    var _nearest_y = clamp(y, rect.bbox_top, rect.bbox_bottom);

    var _dx = x - _nearest_x;
    var _dy = y - _nearest_y;

    // Verifica se colidiu exatamente com uma das quatro quinas do bloco
    var hit_corner = (_nearest_x == rect.bbox_left || _nearest_x == rect.bbox_right) && 
                     (_nearest_y == rect.bbox_top || _nearest_y == rect.bbox_bottom);

    if (hit_corner && (_dx != 0 || _dy != 0)) {
        // Calcula o ângulo da quina em direção ao centro da bola (vetor normal)
        var normal_angle = point_direction(_nearest_x, _nearest_y, x, y);
        
        // Empurra a bola para fora da quina (raio da bola + margem extra para garantir descolamento)
        var radius = (bbox_right - bbox_left) / 2;
        x = _nearest_x + lengthdir_x(radius + 2, normal_angle);
        y = _nearest_y + lengthdir_y(radius + 2, normal_angle);
        
        // Reflete a direção da bola com base no ângulo da quina
        direction = (2 * normal_angle) - direction - 180;
        
        // Garante que o vetor resultante esteja se afastando da quina (produto escalar positivo)
        var dot = dot_product(hspeed, vspeed, lengthdir_x(1, normal_angle), lengthdir_y(1, normal_angle));
        if (dot < 0) {
            hspeed = -hspeed;
            vspeed = -vspeed;
        }
    } else {
        // Colisão padrão com as faces planas (laterais, topo ou base)
        if (_dx != 0 || _dy != 0) {
            if (abs(_dx) > abs(_dy)) {
                // Colisão horizontal nas laterais
                if (_dx > 0) {
                    hspeed = abs(hspeed); // Vai para a direita
                    x = rect.bbox_right + (x - bbox_left) + 2;
                } else {
                    hspeed = -abs(hspeed); // Vai para a esquerda
                    x = rect.bbox_left - (bbox_right - x) - 2;
                }
            } else {
                // Colisão vertical no topo ou base
                if (_dy > 0) {
                    vspeed = abs(vspeed); // Vai para baixo
                    y = rect.bbox_bottom + (y - bbox_top) + 2;
                } else {
                    vspeed = -abs(vspeed); // Vai para cima
                    y = rect.bbox_top - (bbox_bottom - y) - 2;
                }
            }
        } else {
            // Se a bola estiver 100% sobreposta ao centro do bloco
            if (abs(hspeed) > abs(vspeed)) {
                if (hspeed > 0) {
                    hspeed = -abs(hspeed);
                    x = rect.bbox_left - (bbox_right - x) - 2;
                } else {
                    hspeed = abs(hspeed);
                    x = rect.bbox_right + (x - bbox_left) + 2;
                }
            } else {
                if (vspeed > 0) {
                    vspeed = -abs(vspeed);
                    y = rect.bbox_top - (bbox_bottom - y) - 2;
                } else {
                    vspeed = abs(vspeed);
                    y = rect.bbox_bottom + (y - bbox_top) + 2;
                }
            }
        }
    }

    // 2. Previne ângulos mortos (muito horizontais ou muito verticais) para deixar a direção mais fluida
    var angle = direction % 360;
    if (angle < 0) angle += 360;

    // Evita ângulos muito horizontais
    if (abs(angle - 0) < 15 || abs(angle - 360) < 15) {
        if (vspeed < 0) direction = 15; else direction = 345;
    } else if (abs(angle - 180) < 15) {
        if (vspeed < 0) direction = 165; else direction = 195;
    }

    // Evita ângulos muito verticais
    if (abs(angle - 90) < 5) {
        if (hspeed > 0) direction = 85; else direction = 95;
    } else if (abs(angle - 270) < 5) {
        if (hspeed > 0) direction = 275; else direction = 265;
    }
}