extends CharacterBody2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var weaponholder: Node2D = $Weaponholder
@onready var gun = weaponholder.get_child(0)  


const movevement_speed = 150.0
const direction_speed = 1.2
var hp = 100

func _physics_process(delta: float) -> void:
	
	###var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	var direction:= Input.get_vector("move_left","move_right","move_up","move_down")
	
	
	if direction:
		velocity = direction * movevement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movevement_speed)
		velocity.y = move_toward(velocity.y, 0, movevement_speed)
		
	##if mouse_direction.x > 0:
	##	animated_sprite.flip_h = false
	##elif mouse_direction.x < 0:
	##	animated_sprite.flip_h = true
	###
		
	if direction.length() == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	move_and_slide()
	
	
	##weapon_pivot.look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("manual_shoot"):
		gun.manual_shoot = !gun.manual_shoot
		if gun.manual_shoot:
			print("Manual shooting mode activated")
		else:
			print("Auto targeting mode activated")


func _on_hurt_box_hurt(damage: Variant) -> void:
	hp -= damage
	print(hp)
