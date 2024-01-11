extends Area2D

func _physics_process(delta):
	# check overlappig with enemies
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		#aquire the first enemy of the array
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
