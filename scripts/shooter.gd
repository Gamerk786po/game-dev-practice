extends CharacterBody2D

# Signals
signal laser_shoot(selected_projectile_location)
signal gernade_throw(selected_projectile_location)
# Variables
var player_speed = 700
var can_shoot = true
var can_throw = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
		# Getting direction_vector for moving
		var direction_moving:Vector2 = Input.get_vector("left", "right", "up", "down") 
		velocity = direction_moving * player_speed
		move_and_slide()
		# shooting condition
		if(Input.is_action_just_pressed("primary") and can_shoot):
			print("Shoot Laser")
			# Projectile-marker-locations
			var projectile_locations = $ProjectileLocations.get_children()
			var selected_projectile_location = projectile_locations[randi() % projectile_locations.size()]
			laser_shoot.emit(selected_projectile_location.global_position)
			can_shoot = false
			can_throw = true
		# throwing gernade
		if(Input.is_action_just_pressed("secondary") and can_throw):
			print("throw gernade")
			var projectile_locations = $ProjectileLocations.get_children()
			var selected_projectile_location = projectile_locations[randi() % projectile_locations.size()]
			gernade_throw.emit(selected_projectile_location.global_position)
			can_throw = false
			can_shoot = true
	
