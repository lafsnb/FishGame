extends Area2D

export (int) var speed = 200
export (float) var size = 1.0
export (float) var growthRate = 0.1

var velocity = Vector2()

func _physics_process(delta):
	position += velocity * delta

func _process(_delta):
	if velocity.x < 0:
		get_node("Fish").set_flip_h(true)
	if velocity.x > 0:
		get_node("Fish").set_flip_h(false)

func grow(scale):
	size += scale.x / size * growthRate
	set_scale(Vector2(size, size))

func checkSize(var collision):
	if collision.get_scale() < get_scale() - Vector2(0.2, 0.2):
		collision.queue_free()
		grow(collision.get_scale())

func _on_Area2D_area_entered(area):
	checkSize(area)
