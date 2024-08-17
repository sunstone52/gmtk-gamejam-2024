extends Node2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func launch_random_burden() -> void:
	var count = %Burdens.get_child_count()
	var idx = rng.randi_range(0, count - 1)
	var toLaunch = %Burdens.get_child(idx)
	print("Launching: ", toLaunch.name)
	var duplicated = toLaunch.duplicate()
	duplicated.add_child(%MouseControllable.duplicate())
	duplicated.add_child(%Respawns.duplicate())
	place_object_in_scene(duplicated)

func place_object_in_scene(object: Node2D) -> void:
	var pos: Vector2
	if randi() % 2 == 1:
		pos = %RespawnPoint1.position
	else:
		pos = %RespawnPoint2.position
	
	if object.get_parent() != self:
		if object.get_parent():
			object.get_parent().remove_child(object)
		add_child(object)
		object.position = pos
	
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
