extends Reference


const AttributeEnum = preload("res://data/attribute/enums/attribute_enum.gd").AttributeEnum

const Attribute: Dictionary = {
	AttributeEnum.HEALTH_MAX: preload("res://data/attribute/health_max.tres"),
	AttributeEnum.MANA_MAX: preload("res://data/attribute/mana_max.tres")
}
