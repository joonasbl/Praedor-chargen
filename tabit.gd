extends TabContainer

var tab_bar : TabBar
var progress:int  = 1
var yht:Label
signal taito_check

func _ready() -> void:
	tab_bar = get_tab_bar()
	for tabi in range(tab_bar.tab_count):
		tab_bar.set_tab_title(tabi, tab_bar.get_tab_title(tabi).replace("_", "/"))
		if tabi != 0:
			tab_bar.set_tab_hidden(tabi, true)
	yht = %TaidotContent.yht


func go_to_next():
	if progress == 1:
		var ominaisuudet = %Ominaisuudet
		if ominaisuudet.check_is_ready() and %Taustat.check_is_ready():
			%Taustat.lock()
			ominaisuudet.lock()
			_show_next_tab()
			select_next_available()
			get_tree().get_first_node_in_group("b1").queue_free()
			progress += 1
		else:
			var accept = %AcceptDialog
			accept.show()
	elif progress == 2:
		%TaidotContent.alusta_taidot()
		_show_next_tab()
		select_next_available()
		get_tree().get_first_node_in_group("b2").queue_free()

func _show_next_tab():
	for tabi in range(tab_bar.tab_count):
		if tabi >= progress+1:
			tab_bar.set_tab_hidden(tabi, true)
		else:
			tab_bar.set_tab_hidden(tabi, false)


func _on_tab_changed(tab: int) -> void:
	if tab == 2: # Taidot valittu
		taito_check.emit()
		print("tab changed to %d" % tab)
