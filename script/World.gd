extends Node2D

# Platform counter
const N_PLATFORM = 25

# Loads platform from library
var pre_platform=preload("res://scene/Platform.tscn")
var pre_player=preload("res://scene/Player.tscn")
var platform_counter = 0
var pindex = 0

func _ready():
	$Audio.play()

func _process(delta):
	var num_players   = get_tree().get_nodes_in_group("player").size();
	var num_platforms = get_tree().get_nodes_in_group("platforms").size();
	platform_counter += 1

	if num_players < 1 && num_platforms > (N_PLATFORM/3):
		var player = pre_player.instance()
		player.global_position = $PlatformPos.get_child(1).global_position
		add_child(player)

	# Randomize the position
	var rnd = randi()%3

	if num_platforms < N_PLATFORM && platform_counter == 30:
		var platform = pre_platform.instance()
		platform.global_position = $PlatformPos.get_child(pindex).global_position

		add_child(platform)
		platform_counter = 0
		pindex += 1
	
	if pindex == 3:
		pindex = 0
