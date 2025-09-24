extends CharacterBody2D

@export var move_speed: float = 30
var facing_direction: Vector2

func _ready():
	facing_direction = Vector2.DOWN

# Gets the inputs and converts them to a direction
func _physics_process(delta: float):
	var move_input = Input.get_vector("mode_left", "move_right", "move_up", "move_down")
	
	# Check if the user had actually pressed any WASD key
	if (move_input != Vector2.ZERO):
		facing_direction = move_input
		
	velocity = move_input * move_speed
	move_and_slide()
