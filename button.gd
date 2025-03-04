extends Button

signal button_sig
var idx 

func _pressed():
	button_sig.emit(idx)
