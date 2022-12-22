extends Node2D

var pointposition = Vector2()
var rnd = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	for i in 200:
		var asteroid = load("res://Enamis/Asteroid/Asteroid.tscn").instance()
		pointposition.x = float(rnd.randi_range(-9000,9000))
		pointposition.y = float(rnd.randi_range(-9000,9000))
		asteroid.position = pointposition
		add_child(asteroid)

# добавление элемента в список или массив
func add_asteroid():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
