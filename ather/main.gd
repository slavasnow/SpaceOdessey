extends Node2D


var pointposition = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var asteroid = load("res://Enamis/Asteroid/Asteroid.tscn").instance()
	
	#pointposition.x = float(1 * randi() % 10)
	#pointposition.y = float(1 * randi() % 10)
	#asteroid.position = pointposition
	#asteroid.name = "1"
	#get_node("/root/main").add_child(asteroid)
	for i in range(0,10):
		var asteroid = load("res://Enamis/Asteroid/Asteroid.tscn").instance()
		pointposition.x = float(1 * randi() % 1000)
		pointposition.y = float(1 * randi() % 1000)
		asteroid.position = pointposition
		add_child(asteroid)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
