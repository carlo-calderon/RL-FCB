extends VehicleBody3D

const STEER_SPEED = 1.5
const STEER_LIMIT = 0.7
const MIN_POSITION_Y = 0.1

@export var engine_force_value = 400
@export var Jump_impulse = 3.0
@export var rotation_speed = 3.0

var steer_target = 0
var inclinacion = 0
var esta_volando = false

signal movido

func _physics_process(delta):
#	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	var fwd_mps = (transform.basis.inverse()*linear_velocity).x
	esta_volando = not(position.y < MIN_POSITION_Y)

	steer_target = Input.get_action_strength("rotate_left") - Input.get_action_strength("rotate_right")
	inclinacion = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	steer_target *= STEER_LIMIT

	if esta_volando==true:
		print("volando!!", steer_target, ", ", global_transform.origin.y)
		angular_velocity = Vector3(0, steer_target*rotation_speed, 0) + global_basis.x*inclinacion*rotation_speed
	else:
		if Input.is_action_pressed("move_forward"):
			# Increase engine force at low speeds to make the initial acceleration faster.
			var speed = linear_velocity.length()
			if speed < 5 and speed != 0:
				engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
			else:
				engine_force = engine_force_value
		else:
			engine_force = 0

		if Input.is_action_pressed("move_back"):
			# Increase engine force at low speeds to make the initial acceleration faster.
			if fwd_mps >= -1:
				var speed = linear_velocity.length()
				if speed < 5 and speed != 0:
					engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
				else:
					engine_force = -engine_force_value
			else:
				brake = 1
		else:
			brake = 0.0

		steering = move_toward(steering, steer_target, STEER_SPEED * delta)
	
		if Input.is_action_pressed("jump"):
			#apply_impulse(Vector3(0, Jump_impulse, 0), Vector3(0, 0, 0.0))
			linear_velocity = linear_velocity + Vector3(0, Jump_impulse, 0)
		
	if Input.is_action_pressed("reset_car"):
		rotation = Vector3(0, 0, 0)
		
	if linear_velocity.length() > 0.01:
		movido.emit()
	inclinacion = 0
	steer_target = 0

func _on_timer_timeout():
	print("Volando? ", esta_volando)
	#print(linear_velocity.length(), " ; ", linear_velocity, " ; ", get_contact_count())
	#print("Engine: ", engine_force, ", Brake: ", brake, ", Steering: ", steering)


func _on_body_entered(body: PhysicsBody3D):
	if body is StaticBody3D:
		print("El cuerpo estático ha sido intersectado por: " + body.name)
