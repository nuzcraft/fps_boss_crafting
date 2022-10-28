extends Spatial

const LOOT_EJECT_VELOCITY = 8

var lootManager: LootManager
var rng = RandomNumberGenerator.new()

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
		loot_instance.velocity = loot_eject_direction() * LOOT_EJECT_VELOCITY
		add_child(loot_instance)

func loot_eject_direction():
	rng.randomize()
	var x = rng.randf_range(-1, 1)
	var z = rng.randf_range(-1, 1)
	var vector = Vector3(x, 1, z).normalized()
	return vector
