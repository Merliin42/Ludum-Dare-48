extends Node2D

func _ready():
	$AnimationPlayer.play("Animation")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main.tscn")
