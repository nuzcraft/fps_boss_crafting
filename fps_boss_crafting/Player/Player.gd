extends KinematicBody
class_name Player

signal add_effect
 
const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
const SHOTGUN_SPREAD = 2.5
const MACHINEGUN_SPREAD = 2.0
 
onready var animationPlayer := $AnimationPlayer
onready var rayCast := $GunRayContainer/RayCast
onready var shotgunRayContainer := $ShotgunRayContainer
onready var machinegunRayContainer := $MachinegunRayContainer
onready var wandSprite := $CanvasLayer/Control/WandSprite

var inventory: Inventory
var wand: Weapon
var shotwand: Weapon
var machinewand: Weapon

var shootSound: int
var shootAnimation: String

var rng = RandomNumberGenerator.new()
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	rng.randomize()
	inventory = Inventory.new()
	yield(get_tree(), "idle_frame")
	get_tree().call_group("enemies", "set_player", self)
	
	wand = Weapon.new(Weapon.WAND)
	shotwand = Weapon.new(Weapon.SHOTWAND)
	machinewand = Weapon.new(Weapon.MACHINEWAND)
	
	inventory.add_item(wand)
	inventory.add_item(shotwand)
	inventory.add_item(machinewand)	
	
	equip_weapon(wand)
 
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
 
func _process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		kill()
 
func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forward"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backward"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
 
	if Input.is_action_pressed("shoot") and !animationPlayer.is_playing():
		animationPlayer.play(inventory.get_equipped_weapon_animation_name())
		SoundPlayer.play_sound(inventory.get_equipped_weapon_sound())
		shoot_equipped_weapon(inventory.get_equipped_weapon())
			
	if Input.is_action_just_pressed("switch_weapon"):
		if inventory.get_equipped_weapon() == wand:
			equip_weapon(shotwand)
		elif inventory.get_equipped_weapon() == shotwand:
			equip_weapon(machinewand)
		else:
			equip_weapon(wand)
 
func kill():
	get_tree().reload_current_scene()	
	
func get_inventory():
	return inventory
	
func add_item_to_inventory(item: Item):
	inventory.add_item(item)
	
func equip_weapon(weapon: Weapon):
	inventory.equip_weapon(weapon)
	wandSprite.set_texture(inventory.get_equipped_weapon_texture())
	
func shoot_equipped_weapon(weapon: Weapon):
	if weapon == wand:
		var coll = rayCast.get_collider()
		if rayCast.is_colliding():
			var coll_point = rayCast.get_collision_point()
#			var coll_origin = coll.global_transform.origin
#			var effect_position = Vector3(coll_point.x, coll_point.y, coll_origin.z)
			var effect_position = coll_point
			var effect_rotation_y = lerp_angle(0, atan2(global_transform.origin.x, global_transform.origin.z ), 1)
			emit_signal("add_effect", "res://Player/Effect_Explosion_Sharp.tscn", effect_position, effect_rotation_y)
			if coll.has_method("kill"):
				coll.kill()
	elif weapon == shotwand:
		for ray in shotgunRayContainer.get_children():
			rng.randomize()
			ray.cast_to.x = rng.randf_range(SHOTGUN_SPREAD, -SHOTGUN_SPREAD)
			ray.cast_to.y = rng.randf_range(SHOTGUN_SPREAD, -SHOTGUN_SPREAD)
			var coll = ray.get_collider()
			if ray.is_colliding():
				var coll_point = ray.get_collision_point()
#				var coll_origin = coll.global_transform.origin
#				var effect_position = Vector3(coll_point.x, coll_point.y, coll_origin.z)
				var effect_position = coll_point
				var effect_rotation_y = lerp_angle(0, atan2(global_transform.origin.x, global_transform.origin.z ), 1)
				emit_signal("add_effect", "res://Player/Effect_GreenMagic.tscn", effect_position, effect_rotation_y)
				if coll.has_method("kill"):
					coll.kill()
	elif weapon == machinewand:
		for ray in machinegunRayContainer.get_children():
			rng.randomize()
			ray.cast_to.x = rng.randf_range(MACHINEGUN_SPREAD, -MACHINEGUN_SPREAD)
			ray.cast_to.y = rng.randf_range(MACHINEGUN_SPREAD, -MACHINEGUN_SPREAD)
			var coll = ray.get_collider()
			if ray.is_colliding():
				var coll_point = ray.get_collision_point()
#				var coll_origin = coll.global_transform.origin
#				var effect_position = Vector3(coll_point.x, coll_point.y, coll_origin.z)
				var effect_position = coll_point
				var effect_rotation_y = lerp_angle(0, atan2(global_transform.origin.x, global_transform.origin.z ), 1)
				emit_signal("add_effect", "res://Player/Effect_RedX.tscn", effect_position, effect_rotation_y)
				if coll.has_method("kill"):
					coll.kill()
