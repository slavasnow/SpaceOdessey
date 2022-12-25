extends Sprite

export (float) var cooldown = 5
export (float) var damage = 100.0
var rotate_speed = .005
#функиция стрельбы
func get_fire():
	if $Cooldown.is_stopped():
		var bullet = preload("res://Bullet/Blaster.tscn").instance()
		#Получение глобальной позиции точкии передача пуле
		var transformPoint = $Point_Bullet.global_transform
		bullet.transform = transformPoint
		bullet.damage = damage
		#Звук выстрела
		$AudioShoot.play()

		get_node("/root/main").add_child(bullet)
		#Анимация выстрела
		$Point_Bullet/Fire.frame = 0
		$Point_Bullet/Fire.play("Blaster")
#		$Gun/Sfire.play()
		$Cooldown.start(cooldown)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v = get_global_mouse_position() - global_position
	var angle = v.angle()
	var r = global_rotation
	
	global_rotation = lerp_angle(r, angle, rotate_speed)
	
	#пример вывода числа с 1 цифорой после запятой
	#print("%.1f" % $Cooldown.time_left)