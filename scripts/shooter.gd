extends CharacterBody2D

var player_speed = 700
var can_shoot = true
var can_throw = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
		var direction_moving:Vector2 = Input.get_vector("left", "right", "up", "down") 
		velocity = direction_moving * player_speed
		move_and_slide()
		if(Input.is_action_just_pressed("primary") and can_shoot):
			print("Shoot Laser")
			can_shoot = false
			can_throw = true
		if(Input.is_action_just_pressed("secondary") and can_throw):
			print("throw gernade")
			can_throw = false
			can_shoot = true
	
