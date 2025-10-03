extends Node2D

@export var spawns: Array[Spawn_info] = []
@onready var player = get_tree().get_nodes_in_group("player")[0]

var time = 0

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_timer_timeout():
	time += 1
	for i in spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy_scene = i.enemy if i.enemy is PackedScene else load(i.enemy.resource_path)
				for counter in range(i.enemy_num):
					var enemy_spawn = new_enemy_scene.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					print("enemy spawned at ", enemy_spawn.global_position)


func get_random_position():
	var camera = player.get_node("Camera2D")
	var viewport_size = get_viewport().get_visible_rect().size / camera.zoom
	var camera_radius = viewport_size.length() / 2 + 50
	var angle = randf() * TAU
	var spawn_pos = player.global_position + Vector2.from_angle(angle) * camera_radius
	
	return spawn_pos
