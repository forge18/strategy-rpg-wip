extends Resource
class_name UnitJobSchema


# Replace these with the "Collections" singleton after bug fixed
const AbilityEnum = preload("res://data/collections.gd").AbilityEnum

export(String) var display_name: String
export(String) var description: String

export(AbilityEnum) var ability_1: int
export(AbilityEnum) var ability_2: int
export(AbilityEnum) var ability_3: int
export(AbilityEnum) var ability_4: int
