extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# create an instance
	var meteor = meteor_scene.instantiate()
	
	# attach node to the scene tree
	add_child(meteor)  # adds directly to Main scene
