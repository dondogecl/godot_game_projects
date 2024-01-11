extends Area2D

func _physics_process(delta):
	# check overlappig with enemies
	var enemies_in_range = get_overlapping_bodies()

	if enemies_in_range.size() > 0:
		#aquire the first enemy of the array
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	# gets position of the shooting point (in gun)
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	# creates instance of a bullet
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
