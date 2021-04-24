extends Area2D


export var direction : Vector2 = Vector2(0, 0)
export var SPEED : int = 200

func _process(delta):
	position += direction.normalized()*SPEED*delta


func _on_Timer_timeout():
	direction = -direction
