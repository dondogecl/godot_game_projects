extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left","move_right","move_up","move_down"
		)
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		#get_node gets access to another node's code
		# $HappyBoo full path %HappyBoo Unique Name in scene
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	# danage from enemies each second
	const DAMAGE_RATE = 5.0
	# detect mobs tht get in touch with player
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		print(health)
		if health <= 0.0:
			health_depleted.emit()
