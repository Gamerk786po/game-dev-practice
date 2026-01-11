extends Node2D

# Scenes
var laser_scene: PackedScene = preload("res://scenes/Laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_shooter_laser_shoot(selected_projectile_location: Variant) -> void:
	var laser = laser_scene.instantiate() as Area2D
	$Projectiles.add_child(laser)
	laser.global_position = selected_projectile_location
	
