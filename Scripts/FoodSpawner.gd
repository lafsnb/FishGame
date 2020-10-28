extends Node2D

var rng = RandomNumberGenerator.new()
var foodPrefab = null
onready var timer = get_node("FoodTimer")

func _ready():
	foodPrefab = load("res://Prefabs/FoodBlobs.tscn")
	timer.set_wait_time(10)
	timer.start()


func _on_FoodTimer_timeout():
	timer.set_wait_time(25)
	var food = foodPrefab.instance()
	rng.randomize()
	var position = Vector2(rng.randf_range(-1500.0, 1500.0), 0)
	food.set_position(position)
	food.set_scale(Vector2(0.7, 0.7))
	add_child(food)
