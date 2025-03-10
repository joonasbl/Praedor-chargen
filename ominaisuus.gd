@tool
extends MarginContainer
class_name ominaisuus

@onready var arvoNode: LineEdit = $Ominaisuus/HBoxContainer/Arvo
@onready var nimi: Label = $Ominaisuus/Nimi
@onready var bonusNode: Label = $Ominaisuus/HBoxContainer/Bonus

var bonus:int:
	set(val):
		bonus = val
		if val > 0:
			bonusNode.text = "+" + str(bonus)
		else:
			bonusNode.text = ""
var arvo: int:
	set(val): 
		arvo = val
		arvoNode.text = str(arvo)
	get: return arvo

@export var om_nimi = "voima"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nimi.text = om_nimi
	arvo = 0


func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		nimi.text = om_nimi

func sum(accum, number):
	return accum + number


func randomize() -> void:
	var rng = RandomNumberGenerator.new()
	var nums = []
	var numsum = 0
	for i in range(4):
		nums.append(rng.randi_range(1,6))
	nums.sort()
	nums.pop_at(0)
	numsum = nums.reduce(sum, 0)
	
	print(nimi.text + ": " + str(numsum))
	arvo = numsum
	

func lock():
	var confirm = ConfirmationDialog
	arvoNode.editable = false

func _on_arvo_focus_exited() -> void:
	var checkVal = arvoNode.text
	arvo = int(checkVal)
	pass # Replace with function body.
