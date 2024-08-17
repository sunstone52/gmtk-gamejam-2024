extends RigidBody2D

@export var floor: float = 750

func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if position.y > floor:
		get_tree().current_scene.place_object_in_scene(self)
