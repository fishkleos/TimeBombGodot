extends Node2D

# BOMB FOLLOW SCRIPT

# Lag Speed
@export var follow_speed = 0.5

# Reference to the current target
var bomb_holder: Node2D = null

func _ready():
	# Set initial target to $Player
	bomb_holder = $Player

func _process(delta):
	if bomb_holder != null:
		var direction_to_holder = bomb_holder.global_position - $Bomb.global_position
		var target_position = bomb_holder.global_position
		$Bomb.global_position += direction_to_holder.normalized() * (direction_to_holder.length() * follow_speed)

func _on_player_goto_dummy():
	if bomb_holder == $Player:
		print("goto dummy")
		bomb_holder = $Dummy

func _on_dummy_goto_player():
	if bomb_holder == $Dummy:
		print("goto player")
		bomb_holder = $Player

