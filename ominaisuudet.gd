extends HBoxContainer

@onready var voima: MarginContainer = $Voima

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_heita_ominaisuudet_pressed() -> void:
	var children = get_children()
	for child in children:
		child.randomize()
