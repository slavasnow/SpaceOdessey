extends KinematicBody2D

#технические переменные
export (float) var hp = 100

#переменные для передачи из других объектов
var damage
#Переменные движения
export (int) var speed = 1200
export (float) var rotation_speed = 1.5
var velocity = Vector2()
var rotation_dir = 0

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
		
# Стрельба из пушек
	if Input.is_action_just_pressed("Fire_Gun"):
		$Big_Gun.get_fire()
#		print("fire gun")
		
	if Input.is_action_pressed("Fire_Small_Gun"):
		$Small_Gun_1.get_fire()
		$Small_Gun_2.get_fire()
#		print('fire small gun')
		
#  Получение урона
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
