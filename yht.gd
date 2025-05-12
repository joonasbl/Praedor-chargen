extends Label
class_name Yht

var ika_ja_kokemus: bool = false
var nuori: bool = false

var maara = 100:
	set(val):
		maara = val
		text = "TP: " + str(val)

func lisaa(paljon: int):
	maara = maara + paljon

func on_check():
	print("on_checked")
	var edut = %Edut.selected
	var haitat = %haitat.selected
	var ika_check = false
	var nuori_check = false  

	if "Ikä ja kokemus" in edut and not ika_ja_kokemus:
		print("lisätään ikä ja kokemus")
		ika_ja_kokemus = true
		self.lisaa(20)
	elif "Ika ja kokemus" not in edut and ika_ja_kokemus:
		print("poistetaan ikä ja kokemus")
		ika_ja_kokemus = false
		self.lisaa(-20)
	if "Nuori" in haitat and not nuori:
		print("lisätään nuori")
		nuori = true
		self.lisaa(-30)
	elif "Nuori" not in haitat and nuori:
		print("poistetaan nuori")
		nuori = false
		self.lisaa(30)
