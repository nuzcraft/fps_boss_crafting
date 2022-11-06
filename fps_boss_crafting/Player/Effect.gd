extends Sprite3D

onready var animationPlayer := $AnimationPlayer

func _physics_process(delta):
	yield(animationPlayer, "animation_finished")
	queue_free()
