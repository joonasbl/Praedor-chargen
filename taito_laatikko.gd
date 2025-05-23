extends HBoxContainer
class_name Taito
@onready var taitoNode: Label = $Taito
@onready var opittuNode: Label = $Opittu/Label
@onready var arvoNode: Label = $Arvo

var tausta_taito: bool = false
var pohjaArvo: int
var ominaisuudet: Node
var opittu: bool:
	set(val):
		opittu = val
		if val:
			opittuNode.text = ""
		else:
			opittuNode.text = ""

signal clicked_this(elem, click_action)

var arvo: int:
	set(val):
		arvo = val
		if arvoNode:
			arvoNode.text = str(arvo)
		
var nimi: String:
	set(val):
		nimi = val
		if taitoNode:
			taitoNode.text = nimi

var johtuu: String

const my_scene: PackedScene = preload("res://Taito.tscn")

func _ready() -> void:
	call_deferred("alusta")

func alusta():
	#await get_tree().create_timer(2.0).timeout
		#arvo = arvo
	nimi = nimi
	var om = get_om(johtuu)
	if om == 0:
		arvo = 6
	else:
		arvo = om/2
	pohjaArvo = arvo 
	opittu = tausta_taito

static func new_taito(t: String, a: int, j: String, o: Node, tausta: bool) -> Taito:
	var taito: Taito = my_scene.instantiate()
	taito.nimi = t
	taito.arvo = a
	taito.johtuu = j
	taito.ominaisuudet = o
	taito.tausta_taito = tausta

	return taito

func get_om(joht: String) -> int:
	for om in ominaisuudet.get_children():
		if om.name.to_lower().begins_with(joht):
			return om.arvo
	return 0


func _on_gui_input(event: InputEvent) -> void:
	if "button_index" in event:
		if event.button_index == 1 and event.pressed:
			clicked_this.emit(self, "increase")
		elif event.button_index == 2 and event.pressed:
			clicked_this.emit(self, "decrease")
