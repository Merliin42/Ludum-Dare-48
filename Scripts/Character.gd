extends KinematicBody2D


export var SPEED : int = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction : Vector2 = Vector2()
	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = +1
	if Input.is_action_pressed("down"):
		direction.y = +1
	elif Input.is_action_pressed("up"):
		direction.y = -1
	move_and_slide(direction.normalized()*SPEED)


