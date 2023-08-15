extends Node2D

# BOMB FOLLOW SCRIPT

# Lag Speed
@export var follow_speed = 0.5

# Reference to the current target
var target_node: Node2D = null

func _ready():
	# Set initial target to $Player
	target_node = $Player

func _process(delta):
	# Calculate the direction from bomb to player
	var direction_to_player = target_node.global_position - $Bomb.global_position

	# Calculate the position where the bomb should move towards
	var target_position = target_node.global_position

	# Move the bomb a fraction of the distance towards the target position
	$Bomb.global_position += (target_position - $Bomb.global_position).normalized() * (direction_to_player.length() * follow_speed)
