extends Node

@export var floor: float = 750
var parent

func _ready() -> void:
	parent = get_parent() as Node2D

func _physics_process(delta: float) -> void:
	if parent:
		if parent.position.y > floor:
			$"../../../Controllers/ObjectController".place_object_in_scene(parent)
