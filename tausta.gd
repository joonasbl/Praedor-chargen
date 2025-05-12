extends CheckBox



func _ready() -> void:
	self.toggled.connect(on_toggled)
	
func on_toggled(toggle: bool) -> void:
	if toggle:
		%Taustat.my_tausta_vaihto.emit(self)

func get_skills():
	if name == "Aatelinen":
		return ["Heraldiikka", "Kilvet", "Ratsastus", "Uskonto", "Veitset", "Väistö"]
	elif name == "Ritari":
		return ["Heraldiikka", "Keihäät", "Kilvet", "Miekat", "Ratsastus", "Sotataito", "Väistö"]
	elif name == "Pappi":
		return ["Esiintyminen", "Haavojen hoito", "Historia", "Kilvet", "Lukutaito", "Uskonto", "Väistö"]
	elif name == "Porvari":
		return ["Esiintyminen", "Kaupanhieronta", "Kauppareitit", "Kilvet", "Lukutaito", "Veitset", 
		"Väistö"]
	elif name == "Kaupunkilainen":
		return ["Esiintyminen", "Ihmistuntemus", "Kadut ja kapakat", "Kaupanhieronta", "Kilvet", 
		"Kädentaidot", "Tappelu", "Veitset", "Väistö"]
	elif name == "Maalainen":
		return ["Haavojen hoito", "Kilvet", "Kädentaidot", "Lyömäaseet", "Tappelu", "Väistö"]
	elif name == "Irtolainen":
		return ["Haavojen hoito", "Hiivintä", "Kadut ja kapakat", "Kaupanhieronta", "Kilvet", 
		"Sorminäppäryys", "Tappelu", "Uhkapelit", "Väistö"]
	elif name == "Rosvojoukko":
		return ["Erätaidot", "Haavojen hoito", "Hiivintä", "Kilvet", "Kovistelu", "Lyömäaseet", 
		"Tappelu", "Uhkapelit", "Väistö"]
	elif name == "Paimentolainen":
		return ["Erätaidot", "Haavojen hoito", "Heittäminen", "Keihäät", "Kilvet", "Kirottu maa", 
		"Ratsastus", "Tarut ja legendat", "Väistö"]
	elif name == "Vuoristolainen":
		return ["Erätaidot", "Hyppy ja kiipeily", "Kilvet", "Kädentaidot", "Kovistelu", 
		"Lyömäaseet", "Tappelu", "Uimataito", "Väistö"]
	elif name == "Metsäläinen":
		return ["Erätaidot", "Hiivintä", "Jouset", "Kilvet", "Metsästys", "Sorminäppäryys", 
		"Veitset", "Väistö", "Yrtit ja myrkyt"]
