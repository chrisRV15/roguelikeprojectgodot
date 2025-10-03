extends Node

# Global reference to the player
var player: CharacterBody2D = null

# Called when the game starts to find the player
func _ready() -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]

func get_direction_to_player(from_position: Vector2) -> Vector2:
	if player:
		return from_position.direction_to(player.global_position)
	return Vector2.ZERO
