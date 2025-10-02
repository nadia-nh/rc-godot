extends CharacterBody2D

@export var move_speed: float = 30.0

var facing_direction: Vector2

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
    facing_direction = Vector2.DOWN

## Gets the inputs and converts them to a direction
func _physics_process(delta: float):
    var move_input = Input.get_vector("mode_left", "move_right", "move_up", "move_down")

    # Check if the user had actually pressed any WASD key
    if (move_input != Vector2.ZERO):
        facing_direction = move_input

    velocity = move_input * move_speed
    move_and_slide()
    _animate()

## Uses velocity and direction to determine which animation to use and plays it
func _animate():
    var is_player_moving = velocity.length() > 0
    var is_direction_horizontal = abs(facing_direction.x) > abs(facing_direction.y)

    var player_state = "walk" if is_player_moving else "idle"
    var player_direction: String

    ## Facing_direction (x, y) mapping: +x → right, -x → left, +y → down, -y → up
    if is_direction_horizontal:
        player_direction = "right" if (facing_direction.x > 0) else "left"
    else:
        player_direction = "down" if (facing_direction.y > 0) else "up"

    var player_animation_name = player_state + "_" + player_direction
    animated_sprite.play(player_animation_name)
