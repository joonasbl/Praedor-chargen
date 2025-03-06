@tool
extends MarginContainer


@onready var arvoNode: Label = $Ominaisuus/Arvo
@onready var nimi: Label = $Ominaisuus/Nimi

var arvo: int:
	set(val): 
		arvo = val
		arvoNode.text = str(arvo)
	get: return arvo

@export var om_nimi = "voima"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nimi.text = om_nimi
	arvo = 9


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
	
