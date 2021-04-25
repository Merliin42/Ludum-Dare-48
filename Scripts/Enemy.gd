extends Area2D

export var time : int = 1
export var direction : Vector2 = Vector2(0, 0)
export var SPEED : int = 200
onready var _animated_sprite = $AnimatedSprite

func _ready():
	$Timer.wait_time = time
	$Timer.start()

func _process(delta):
	position += direction.normalized()*SPEED*delta
	if direction.x <= 0 :
		_animated_sprite.play("moveLeft")
	else:
		_animated_sprite.play("moveRight")


func _on_Timer_timeout():
	direction = -direction

