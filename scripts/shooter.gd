extends CharacterBody2D

var player_speed = 680
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		var direction_moving:Vector2 = Input.get_vector("left", "right", "up", "down") 
		velocity = direction_moving * player_speed
		move_and_slide()
	
