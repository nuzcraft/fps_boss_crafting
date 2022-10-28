extends Spatial


var lootManager: LootManager

# Called when the node enters the scene tree for the first time.
func _ready():
	lootManager = LootManager.new()
	Events.connect("spawn_loot", self, "on_spawn_loot")


func on_spawn_loot(name, position):
	print(name, position)
	var loot_array = lootManager.get_loot(name)
	for loot in loot_array:
		var loot_instance = loot.instance()
		loot_instance.global_transform.origin = position
		add_child(loot_instance)
