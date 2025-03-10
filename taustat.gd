extends VBoxContainer

func check_is_ready():
	for child in get_children():
		if child.is_class("CheckBox"):
			if child.button_pressed:
				return true
			
	return false

func lock():
	for child in get_children():
		if child.is_class("CheckBox"):
			child.disabled = true
