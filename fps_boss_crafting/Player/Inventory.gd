class_name Inventory

var items = []
var weapons = []

func _init():
	pass

func add_item(item: Item):
	items.append(item)
	if item is Weapon:
		weapons.append(item)
	
func remove_item(item: Item):
	var index = items.find(item)
	if index == -1: # find item by name if necessary
		for i in items:
			if i.get_name() == item.get_name():
				index = items.find(i)
				break
	if not index == -1:
		items.remove(index)	

func get_items():
	return items
	
func get_weapons():
	return weapons
	
func equip_weapon(weapon: Weapon):
	var index = weapons.find(weapon)
	if index == -1: # find weapon by name if necessary
		for w in weapons:
			if w.get_name() == weapon.get_name():
				index = weapons.find(w)
				break
	if not index == -1:
		weapon = weapons[index]
		for w in weapons:
			if w == weapon:
				w.equip()
			else:
				w.dequip()
				
func get_equipped_weapon():
	for w in weapons:
		if w.is_equipped():
			return w
			
func get_equipped_weapon_sound():
	return get_equipped_weapon().get_sound()
	
func get_equipped_weapon_animation_name():
	return get_equipped_weapon().get_animation_name()
	
func get_equipped_weapon_texture():
	return get_equipped_weapon().get_texture()
