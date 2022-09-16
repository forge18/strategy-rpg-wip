extends Resource
class_name UnitSchema


# Replace these with the "Collections" singleton after bug fixed
const Attributes = preload("res://data/collections.gd").Attribute
const AttributeEnum = preload("res://data/collections.gd").AttributeEnum
const BehaviorEnum = preload("res://data/collections.gd").BehaviorEnum
const JobEnum = preload("res://data/collections.gd").JobEnum

export(String) var name: String
export(String) var description: String
export(JobEnum) var job: int
export(BehaviorEnum) var behavior: int

var resources: Dictionary = {

}

var attributes: Dictionary = {
	AttributeEnum.HEALTH: Attributes[AttributeEnum.Health].duplicate(),
	AttributeEnum.MANA: Attributes[AttributeEnum.Mana].duplicate()
}


