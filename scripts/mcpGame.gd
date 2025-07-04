extends Node2D

@export
var scoreLabel: Label
var isRunning = true

var score: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	score += delta
	scoreLabel.text = str(int(score))

func kill():
	isRunning = false
	var gameOver = get_node("/root/mainGame/GAME_OVER/CanvasLayer/ccGameOver")
	gameOver.visible = true
	
func _input(event):
	if event.is_action_pressed("player_restart"):
		restart()
	elif event.is_action_pressed("player_exit"):
		exit()

func restart():
	var root = get_node("/root")
	
	# Remove the current level
	var level = get_node("/root/mainGame")
	root.remove_child(level)
	level.call_deferred("free")

	# Add the next level
	var next_level_resource = load("res://scenes/mainGame.tscn")
	var next_level = next_level_resource.instantiate()
	root.add_child(next_level)

func exit():
	get_tree().quit()
	
#func _notification(what):
#	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
#		get_tree().quit() # default behavior
