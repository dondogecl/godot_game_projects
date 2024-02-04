extends RigidBody3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# movement (thrust)
	if Input.is_action_pressed("boost"):
		#position.y += delta
		apply_central_force(basis.y * delta * 1000.0)
		
	# rotation control	
	if Input.is_action_pressed("rotate_left"):
		#rotate_z(delta)
		apply_torque(Vector3(0.0, 0.0, 100.0 * delta))
		
	if Input.is_action_pressed("rotate_right"):
		#rotate_z(-delta)
		apply_torque(Vector3(0.0, 0.0, -100.0 * delta))
