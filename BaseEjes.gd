extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var rojo = StandardMaterial3D.new()
	rojo.albedo_color = Color.RED
	$EjeX/Tubo.material_override = rojo
	$EjeX/Punta.material_override = rojo
	var verde = StandardMaterial3D.new()
	verde.albedo_color = Color.GREEN
	$EjeY/Tubo.material_override = verde
	$EjeY/Punta.material_override = verde
	var azul = StandardMaterial3D.new()
	azul.albedo_color = Color.BLUE
	$EjeZ/Tubo.material_override = azul
	$EjeZ/Punta.material_override = azul

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
