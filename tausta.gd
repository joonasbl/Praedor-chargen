extends CheckBox



func _ready() -> void:
	self.toggled.connect(on_toggled)
	
func on_toggled(toggle: bool) -> void:
	if toggle:
		%Taustat.my_tausta_vaihto.emit(self)
