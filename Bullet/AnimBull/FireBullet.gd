extends AnimatedSprite

#удаление объекта после проигрывания анимации
func _on_FireBullet_animation_finished():
	queue_free()
