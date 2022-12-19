extends KinematicBody2D

export (float) var hp = 100
var takedamage = 500
var speed = 100
var r = 0
var damage
var velocity


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
	velocity = Vector2(0, 1 * speed).rotated(float(r))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.name == "Player":
			collision.collider.take_damage(takedamage)
			print("take_damage")
