class_name LootManager

const skull = preload("res://Loot/Skull.tscn")

func _init():
	pass

func get_loot(name):
	if name == "zombie":
		var skull_item = Item.new(Item.SKULL)
		var skull_inst = skull.instance()
		skull_inst.set_item(skull_item)
		var skull_item2 = Item.new(Item.SKULL)
		var skull_inst2 = skull.instance()
		skull_inst2.set_item(skull_item2)
		var skull_item3 = Item.new(Item.SKULL)
		var skull_inst3 = skull.instance()
		skull_inst3.set_item(skull_item3)
		return [skull_inst, skull_inst2, skull_inst3]
