extends Label
class_name Yht

var maara = 100:
	set(val):
		maara = val
		text = "TP: " + str(val)

func lisaa(paljon: int):
	maara = maara + paljon
