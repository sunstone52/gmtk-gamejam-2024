extends Node2D

var weight = 0

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_area_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		weight += body.mass
		$Weight.text = "%s kg" % weight


func _on_area_body_exited(body: Node2D) -> void:
	if body is RigidBody2D:
		weight -= body.mass
		$Weight.text = "%s kg" % weight
