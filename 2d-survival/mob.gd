extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

# adjustable speed parameter
@export var speed = 15000.0

func _physics_process(delta):
	# calculates the direction to the player
	var direction = global_position.direction_to(
		player.global_position
	)
	
	
	# velocity of the mob
	velocity = direction * speed * delta
	move_and_slide()
