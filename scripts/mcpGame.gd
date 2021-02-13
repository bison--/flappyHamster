extends Node2D

var isRunning = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func kill():
	isRunning = false
	var gameOver = get_node("/root/mainGame/GAME_OVER/CanvasLayer/game_over")
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
	var next_level = next_level_resource.instance()
	root.add_child(next_level)

func exit():
	get_tree().quit()
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit() # default behavior
