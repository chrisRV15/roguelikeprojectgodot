extends Area2D


@onready var weapon_pivot: Marker2D = $WeaponPivot

var manual_shoot = false

func _physics_process(delta):
	##var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if manual_shoot:
		weapon_pivot.look_at(get_global_mouse_position())
	else:
		var enemies_in_range = get_overlapping_bodies()
		if enemies_in_range.size() > 0:
			var target_enemy = enemies_in_range.front()
			look_at	(target_enemy.global_position)
	
