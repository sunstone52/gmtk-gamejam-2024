extends RigidBody2D

@export var floor: float = 750

func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if position.y > floor:
		var pos: Vector2
		if randi() % 2 == 1:
			pos = %RespawnPoint1.position
		else:
			pos = %RespawnPoint2.position
		
		freeze = true
		PhysicsServer2D.body_set_state(
			get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D.IDENTITY.translated(pos)
		)
		freeze = false
