extends Node2D

@onready var enemy = $Offscreen/Burdens/Enemy
@onready var marble = $Offscreen/Burdens/Marble

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_enemy() -> void:
	var newEnemy = enemy.duplicate() as Node2D
	newEnemy.position = Vector2(700, 300)
	var newMarble = marble.duplicate() as RigidBody2D
	newEnemy.add_child(newMarble)
	newMarble.freeze = true
