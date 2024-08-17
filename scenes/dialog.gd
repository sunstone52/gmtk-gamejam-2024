extends Node2D


func _ready() -> void:
	var resource = load("res://assets/intro.dialogue")
	var line = await resource.get_next_dialogue_line("start")
	%Text.set_text(line.text)

func _process(delta: float) -> void:
	pass
