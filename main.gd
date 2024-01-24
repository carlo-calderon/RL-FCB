extends Node

enum CameraMode {ThrethPerson, FirstPerson, Fixed, Modes}

@export var camera_distance = Vector3(0, 5, 20)
@export var camera_mode:int = CameraMode.ThrethPerson

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_pressed("change_camera"):
		camera_mode = (camera_mode + 1) % CameraMode.Modes
		print(event, " ; ", camera_mode)
		_on_car_movido()

func _on_tanque_movido():
	if camera_mode == CameraMode.ThrethPerson:
		$CameraPivot/Camera3D.position = Vector3(0, 3, 10)
		$CameraPivot.position = $Player.position
		$CameraPivot.rotation.x = -PI/6.0
		#$CameraPivot.rotation.y = $Player/Pivot.rotation.y-PI/2.0
	if camera_mode == CameraMode.FirstPerson:
		$CameraPivot/Camera3D.position = Vector3(0, 3, -3)
		$CameraPivot.position = $Player.position
		$CameraPivot.rotation.x = 0
		$CameraPivot.rotation.y = $Player/Pivot.rotation.y-PI/2.0
	if camera_mode == CameraMode.Fixed:
		$CameraPivot/Camera3D.position = Vector3(0, 20, 20)
		$CameraPivot.rotation.x = -PI/4.0


func _on_car_movido():
	if camera_mode == CameraMode.ThrethPerson:
		$CameraPivot/Camera3D.position = Vector3(0, 3, 10)
		$CameraPivot.position = $Car.position
		$CameraPivot.rotation.x = -PI/6.0
		$CameraPivot.rotation.y = $Car.rotation.y + PI
	if camera_mode == CameraMode.FirstPerson:
		$CameraPivot/Camera3D.position = Vector3(0, 3, -3)
		$CameraPivot.position = $Player.position
		$CameraPivot.rotation.x = 0
		$CameraPivot.rotation.y = $Player/Pivot.rotation.y-PI/2.0
	if camera_mode == CameraMode.Fixed:
		$CameraPivot/Camera3D.position = Vector3(0, 20, 20)
		$CameraPivot.rotation.x = -PI/4.0
