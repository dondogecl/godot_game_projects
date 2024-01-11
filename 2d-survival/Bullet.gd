extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	# calculate direction of rotation of bullet
	var direction = Vector2.RIGHT.rotated(rotation)
	# movement
	position += direction * SPEED * delta
	
	# destroys bullet if travelled distance is over the range
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	pass # Replace with function body.
