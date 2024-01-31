@tool
extends Node3D

@export var color = StandardMaterial3D.new(): set = _set_color

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Tubo.material_override = color
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _set_color(value):
	if $Tubo != null and value != color:
		color = value
		$Tubo.material_override = color
		$Punta.material_override = color
