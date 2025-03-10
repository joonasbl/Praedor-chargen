extends HBoxContainer

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

func _on_taustan_vaihto(tausta: Control) -> void:
	reset_bonuses()
	var tooltip = tausta.tooltip_text
	var bonukset = tooltip.split("\n")[0]
	if "1" in bonukset or "2" in bonukset:
		for bonus in bonukset.split(","):
			bonus = bonus.lstrip(" ").rstrip(" ")
			var bonus_split = bonus.split(" ")
			add_bonus_to(bonus_split[0], int(bonus_split[1]))

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

func add_bonus_to(taito: String, bonus: int):
	var children = get_children()
	for child in children:
		if child.nimi.text.to_lower() == taito.to_lower():
			child.bonus = bonus

func reset_bonuses():
	var children = get_children()
	for child in children:
		child.bonus = 0
