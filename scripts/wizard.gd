extends CharacterBody2D

const movement_speed: float = 70.0

func _physics_process(delta: float) -> void:
	if EnemyManager.player:
		var direction: Vector2 = EnemyManager.get_direction_to_player(position)
		velocity = direction * movement_speed
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
			
		move_and_slide()
