extends KinematicBody

const GRAVITY = 18
const FRICTION = 6


var velocity = Vector3.ZERO

func _physics_process(delta):
	apply_gravity(delta)
	apply_friction(delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	
func apply_gravity(delta):
	velocity.y -= GRAVITY * delta
	
func apply_friction(delta):
	velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	velocity.z = move_toward(velocity.z, 0, FRICTION * delta)
