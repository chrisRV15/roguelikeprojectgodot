extends CharacterBody2D

@export var hp = 10


const movement_speed: float = 80.0


func _physics_process(delta: float) -> void:
	if EnemyManager.player:
		var direction: Vector2 = EnemyManager.get_direction_to_player(position)
		velocity = direction * movement_speed
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
			
		move_and_slide()


func _on_hurt_box_hurt(damage: Variant) -> void:
	hp -= damage
	if hp <= 0:
		queue_free()
