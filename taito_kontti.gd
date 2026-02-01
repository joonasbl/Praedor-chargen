extends VFlowContainer

@onready var taidot_content: VFlowContainer = %TaidotContent

func alusta():
	var children = taidot_content.get_children()
	for child in children:
		if child is Taito:
			var box = HBoxContainer.new()
			var margin = MarginContainer.new()
			margin.add_theme_constant_override("margin_left", 20)
			var tn = Label.new()
			tn.text = "%s" % [child.nimi]
			var ta = Label.new()
			ta.text = "%d" % [child.arvo]
			ta.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			ta.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			box.add_child(margin)
			margin.add_child(tn)
			box.add_child(ta)
			add_child(box)
			
