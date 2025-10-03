class_name PlayerItems
extends Node2D

enum PlayerItem {
    HOE,
    WATER_BUCKET,
    SCYTHE,
    SEED,
}

var _current_item: PlayerItem
var _current_crop: CropData

@onready var _farm_manager := $"../../FarmManager"

func _ready():
    # TODO: Connect to signals
    _current_item = PlayerItem.HOE

func _set_farm_item(item: PlayerItem, crop: CropData):
    _current_item = item
    _current_crop = crop

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("interact"):
        match _current_item:
            PlayerItem.HOE:
                _farm_manager.try_till_tile(global_position)
            PlayerItem.WATER_BUCKET:
                _farm_manager.try_water_tile(global_position)
            PlayerItem.SCYTHE:
                _farm_manager.try_harvest_tile(global_position)
            PlayerItem.SEED:
                _farm_manager.try_seed_tile(global_position, _current_crop)
