extends Node

@export var floor: float = 750
var parent = get_parent() as Node2D

func _physics_process(delta: float) -> void:
	if parent:
		if parent.position.y > floor:
			get_tree().current_scene.place_object_in_scene(parent)
