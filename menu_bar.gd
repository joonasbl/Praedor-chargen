extends MenuBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_file_id_pressed(id: int) -> void:
	print("id pressed: " + str(id)) # Replace with function body.
	if id == 2:
		get_tree().quit()


func _on_heita_ominaisuudet_pressed() -> void:
	pass # Replace with function body.
