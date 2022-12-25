extends KinematicBody2D

var hp = 100
var takedamage = 20
export (float) var speed = 150
var r = 0
var damage
var velocity
var chanse = 40
signal destroed

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		_death()
		emit_signal("destroed")
		if r <= chanse:
			_spawn_bonus()
		queue_free()

func _death():
	var Death = preload("res://ather/Death.tscn").instance()
	Death.position = self.global_position
	Death.frame = 0
	Death.play("default")
	get_node("/root/main").add_child(Death)	

#спавн бонуса после сметри
func _spawn_bonus():
	var Bonus = preload("res://ather/Bonus.tscn").instance()
	Bonus.position = self.global_position
	get_node("/root/main").add_child(Bonus)	


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	r = randi() % 50
	velocity = Vector2(0, 1 * speed).rotated(float(r))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	 #движение с коллизией, если она есть то корабль уничтожается
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.name == "Player":
			collision.collider.take_damage(takedamage)

	# проверка на конец карты, переносится на противоложную сторону
	if self.position.x <= -9000 or self.position.x >= 9000:
		self.position.x *= -1
	if self.position.y <= -9000 or self.position.y >= 9000:
		self.position.y *= -1
