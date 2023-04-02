extends AnimatedSprite2D

@onready var animation_unlocked = true
@onready var player = get_parent().get_parent().get_node("player")
@onready var this_enemy = get_parent()

func run():
	var curr_vector:Vector2
	var player_distance:Vector2 = abs(player.position - this_enemy.position)

	if (animation_unlocked):
		play("run")
		if (player.position.x < this_enemy.position.x):
			flip_h = true
		elif (player.position.x > this_enemy.position.x):
			flip_h = false
	if(abs(player.position.x - this_enemy.position.x) < 25 && abs(player.position.y - this_enemy.position.y) < 5):
		play("basic_attack")
		animation_unlocked = false

func _physics_process(delta):
	run()

func _on_animation_finished():
	animation_unlocked = true
