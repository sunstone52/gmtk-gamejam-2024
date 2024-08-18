extends Node

func play_impact_sound() -> void:
	%ImpactSound.play()

func _on_marble_impact() -> void:
	play_impact_sound()
