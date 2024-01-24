extends RigidBody3D

@export var radio = 2.2
@export var size_mesh = 11.0

func _physics_process(delta):
	pass
	#print(mass)
	# Iterate through all collisions that occurred this frame
#	for index in range(get_slide_collision_count()):
#		if index == 0:
#			continue
		# We get one of the collisions with the player
#		var collision = get_slide_collision(index)
#		if collision.get_collider().is_in_group("players"):
#			print("Jugador pateando:", index)
#			var player = collision.get_collider()
#			chuteo()
#	print(delta)
#	move_and_slide()
	
func chuteo():
	$Pivot/BoxDebug.visible = true
