extends RigidBody2D

export var thrust_vector = Vector3()
var mcp

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	mcp = get_node("/root/mainGame/mcp")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if not mcp.isRunning:
		return
		
	if event.is_action_pressed("player_up"):
		apply_impulse(Vector2(), Vector2(0.0, -50.0))
		print('BOING!')
		
#func _integrate_forces(state):
#	var boosters_position = get_node("Boosters").get_global_transform().origin
#	var rocket_position = get_global_transform().origin
#	add_force(thrust_vector, rocket_position - boosters_position)

func _on_hamski_prefab_body_entered(body):
	var bodys = get_colliding_bodies()
	print(mcp.kill())
	
