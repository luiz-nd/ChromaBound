global.delay_itens = false;
alarme_chamado = false; 
/*
Foi criado uma var dela_itens inicialmente igual a F( no inicio jogo obj_control)
no src_colisao... verifica se vai ser F se não for quer dizer que não foi reproduzido
o delay, o jogo vai tentar sortiar algum item, se ele sortiar algum item a var vai ser V
o obj_control no Etapa vai ser sempre verdadeira, se em algum momento ela se tornar V 
e não foi chamdo um alarme  ele cai dentro do condicinal e o alarme vai ser chamado apos 10s
no obj_control, como o alarme vai ser execultado após 10s o alarme chamado é igual true 
*/