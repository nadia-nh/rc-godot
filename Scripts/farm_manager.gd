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

var _crop_scene: PackedScene = preload("res://Scenes/crop.tscn")
var _used_cells_to_tile_info: Dictionary[Vector2i, TileInfo]
var _tile_type_to_tile_set_coords := {
    TileType.UNTILLED_GRASS: Vector2i(0, 0),
    TileType.TILLED_GRASS: Vector2i(1, 0),
    TileType.TILLED_AND_WATERED_GRASS: Vector2i(0, 1),
}

@onready var tile_map: TileMapLayer = $FarmTileMap

func _ready():
    # TODO: Connect to signals
    
    # Initialize _used_cells_to_tile_info map
    for cell in tile_map.get_used_cells():
        _used_cells_to_tile_info[cell] = TileInfo.new()

func set_tile_state(coords: Vector2i, tile_type: TileType):
    # Update the sprite
    # Source_id = 0 since we're using the first and only tile_set / atlas
    tile_map.set_cell(coords, 0, _tile_type_to_tile_set_coords[tile_type])

    # Update the tile info
    match tile_type:
        TileType.UNTILLED_GRASS:
            _used_cells_to_tile_info[coords].tilled = false
            _used_cells_to_tile_info[coords].watered = false
        TileType.TILLED_GRASS:
            _used_cells_to_tile_info[coords].tilled = true
            _used_cells_to_tile_info[coords].watered = false
        TileType.TILLED_AND_WATERED_GRASS:
            _used_cells_to_tile_info[coords].tilled = true
            _used_cells_to_tile_info[coords].tilled = true
