extends "res://Scripts/Fish.gd"

export (float) var camMod = 1.2

var camZoom = 1.0
onready var cam = $Camera2D

func _ready():
	camZoom = size / camMod
	cam.zoom = Vector2(camZoom, camZoom)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	._physics_process(delta)

func grow(scale):
	.grow(scale)
	camZoom = size / camMod
	if camZoom > 1:
		cam.zoom = Vector2(int(camZoom), int(camZoom))
	else:
		cam.zoom = Vector2(camZoom, camZoom)
