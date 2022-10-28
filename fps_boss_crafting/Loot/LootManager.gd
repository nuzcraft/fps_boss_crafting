class_name LootManager

const skull = preload("res://Loot/Skull.tscn")

func _init():
	pass

func get_loot(name):
	if name == "zombie":
		return [skull, skull, skull]
#		return [skull]
