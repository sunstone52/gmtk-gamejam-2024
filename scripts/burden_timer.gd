extends Timer


# Called when the node enters the scene tree for the first time.
func _timeout() -> void:
	$"..".launch_random_burden()
	
func _ready() -> void:
	timeout.connect(_timeout)
