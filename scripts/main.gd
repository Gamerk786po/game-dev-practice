extends Node2D

# Scenes
var laser_scene: PackedScene = preload("res://scenes/Laser.tscn")
var gernade_scene: PackedScene = preload("res://scenes/Gernade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Home/door.door_entered.connect(on_door_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_door_entered() -> void:
	print("Player entered")

func _on_shooter_laser_shoot(selected_projectile_location: Vector2, projectile_direction: Vector2) -> void:
	var laser = laser_scene.instantiate() as Area2D
	$Projectiles.add_child(laser)
	laser.global_position = selected_projectile_location
	laser.rotation_degrees = rad_to_deg(projectile_direction.angle()) + 90
	laser.direction = projectile_direction
	


func _on_shooter_gernade_throw(selected_projectile_location: Vector2, projectile_direction: Vector2) -> void:
	var gernade = gernade_scene.instantiate() as RigidBody2D
	$Projectiles.add_child(gernade)
	var gernade_speed = 1000
	gernade.global_position = selected_projectile_location
	gernade.linear_velocity = projectile_direction * gernade_speed
