extends Node

const SAVEGAME = "user://save.json"
var save_data = {}
var default_data = {
	"player_name" : "player",
	"selected_ip" : Network.DEFAULT_IP,
	"selected_port" : str(Network.DEFAULT_PORT),
}

func _ready():
	save_data = load_data()

func load_data():
	var file = File.new()
	_validate_data()
	file.open(SAVEGAME,File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data
	
	
func save_data(data:Dictionary=save_data)->void:
	var file = File.new()
	file.open(SAVEGAME, File.WRITE)
	file.store_line(to_json(data))
	file.close()

func _validate_data():
	var file = File.new()
	if not file.file_exists(SAVEGAME):
		save_data(default_data)
	file.open(SAVEGAME, File.READ)
	var data = parse_json(file.get_as_text())
	if data.keys() != default_data.keys():
		save_data(default_data)
	file.close()
	 
