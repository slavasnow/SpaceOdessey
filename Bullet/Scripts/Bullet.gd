extends KinematicBody2D

var velocity = Vector2()
var speed = 1000
var damage

# Появление анимации взрыва пули
func _fire_bullet():
	var FireBullet = preload("res://Bullet/AnimBull/FireBullet.tscn").instance()
	FireBullet.position = self.global_position
	FireBullet.frame = 0
	FireBullet.play("default")
	get_node("/root/main").add_child(FireBullet)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = move_and_slide(Vector2(speed * 1,0).rotated(self.global_rotation))
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		var body = collision.collider
		body.take_damage(damage)

		_fire_bullet()
		
		queue_free()
		
