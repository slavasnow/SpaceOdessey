extends KinematicBody2D

export (float) var hp = 100
var takedamage = 10
var speed = 100
var r = 0
var damage

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		_death()
		queue_free()

func _death():
	var Death = preload("res://ather/Death.tscn").instance()
	Death.position = self.global_position
	Death.frame = 0
	Death.play("default")
	get_node("/root/main").add_child(Death)	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	r = randi() % 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(Vector2(0, 1 * speed).rotated(float(r)))
	#pass
