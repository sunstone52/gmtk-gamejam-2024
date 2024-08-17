extends Node2D

@onready var l_platform = %"Left Platform"
@onready var r_platform = %"Right Platform"

# Positive = left platform is heavier
# Negative = right platform is heavier
var diff: float
var max_height: int
var min_height: int

func _ready() -> void:
	max_height = l_platform.position.y - 100
	min_height = l_platform.position.y + 100
	print("min: %s" % min_height)
	print("max: %s" % max_height)


func _process(delta: float) -> void:
	# calculate weight difference
	diff = l_platform.weight - r_platform.weight
	$Difference.text = "%s kg" % diff


func _physics_process(delta: float) -> void:
	var move_by = diff
	
	if move_by > 0 and not l_platform.position.y <= min_height:
		move_by = 0
	
	if move_by < 0 and not l_platform.position.y >= max_height:
		move_by = 0

	l_platform.position.y += move_by
	r_platform.position.y -= move_by
