extends Node

@export var ominaisuudet: Node
@export var filePath = "res://data/taidot.txt"

@onready var separ: HSeparator = $Separ
@onready var yht: Label = $Yht


func alusta_taidot() -> void:
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
	var last = get_child_count()
	move_child(separ, -1)
	move_child(yht, -1)
	

func get_file_contents(file_path) -> String:
	return FileAccess.open(filePath, FileAccess.READ).get_as_text()

func on_clicked_ominaisuus(taito: HBoxContainer, action: String):
	prints(taito.nimi, action)
	if action == "increase":
		if taito.opittu:
			taito.arvo += 1
			if taito.arvo >= 11:
				yht.lisaa(-2)
			else:
				yht.lisaa(-1)
		else:
			taito.opittu = true
			yht.lisaa(-2)
	else:
		if taito.opittu:
			if taito.pohjaArvo == taito.arvo:
				taito.opittu = false
				yht.lisaa(2)
			else:
				taito.arvo -= 1
				if taito.arvo < 10:
					yht.lisaa(1)
				else: 
					yht.lisaa(2)
