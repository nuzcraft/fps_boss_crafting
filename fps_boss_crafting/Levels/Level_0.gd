extends Spatial

const LOOT_EJECT_VELOCITY = 8

onready var player := $Player

var lootManager: LootManager
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	lootManager = LootManager.new()
	Events.connect("spawn_loot", self, "on_spawn_loot")
	player.connect("add_effect", self, "on_add_effect")

func on_spawn_loot(name, position):
	var loot_array = lootManager.get_loot(name)
	for loot_instance in loot_array:
#		var loot_instance = loot.instance()
		loot_instance.global_transform.origin = position
		loot_instance.velocity = loot_eject_direction() * LOOT_EJECT_VELOCITY
		add_child(loot_instance)

func loot_eject_direction():
	rng.randomize()
	var x = rng.randf_range(-1, 1)
	var z = rng.randf_range(-1, 1)
	var vector = Vector3(x, 1, z).normalized()
	return vector
	
func on_add_effect(file_location, position, rotation_y):
	var effect = load(file_location).instance()
	effect.global_transform.origin = position
#	effect.rotation.y = lerp_angle(effect.rotation.y, atan2(player.global_transform.origin.x, player.global_transform.origin.z ), 1 )
	effect.rotation.y = rotation_y
	add_child(effect)
