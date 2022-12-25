extends Sprite


var rnd = RandomNumberGenerator.new()
var bonus 
var live = 5.0
var x = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	bonus = rnd.randi() % 3
	print(bonus)
	
	if bonus == 0:
		bonus_0()
	elif bonus == 1:
		bonus_1()
	elif bonus == 2:
		bonus_2()
	
	$Live.start(live)
	#yield(get_tree().create_timer(live), "timeout")

	#queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Live.time_left == 0 or x == true :
		queue_free()
#	pass

func _on_Area2D_body_entered(body:Node):
	body.bonus(bonus)
	x = true


func bonus_0():
	var sprite = preload("res://ather/dotBlue.png")
	texture = sprite 
func bonus_1():
	var sprite = preload("res://ather/dotRed.png")
	texture = sprite
func bonus_2():
	var sprite = preload("res://ather/dotGreen.png")
	texture = sprite