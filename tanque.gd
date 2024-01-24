extends VehicleBody3D

@export var speed_angle = 0.02
@export var speed = 1.5

@export var debug = false

signal movido

func _physics_process(delta):

	var angle = 0
	var temp_speed = 0
	
	if Input.is_action_pressed("rotate_right"):
		angle = -speed_angle
	if Input.is_action_pressed("rotate_left"):
		angle = speed_angle
	if Input.is_action_pressed("move_forward"):
		temp_speed = speed
	if Input.is_action_pressed("move_back"):
		temp_speed = -speed

	if angle != 0:
		$Pivot.rotate_y(angle)
		#steering = steering + angle
		movido.emit()

#	velocity.z = -sin($Pivot.rotation.y) * temp_speed
#	velocity.x = cos($Pivot.rotation.y) * temp_speed
	if temp_speed != 0:
		linear_velocity.z += -sin($Pivot.rotation.y) * temp_speed
		linear_velocity.x += cos($Pivot.rotation.y) * temp_speed
		angular_velocity = Vector3.ZERO
		movido.emit()
#	for index in range(get_slide_collision_count()):
#		if index == 0:
#			continue
#		# We get one of the collisions with the player
#		var collision = get_slide_collision(index)
#		if collision.get_collider().is_in_group("balls"):
#			print("Pateando pelota:", index)
#			var ball = collision.get_collider()
#			
#	move_and_slide()
	if linear_velocity.length()>0:
		movido.emit()


func _on_movido():
	if debug:
		print(engine_force, " ; ", steering, " ; ", linear_velocity.length())
#		print("Tanque:", position, " ; ", rotation)
#		print("$Pivot:", $Pivot.position, " ; ", $Pivot.rotation)
#		print("$Pivot/Mesh:", $Pivot/Tanque.position, " ; ", $Pivot/Tanque.rotation)
