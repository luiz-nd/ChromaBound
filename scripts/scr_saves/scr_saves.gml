function salvar_record (recorde_atualizado){
	
	// salvando dados no arquivo ini, se não existir gamemaker vai criar um arquivo, se existir substituira  arqui 
	ini_open("savegame.ini")
	
	ini_write_real("player", "recorde", recorde_atualizado);
 
 
 ini_close()
}

function ler_record()
{
var recorde_salvo = 0;


if(file_exists("savegame.ini")){

	// Ler os dados do arquivo 
	ini_open("savegame.ini");
	
	recorde_salvo = ini_read_real("player", "recorde", 0);
	
	ini_close()
	
}

return recorde_salvo; 
	
}