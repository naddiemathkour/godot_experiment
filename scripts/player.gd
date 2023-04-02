extends CharacterBody2D

@export var speed = 400

func get_input():
	if ($player.animation != "special_attack"):
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = input_direction * speed
	else:
		velocity = Vector2.ZERO

func _physics_process(delta):
	get_input()
	move_and_slide()
