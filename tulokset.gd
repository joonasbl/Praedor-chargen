extends HBoxContainer



func _on_heita_ominaisuudet_pressed() -> void:
	var children = get_children()
	for child in children:
		child.queue_free()
	
	add_child(new_label("Heitot: "))
	
	for i in range(6):
		var label = new_label(str(my_randomize()))
		add_child(label)

func new_label(text) -> MarginContainer:
		var margin = MarginContainer.new()
		margin.add_theme_constant_override("margin_top", 6)
		margin.add_theme_constant_override("margin_left", 6)
		margin.add_theme_constant_override("margin_bottom", 6)
		margin.add_theme_constant_override("margin_right", 6)
		
		var label = Label.new()
		label.text = text 
		margin.add_child(label)
		return margin

func my_randomize() -> int:
	var rng = RandomNumberGenerator.new()
	var nums = []
	var numsum = 0
	for i in range(4):
		nums.append(rng.randi_range(1,6))
	nums.sort()
	nums.pop_at(0)
	numsum = nums.reduce(sum, 0)
	return numsum

func sum(accum, number):
	return accum + number
