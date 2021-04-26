extends Control



func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Intro.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_VideoPlayer_finished():
	$VideoPlayer.play()
