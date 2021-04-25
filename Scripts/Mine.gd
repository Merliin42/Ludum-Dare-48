extends Area2D

var detonate : bool = false

func _on_Area2D_body_entered(body):
	detonate = true
	$AnimatedSprite.play("explosion")


func _on_AnimatedSprite_animation_finished():
	if detonate :
		queue_free()
