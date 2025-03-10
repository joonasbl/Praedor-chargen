extends VBoxContainer
class_name Taustat

signal my_tausta_vaihto(obj: Control)

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

func _on_tausta_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
