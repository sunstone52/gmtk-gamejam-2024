extends Node2D

var resource: Resource
var line: DialogueLine
var typing: bool = false
var enabled: bool = true

func _ready() -> void:
	resource = load("res://assets/intro.dialogue")
	line = await resource.get_next_dialogue_line("start")
	new_line()

func _process(delta: float) -> void:
	if Input.is_action_just_released(&"diag_continue") and Global.mouse_input and enabled:
		if not typing:
			line = await resource.get_next_dialogue_line(line.next_id)
			if line:
				new_line()
			else:
				# end dialog
				$DialogBox.queue_free()
				enabled = false
		else:
			%Text.skip_typing()
			typing = false

func new_line() -> void:
	%Speaker.text = line.character
	%Text.dialogue_line = line
	%Text.type_out()
	typing = true

func _on_text_finished_typing() -> void:
	typing = false
