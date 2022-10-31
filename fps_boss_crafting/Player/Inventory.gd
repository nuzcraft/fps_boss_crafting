class_name Inventory

var items = []

func _init():
	print("Inventory initialized")
	pass

func add_item(item: Item):
	items.append(item)
	
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
