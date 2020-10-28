extends Control

var LevelImages = [
	load("res://Images/Menu/Stage1.png"),
	load("res://Images/Menu/Endless.png")]
var LevelSelect = [
	"res://Prefabs/Scenes/Level1.tscn", 
	"res://Prefabs/Scenes/EndlessLevel.tscn"]
var currentLevel = 0

onready var levelImage = get_node("LevelImage")

func _ready():
	levelImage.set_texture(LevelImages[currentLevel])

func _on_Button_pressed():
	get_tree().change_scene(LevelSelect[currentLevel])


func _on_LeftButton_pressed():
	if currentLevel > 0:
		currentLevel -= 1
	levelImage.set_texture(LevelImages[currentLevel])


func _on_RightButton_pressed():
	if currentLevel < LevelSelect.size() - 1:
		currentLevel += 1
	levelImage.set_texture(LevelImages[currentLevel])
