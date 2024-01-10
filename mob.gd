extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	# calculates the direction to the player
	var direction = global_position.direction_to(
		player.global_position
	)
	# velocity of the mob
	velocity = direction * 300.0
	move_and_slide()
