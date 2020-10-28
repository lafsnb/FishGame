extends Node2D

var rng = RandomNumberGenerator.new()
var enemyFishPrefab = null
onready var timer = get_node("EnemyFishTimerRight")

func _ready():
	enemyFishPrefab = load("res://Prefabs/Jellyfish.tscn")
	timer.set_wait_time(4)
	timer.start()


func _on_EnemyFishTimerRight_timeout():
	var enemyFish = enemyFishPrefab.instance()
	rng.randomize()
	var position = Vector2(2100, rng.randf_range(-1500.0, 1500.0))
	enemyFish.set_position(position)
	get_tree().get_root().add_child(enemyFish)
