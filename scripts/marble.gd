extends RigidBody2D

signal impact

func _on_body_entered(body: Node) -> void:
	if linear_velocity.y > 50:
		impact.emit()
