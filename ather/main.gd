extends Node2D

var pointposition = Vector2()
var rnd = RandomNumberGenerator.new()

var array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,100):
		var asteroid = load("res://Enamis/Asteroid/Asteroid.tscn").instance()
		pointposition.x = float(rnd.randi_range(-5000,5000))
		pointposition.y = float(rnd.randi_range(-5000,5000))
		asteroid.position = pointposition
		add_child(asteroid)

# удаление элемента из списока или массива
func dell_array():
	pass
# добавление элемента в список или массив
func add_array():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
