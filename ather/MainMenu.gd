extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var cursor = preload("res://ather/cursor_pointerFlat.png")
	Input.set_custom_mouse_cursor(cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotate(delta * 0.05)

#Новая игра
func _on_Button_button_up():
	get_tree().change_scene("res://GameScens/main.tscn")
