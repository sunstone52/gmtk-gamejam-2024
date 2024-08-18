extends Panel

func _ready() -> void:
	visible = true

func _process(delta: float) -> void:
	if not Global.blackscreen:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate", Color("ffffff00"), 0.2)\
			.set_trans(Tween.TRANS_QUAD)
		
