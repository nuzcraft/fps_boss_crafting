extends KinematicBody

const MOVE_SPEED = 3

onready var rayCast := $RayCast
onready var animationPlayer := $AnimationPlayer

var player = null
var dead = false

func _ready():
	animationPlayer.play("walk")
	add_to_group("zombies")
	
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	
	var vec_to_player = player.translation - translation
	vec_to_player = vec_to_player.normalized()
	rayCast.cast_to = vec_to_player * 1.5
	
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if rayCast.is_colliding():
		var collider = rayCast.get_collider()
		if collider != null and collider.name == 'Player':
			collider.kill()
			
func kill():
	dead = true
	$CollisionShape.disabled = true
	animationPlayer.play("die")
	
	
func set_player(p):
	player = p
