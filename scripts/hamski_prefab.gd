extends RigidBody2D

#export var thrust_vector = Vector3()
var mcp

# Called when the node enters the scene tree for the first time.
func _ready():
	mcp = get_node("/root/mainGame/mcp")

func _input(event):
	if not mcp.isRunning:
		return
		
	if event.is_action_pressed("player_up"):
		linear_velocity = Vector2.ZERO;
		angular_velocity = 0;
		apply_impulse(Vector2(0.0, -500.0))
		print('BOING!')
		
#func _integrate_forces(state):
#	var boosters_position = get_node("Boosters").get_global_transform().origin
#	var rocket_position = get_global_transform().origin
#	add_force(thrust_vector, rocket_position - boosters_position)

func _on_hamski_prefab_body_entered(body):
	var bodys = get_colliding_bodies()
	print(mcp.kill())
	
