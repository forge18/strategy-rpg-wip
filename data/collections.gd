extends Node


enum CollectionsEnum {
	ABILITY,
	ATTRIBUTE,
	JOB,
	RESERVE,
	UNIT
}

const collection_enums: Dictionary = {
	CollectionsEnum.ABILITY: preload("res://data/ability/enums/ability_enum.gd").AbilityEnum,
	CollectionsEnum.ATTRIBUTE: preload("res://data/attribute/enums/attribute_enum.gd").AttributeEnum,
	CollectionsEnum.JOB: preload("res://data/job/enums/job_enum.gd").JobEnum,
	CollectionsEnum.RESERVE: preload("res://data/reserve/enums/reserve_enum.gd").ReserveEnum,
	CollectionsEnum.UNIT: preload("res://data/unit/enums/unit_enum.gd").UnitEnum
}

const collections: Dictionary = {
	CollectionsEnum.ABILITY: preload("res://data/ability/loader/ability_loader.gd").Ability,
	CollectionsEnum.ATTRIBUTE: preload("res://data/attribute/loader/attribute_loader.gd").Attribute,
	CollectionsEnum.JOB: preload("res://data/job/loader/job_loader.gd").Job,
	CollectionsEnum.RESERVE: preload("res://data/reserve/loader/reserve_loader.gd").Reserve,
	CollectionsEnum.UNIT: preload("res://data/unit/loader/unit_loader.gd").Unit
}

func get_collection_enum(collection_id: int):
	return collection_enums[collection_id]

func get_entity_from_collection(collection_id: int, entity_id: int) -> Resource:
	return collections[collection_id][entity_id]	
