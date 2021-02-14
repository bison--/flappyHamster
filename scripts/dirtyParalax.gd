extends Sprite

export(float) var speed = -1.0
export var posMin = -800.0
export var posWarpBack = 1600.0

var mcp
	
# Called when the node enters the scene tree for the first time.
func _ready():
	mcp = get_node("/root/mainGame/mcp")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not mcp.isRunning:
		return
		
	if position.x <= posMin:
		 position.x = posWarpBack
		
	position.x += speed
