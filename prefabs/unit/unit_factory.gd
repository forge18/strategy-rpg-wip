extends Node
class_name UnitFactory


const unit_prefab = preload("res://prefabs/unit/Unit.tscn")

static func generate_unit():
	var unit = unit_prefab.duplicate()
