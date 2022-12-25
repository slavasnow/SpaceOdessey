extends KinematicBody2D

#технические переменные
export (float) var hp = 100

signal bonussig
#переменные для передачи из других объектов
var damage
var bonus_bool = false

#Переменные движения
export (int) var speed = 300
export (float) var rotation_speed = 1.5
var velocity = Vector2()
var rotation_dir = 0

#Реализация управления
func get_input():
	rotation_dir = 0
	velocity = Vector2()
	
#Передвижение	
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, speed).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(0, -speed).rotated(rotation)
	
# ускорение

# Стрельба из пушек
	if Input.is_action_just_pressed("Fire_Gun"):
		$Big_Gun.get_fire()
#		print("fire gun")
		
	if Input.is_action_pressed("Fire_Small_Gun"):
		$Small_Gun_1.get_fire()
		$Small_Gun_2.get_fire()	

#  Получение урона
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		#_death()# анимация взрыва
		
		queue_free()

#проигрывание анимации взрыва		
func _death():
	var Death = preload("res://ather/Death.tscn").instance()
	Death.position = self.global_position
	Death.frame = 0
	Death.play("default")
	get_node("/root/main").add_child(Death)	
	yield(get_tree().create_timer(0.6), "timeout")# задержка перед удалением

#бонусы
func bonus(x):
	
	#Увеличение основных орудий
	if  x == 0 and bonus_bool == false: 
		$Small_Gun_1.damage = 30
		$Small_Gun_2.damage = 30

		bonus_bool = true
		$TimerBonus.start(10.0)
		yield(get_tree().create_timer(10.0), "timeout")
		$TimerBonus.stop()
		bonus_bool = false

		$Small_Gun_1.damage = 10
		$Small_Gun_2.damage = 10
		

	#Уменьшение перезарядки большого орудия и увеличена скорость поворота
	if  x == 1 and bonus_bool == false:
		$Big_Gun.cooldown = 2.0
		$Big_Gun.rotate_speed = 0.05

		bonus_bool = true 
		$TimerBonus.start(10.0)
		yield(get_tree().create_timer(10.0), "timeout")
		$TimerBonus.stop()
		bonus_bool = false

		$Big_Gun.cooldown = 5.0
		$Big_Gun.rotate_speed = 0.005

	#Изменение скорости
	if  x == 2 and bonus_bool == false: 
		speed *= 2
		
		bonus_bool = true 
		$TimerBonus.start(10.0)
		yield(get_tree().create_timer(10.0), "timeout")
		$TimerBonus.stop()
		bonus_bool = false 

		speed /= 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	# проверка на конец карты, переносится на противоложную сторону
	if self.position.x <= -9000 or self.position.x >= 9000:
		self.position.x *= -1
	if self.position.y <= -9000 or self.position.y >= 9000:
		self.position.y *= -1
	
