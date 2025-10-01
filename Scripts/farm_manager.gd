class_name FarmManager
extends Node

enum TileType {
    UNTILLED_GRASS,
    TILLED_GRASS,
    TILLED_AND_WATERED_GRASS,
}

class TileInfo:
    var tilled: bool
    var watered: bool
    var crop: Crop

@onready var tile_map: TileMapLayer = $FarmTileMap

var crop_scene: PackedScene = preload("res://Scenes/crop.tscn")
var used_cells_to_tile_info: Dictionary[Vector2i, TileInfo]
var tyle_type_to_tile_set_coordinates: Dictionary[TileType, Vector2i] = {
    TileType.UNTILLED_GRASS: Vector2i(0, 0),
    TileType.TILLED_GRASS: Vector2i(1, 0),
    TileType.TILLED_AND_WATERED_GRASS: Vector2i(0, 1),
}
