extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

# adjustable speed parameter
@export var speed = 15000.0
var health = 3

func _ready():
	# walk animation
	%Slime.play_walk()

func _physics_process(delta):
	# calculates the direction to the player
	var direction = global_position.direction_to(
		player.global_position
	)
	
	
	# velocity of the mob
	velocity = direction * speed * delta
	move_and_slide()

func take_damage():
	# triggered when mob receives an attack (signal)
	health -= 1
	# damage animation
	%Slime.play_hurt()
	if health == 0:
		queue_free()
		# prepare explosion animation
		const SMOKE_SCENE = preload(
			"res://smoke_explosion/smoke_explosion.tscn"
			)
		var smoke = SMOKE_SCENE.instantiate()
		# instantiate smoke as children of the parent node 
		# (sibling of mob)
		get_parent().add_child(smoke)
		# position the smoke
		smoke.global_position = global_position
