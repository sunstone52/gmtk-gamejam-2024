extends Node


var grabbed = false
var parent: PhysicsBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent() as PhysicsBody2D
	parent.input_event.connect(_input_event)
	set_process_input(false)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton):
		if (event.is_pressed()):
			print ("pressed:", event)
			parent.set_physics_process(false)
			grabbed = true
			parent.velocity.y = 0
			set_process_input(true)

func _input(event: InputEvent):
	if grabbed:
		if (event is InputEventMouseButton):
			if (event.is_released()):
				print ("released:", event)
				parent.set_physics_process(true)
				grabbed = false
				set_process_input(false)
		elif (event is InputEventMouseMotion):
			print ("moved:", event)
			parent.position += event.relative
