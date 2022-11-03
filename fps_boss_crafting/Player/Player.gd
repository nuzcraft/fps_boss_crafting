extends KinematicBody
class_name Player
 
const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
 
onready var animationPlayer := $AnimationPlayer
onready var rayCast := $RayCast
onready var audioPlayers := $AudioPlayers

var inventory: Inventory
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	inventory = Inventory.new()
	yield(get_tree(), "idle_frame")
	get_tree().call_group("enemies", "set_player", self)
 
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
#		animationPlayer.play("shoot")
#		SoundPlayer.play_sound(SoundPlayer.GUNSHOT)
#		animationPlayer.play("machinegun shoot")
#		SoundPlayer.play_sound(SoundPlayer.MACHINEGUN)
		animationPlayer.play("shotgun shoot")
		SoundPlayer.play_sound(SoundPlayer.SHOTGUN)
		var coll = rayCast.get_collider()
		if rayCast.is_colliding() and coll.has_method("kill"):
			coll.kill()
 
func kill():
	get_tree().reload_current_scene()	
	
func get_inventory():
	return inventory
	
func add_item_to_inventory(item: Item):
	inventory.add_item(item)
