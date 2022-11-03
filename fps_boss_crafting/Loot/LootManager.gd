class_name LootManager

const loot = preload("res://Loot/Loot.tscn")
var rng = RandomNumberGenerator.new()

var droprates_dict = {}
var monster_drops = {}

var item_dict = {
	"eye": Item.EYE,
	"skull": Item.SKULL,
	"witch_hat": Item.WITCH_HAT
}

func _init():
	pass
	
func read_droprates_file():
	var file = File.new()
	file.open("res://Loot/DropRates.json", File.READ)
	droprates_dict = parse_json(file.get_as_text())
	
func get_monster_drops(name):
	monster_drops = droprates_dict[name]
	var current_sum = 0
	for drop in monster_drops:
		current_sum += monster_drops[drop]
		monster_drops[drop] = current_sum

func get_loot(name):
	
	read_droprates_file()
	get_monster_drops(name)
	
	rng.randomize()
	
	var loot_array = []
	
	for n in 3:
		var random_float = randf()
		for drop in monster_drops:
			if random_float <= monster_drops[drop]:
				var loot_inst = create_loot_instance(drop)
				loot_array.append(loot_inst)
				break
	return loot_array	
	
func create_loot_instance(drop_name):
	var item = Item.new(item_dict[drop_name])
	var loot_inst = loot.instance()
	loot_inst.set_item(item)
	return loot_inst
