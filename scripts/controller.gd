extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func place_object_in_scene(object: Node2D) -> void:
	if object.get_parent() != self:
		if object.get_parent():
			object.get_parent().remove_child(object)
		add_child(object)
	
	var pos: Vector2
	if randi() % 2 == 1:
		pos = %RespawnPoint1.position
	else:
		pos = %RespawnPoint2.position
	
	var rigidObject = object as RigidBody2D
	if (rigidObject):
		rigidObject.freeze = true
		PhysicsServer2D.body_set_state(
			rigidObject.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D.IDENTITY.translated(pos)
		)
		rigidObject.freeze = false
	else:
		object.position = pos
