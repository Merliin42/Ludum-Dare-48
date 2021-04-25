extends Position2D

const BUBBLE : PackedScene = preload("res://Scenes/Bubble.tscn")

func _on_Timer_timeout():
	add_child(BUBBLE.instance())
