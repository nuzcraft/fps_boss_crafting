extends KinematicBody
class_name Player

signal add_effect
 
const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
 
onready var animationPlayer := $AnimationPlayer
onready var rayCast := $RayCast
onready var wandSprite := $CanvasLayer/Control/WandSprite

var inventory: Inventory
var wand: Weapon
var shotwand: Weapon
var machinewand: Weapon

var shootSound: int
var shootAnimation: String
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
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
		var coll = rayCast.get_collider()
		if rayCast.is_colliding():
			var coll_point = rayCast.get_collision_point()
			var coll_origin = coll.global_transform.origin
			var effect_position = Vector3(coll_point.x, coll_point.y, coll_origin.z)
			emit_signal("add_effect", "res://Player/Effect.tscn", effect_position)
			if coll.has_method("kill"):
				coll.kill()
			
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
