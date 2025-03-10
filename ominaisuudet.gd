extends HBoxContainer

@onready var voima: MarginContainer = $Voima

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_heita_ominaisuudet_pressed() -> void:
	return
	var children = get_children()
	for child in children:
		child.randomize()

func lock():
	var children = get_children()
	for child in children:
		child.lock()

func check_is_ready() -> bool:
	var children = get_children()
	for child in children:
		if child.arvo < 3 or child.arvo > 20:
			return false
	return true
			
