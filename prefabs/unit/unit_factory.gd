extends Node
class_name UnitFactory


var CollectionsEnum = Collections.get_collections_enum()
var UnitEnum = Collections.get_collection_enum(CollectionsEnum.UNIT)

var unit_collection = Collections.get_collection(CollectionsEnum.UNIT)

const unit_prefab = preload("res://prefabs/unit/Unit.tscn")

func _generate_unit_prefab() -> Node:
	return unit_prefab.instance()

