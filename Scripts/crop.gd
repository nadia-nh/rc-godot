class_name Crop
extends Node2D

var crop_data: CropData
var days_until_grown: int
var is_watered_today: bool
var can_be_harvested: bool

# Position of the crop on the background tile map
var tile_map_coordinates: Vector2i

@onready var sprite: Sprite2D = $CropSprite

func _ready():
    pass

func plant_crop(data: CropData, tile_is_watered: bool, tile_coordinates: Vector2i):
    # TODO: handle case where days to grow is < 1, or number of growth
    #       sprites is less than days to grow
    crop_data = data
    is_watered_today = tile_is_watered
    can_be_harvested = false

    days_until_grown = crop_data.days_to_grow
    sprite.texture = crop_data.growth_sprites[0]

## This function will be connected to a new day signal coming from the game manager script
func _on_new_day():
    pass
