extends Sprite

export (float) var damage = 3.0
var rotate_speed = .05

#функиция стрельбы
func get_fire():
	var bullet = preload("res://Bullet/Bullet.tscn").instance()
	#Получение глобальной позиции точкии передача пуле
	var transformPoint = $Point_Bullet.global_transform
	bullet.transform = transformPoint
	bullet.damage = damage
	#Появление на главной ноде пули
	get_node("/root/main").add_child(bullet)
	#Анимация выстрела
	$Point_Bullet/Fire.frame = 0
	$Point_Bullet/Fire.play("default")
#	$Gun/Sfire.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v = get_global_mouse_position() - global_position
	var angle = v.angle()
	var r = global_rotation
	
	global_rotation = lerp_angle(r, angle, rotate_speed)
