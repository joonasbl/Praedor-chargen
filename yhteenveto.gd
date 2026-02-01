extends VBoxContainer

@export var ominaisuudet: Node

@onready var yhtOm: Node = %YhtOminaisuudet
@onready var veri_arvo_label: Label = %VeriArvoLabel
@onready var haava_arvo_label: Label = %HaavaArvoLabel
@onready var kanto_kyky_arvo_label: Label = %KantoKykyArvoLabel
@onready var vaurio_arvo_label: Label = %VaurioBonusArvoLabel


func alusta():
	for om in yhtOm.get_children():
		var arvo = get_om(om.name)
		var arvo_label : Label = om.get_node("Arvo")
		arvo_label.text = "%d" % [arvo]
	
	veri_arvo_label.text = "%d" % laske_veri(get_om("Terveys"))
	haava_arvo_label.text = "%d" % laske_syva_haava(get_om("Voima"), get_om("Terveys"))
	kanto_kyky_arvo_label.text = "%d" % laske_kantokyky(get_om("Voima"))
	var vauriobonus = laske_vauriobonus(get_om("Voima"))
	if vauriobonus > 0: 
		vaurio_arvo_label.text = "+%d" % vauriobonus
	else:
		vaurio_arvo_label.text = "%d" % vauriobonus
	
func get_om(om_nimi: String) -> int:
	for om in ominaisuudet.get_children():
		if om.name.to_lower().begins_with(om_nimi.to_lower()):
			return om.arvo
	return 0

func laske_veri(terveys: int) -> int:
	return 9 + ceil( (terveys / 2.0) + 0.5)

func laske_syva_haava(voima: int, terveys: int) -> int:
	var yht = voima + terveys
	if yht <= 10:
		return 5
	elif yht <= 17:
		return 6
	elif yht <= 24:
		return 7
	elif yht <= 31:
		return 8
	elif yht <= 38:
		return 9
	else:
		return 10

func laske_vauriobonus(voima: int) -> int:
	if voima <= 5:
		return -2
	elif voima <= 9:
		return -1
	elif voima <= 14:
		return 0
	elif voima <= 17:
		return 1
	elif voima <= 19:
		return 2
	else:
		return 3

func laske_kantokyky(voima: int) -> int:
	return 100 + voima * 20
