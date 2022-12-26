extends Node2D

var coins = 0
var asterMax = 200
var lvl = 1 #множитель скорости
var pointposition = Vector2()
var rnd = RandomNumberGenerator.new()

var cursor = load("res://Player/HUD/crossair_red.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	Input.set_custom_mouse_cursor(cursor)

	for i in asterMax:
		add_asteroid(lvl)

# добавление элемента в список или массив
func add_asteroid(lvl):
	var asteroid = load("res://Enamis/Asteroid/Asteroid.tscn").instance()
	pointposition.x = float(rnd.randi_range(-9000,9000))
	pointposition.y = float(rnd.randi_range(-9000,9000))
	asteroid.position = pointposition
	asteroid.speed *= lvl 
	add_child(asteroid)

	asteroid.connect("destroed", self, "add_coin")

#добовление очков в счет
func add_coin():
	var lvlMax = 1 # кол-во новый объектов
	coins += 1
	$HUD_Layer/BG_Coins/Coins.text = str(coins)

	if coins >= 2:
		lvl = 3
		lvlMax = 5
	elif coins >= 6:
		lvl = 5
		lvlMax = 10

	for x in lvlMax:
		add_asteroid(lvl)

#показ КД в худе
func cooldown_in_text():
	if $Player/Big_Gun/Cooldown.time_left != 0:
		$HUD_Layer/Big_Gun/Label.text = str("%.1f" % $Player/Big_Gun/Cooldown.time_left)
	else:
		$HUD_Layer/Big_Gun/Label.text = ""
	
	if $Player/Small_Gun_1/Cooldown.time_left != 0:
		$HUD_Layer/Small_Gun/Label.text = str("%.1f" % $Player/Small_Gun_1/Cooldown.time_left)
	else:
		$HUD_Layer/Small_Gun/Label.text = ""
	
	if $Player/TimerBonus.time_left !=0:
		$HUD_Layer/Bonus/Label.text = str("%.1f" % $Player/TimerBonus.time_left)
		$HUD_Layer/Bonus.modulate = Color.azure
	else:
		$HUD_Layer/Bonus/Label.text = ""

#Выход из игры или переигровка кнопка
func _on_Button_pressed():
	get_tree().reload_current_scene()

func _game_over():
	#показ финального меню
	$HUD_Layer/GameOver.visible = true
	$HUD_Layer/GameOver/Score.text = $HUD_Layer/BG_Coins/Coins.text
	#скрытие лишнего
	$HUD_Layer/Big_Gun.visible = false
	$HUD_Layer/Small_Gun.visible = false
	$HUD_Layer/BG_Coins/Coins.visible = false
	$HUD_Layer/Bonus.visible = false
	$HUD_Layer/BG_Coins.visible = false
	cursor = preload("res://ather/cursor_pointerFlat.png")
	Input.set_custom_mouse_cursor(cursor)

#функция выхода
func _exit_game():
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	#_exit_game()

	if find_node("Player"):
		cooldown_in_text()
	else:
		_game_over()

