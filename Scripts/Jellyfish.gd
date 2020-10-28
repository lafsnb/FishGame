extends "res://Scripts/Fish.gd"

var dirRight = false

func _ready():
	randomStats()
	velocity = velocity.normalized() * speed
	set_scale(Vector2(size, size))

func _physics_process(delta):
	if position.x < -2100:
		turnRight();
	if position.x > 2100:
		turnLeft();
	
	._physics_process(delta)

func randomStats():
	randomize()
	speed = rand_range(50,100)
	randomize()
	if dirRight:
		velocity.x += 1
	else:
		velocity.x -= 1
	size = rand_range(0.5, 3)

func turnRight():
	velocity.x = 100

func turnLeft():
	velocity.x = -100
