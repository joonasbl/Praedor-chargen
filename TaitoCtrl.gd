extends Node

@export var ominaisuudet: Node
@export var filePath = "res://data/taidot.txt"

func _ready() -> void:
	var content = get_file_contents(filePath)
	var lines = content.split("\n", false)
	var counter = 0
	for line in lines:
		if counter == 100:
			break
		var data = line.split(",", false, 1)
		var taitonimi = data[0]
		var t = Taito.new_taito(data[0], 12, data[1], ominaisuudet)
		add_child(t)
		counter+=1
	
func get_file_contents(file_path) -> String:
	return FileAccess.open(filePath, FileAccess.READ).get_as_text()
