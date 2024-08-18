extends Node

var scales = preload("res://scenes/scale.tscn")
var blackscreen: bool = true
var mouse_input: bool = true
var scales_visible: bool = false

# Dialog functions
func focus() -> void:
	blackscreen = false

func set_mouse_input(cond: bool) -> void:
	mouse_input = cond

func show_scales() -> void:
	var instance = scales.instantiate()
	add_child(instance)
	scales_visible = true

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
