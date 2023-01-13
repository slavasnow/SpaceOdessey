extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _callback = JavaScript.create_callback(self, "on_get")
var console = JavaScript.get_interface("window")

# Called when the node enters the scene tree for the first time.
func _ready():
	console.ShowAdv()
	var cursor = preload("res://ather/cursor_pointerFlat.png")
	Input.set_custom_mouse_cursor(cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotate(delta * 0.05)

	#проверка на скрытие и закрытие окна
	var ch = console.CheckHidden()
	if ch == true:
		$BGMusic.volume_db = -80
	else:
		$BGMusic.volume_db = 0
	var cv = console.CheckVisible()
	if cv == true:
		$BGMusic.volume_db = -80
	else:
		$BGMusic.volume_db = 0

#Новая игра
func _on_Button_button_up():
	get_tree().change_scene("res://GameScens/main.tscn")

func _on_get(args):
	OS.alert("On Get")
