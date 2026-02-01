extends MenuBar



func _on_file_id_pressed(id: int) -> void:
	print("id pressed: " + str(id)) # Replace with function body.
	if id == 2:
		get_tree().quit()
