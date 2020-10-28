extends Area2D

export (int) var speed = 50

var velocity = Vector2()

func _ready():
	velocity.y += 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if get_position().y < 2900:
		position += velocity * delta
