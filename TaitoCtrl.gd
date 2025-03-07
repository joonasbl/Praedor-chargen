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
		t.clicked_this.connect(on_clicked_ominaisuus)
		counter+=1
	
func get_file_contents(file_path) -> String:
	return FileAccess.open(filePath, FileAccess.READ).get_as_text()

func on_clicked_ominaisuus(taito: HBoxContainer, action: String):
	prints(taito.nimi, action)
	if action == "increase":
		if taito.opittu:
			taito.arvo += 1
		else:
			taito.opittu = true
	else:
		if taito.opittu:
			if taito.pohjaArvo == taito.arvo:
				taito.opittu = false
			else:
				taito.arvo -= 1
