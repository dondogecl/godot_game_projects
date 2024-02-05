extends RigidBody3D

## vertical force vector
@export_range(700.0, 3000.0)
var thrust: float = 1000.0

## torque thrust
@export
var torque: float = 100.0

var next_level_file: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# movement (thrust)
	if Input.is_action_pressed("boost"):
		#position.y += delta
		apply_central_force(basis.y * delta * thrust)
		
	# rotation control	
	if Input.is_action_pressed("rotate_left"):
		#rotate_z(delta)
		apply_torque(Vector3(0.0, 0.0, torque * delta))
		
	if Input.is_action_pressed("rotate_right"):
		#rotate_z(-delta)
		apply_torque(Vector3(0.0, 0.0, -torque * delta))


func _on_body_entered(body: Node) -> void:
	# listens for signal when the Player gets in contact with another object
	if "Goal" in body.get_groups():
		complete_level(body.file_path)
	if "Outside" in body.get_groups():
		crash_sequence()

func crash_sequence():
	print("miau!")
	get_tree().reload_current_scene()
	
func complete_level(next_level_file: String):
	print("You survived!")
	get_tree().change_scene_to_file(next_level_file)
