extends Node2D

var rng = RandomNumberGenerator.new()
var foodPrefab = null
var health = 15
onready var timer = get_node("Timer")

func _ready():
	foodPrefab = load("res://Prefabs/FishFood.tscn")
	rng.randomize()
	timer.set_wait_time(rng.randf_range(1, 3))
	timer.start()

func _process(_delta):
	if health <= 0:
		queue_free()

func _on_Timer_timeout():
	health -= 1
	var food = foodPrefab.instance()
	rng.randomize()
	var position = Vector2(get_position().x + rng.randf_range(-400.0, 400.0), 0)
	food.set_position(position)
	food.set_scale(Vector2(0.7, 0.7))
	get_parent().add_child(food)
