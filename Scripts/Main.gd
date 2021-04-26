extends Node2D


func _process(delta):
#	print($Level2.visible)
	pass


func _on_Acceptance_body_entered(body):
	$AnimationPlayer.play("acceptance")
	$Level1/Meduses.queue_free()
	$Level2/Sharks.queue_free()
	$Level2/Mines.queue_free()
	$Level3/Octopus.queue_free()
	$Level3/Coins.queue_free()
	$Music_Selector.play_acceptance()
	$Acceptance.queue_free()
	$End.monitoring = true


func _on_End_body_shape_entered(body_id, body, body_shape, local_shape):
	$End.monitoring = false
	$Character.weight = 0
	$AnimationPlayer.play("end")


func _on_AnimationPlayer_animation_finished(anim_name):
	$Character.weight = -1.1
	if anim_name == "end" :
		get_tree().change_scene("res://Scenes/Outro.tscn")
