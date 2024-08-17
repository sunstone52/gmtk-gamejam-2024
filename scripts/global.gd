extends Node

var scales = preload("res://scenes/scale.tscn")

# Dialog functions
func focus() -> void:
	pass

func show_scales() -> void:
	var instance = scales.instantiate()
	add_child(instance)

func show_inventory() -> void:
	pass

func show_sprite(_sprite: String) -> void:
	pass

func hide_sprite() -> void:
	pass

func play_sound(_sound: String) -> void:
	pass

func place_feather() -> void:
	pass
