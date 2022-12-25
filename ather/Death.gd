extends AnimatedSprite

func _ready():
	$AudioDeath.play()

func _on_Death_animation_finished():
	queue_free()
