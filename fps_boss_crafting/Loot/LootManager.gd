class_name LootManager

const loot = preload("res://Loot/Loot.tscn")

func _init():
	pass

func get_loot(name):
	if name == "zombie":
		var skull_item = Item.new(Item.SKULL)
		var loot_inst = loot.instance()
		loot_inst.set_item(skull_item)
		var skull_item2 = Item.new(Item.SKULL)
		var loot_inst2 = loot.instance()
		loot_inst2.set_item(skull_item2)
		var eye_item = Item.new(Item.EYE)
		var loot_inst3 = loot.instance()
		loot_inst3.set_item(eye_item)
		return [loot_inst, loot_inst2, loot_inst3]
