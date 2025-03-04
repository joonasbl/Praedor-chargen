extends VBoxContainer

@export var bottom: OptionButton
@export var filePath = ""
@export var optionScene: PackedScene
@export var painikkeet: Node
@export var add_button: Button

var options: Array[OptionButton]
var lines: PackedStringArray
var selected: Array[String]= []

var content: String

func _ready() -> void:
	content = get_file_contents(filePath)
	lines = content.split("\n", false)
	
	options.append(new_option())
	_init_option_button(options[0])
	add_button.pressed.connect(_on_add_button_pressed)
	
func _on_item_selected(id):
	selected.clear()
	for opt in options:
		var sel = opt.get_selected_id()
		var text = opt.get_item_text(sel)
		if text != "":
			selected.append(text)
	for opt in options:
		for item_i in range(opt.item_count):
			if opt.get_item_text(item_i) in selected:
				opt.set_item_disabled(item_i, true)
			else: 
				opt.set_item_disabled(item_i, false)
	print(selected)

func new_option() -> OptionButton:
	var option = optionScene.instantiate()
	painikkeet.add_child(option)
	var hbox = option.get_child(0)
	var option_button = hbox.get_child(0)
	var bin :Button = hbox.get_child(1)
	bin.idx = len(options)
	bin.button_sig.connect(_on_bin_clicked)
	
	return option_button

func get_file_contents(file_path):
	return FileAccess.open(filePath, FileAccess.READ).get_as_text()

func _on_bin_clicked(id):
	var removed = options[id]
	options.remove_at(id)
	_remove_option(id)
	_re_sort_opts()
	print(options)
	
func _init_option_button(option: OptionButton):
	option.add_item("")
	for line in lines:
		option.add_item(line)
	option.item_selected.connect(_on_item_selected)
	# Set disabled items
	for item_i in range(option.item_count):
		if option.get_item_text(item_i) in selected:
			option.set_item_disabled(item_i, true)
		else: 
			option.set_item_disabled(item_i, false)
	

func _on_add_button_pressed() -> void:
	var option = new_option()
	_init_option_button(option)
	options.append(option)

func _remove_option(id):
	prints("removing", id)
	var children = painikkeet.get_children()
	children[id].get_parent().remove_child(children[id])
	children[id].queue_free()


func _re_sort_opts():
	var children = painikkeet.get_children()
	for idx in range(len(children)):
		var trash: Button = children[idx].get_child(0).get_child(1)
		trash.idx = idx
		#trash.text = str(idx) DEBUG
