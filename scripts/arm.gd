extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _physics_process(_delta: float) -> void:
	pass


func _on_rigid_body_2d_2_body_entered(body: Node) -> void:
	print("Mass: %s kg" % body.mass)
