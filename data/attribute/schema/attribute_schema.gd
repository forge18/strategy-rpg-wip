extends Resource
class_name AttributeSchema

const data_type_enum = preload("res://systems/modifier/enums/attribute_data_types_enum.gd")
const operator_enum = preload("res://systems/modifier/enums/operators_enum.gd")
const value_type_enum = preload("res://systems/modifier/enums/attribute_value_types_enum.gd")

var conditions_system = load("res://systems/modifier/condition/conditions_system.gd").new()

export(String) var name: String
export(data_type_enum.AttributeDataType) var value_type: int
export(int) var base_value: int
export(int) var min_value: int
export(int) var max_value: int
export(int) var modifier_value: int
export(int) var current_value: int

var modifiers = {}

func _ready():
	EventBus.connect("modifier_added", self, "_on_EventBus_modifier_added")
	EventBus.connect("modifier_calculated", self, "_on_EventBus_modifier_calculated")
	EventBus.connect("modifier_removed", self, "_on_EventBus_modifier_removed")

func _calculate_modifier_value():
	var new_value = 0
	for modifier_id in modifiers:
		var modifier = modifiers[modifier_id]

		var is_passing = true
		for condition in modifier["conditions"]:
			var result = conditions_system.execute_condition(condition["condition_id"], condition["arguments"])
			if result == false:
				is_passing = false

		if is_passing:
			match modifier["operator"]:
				operator_enum.Operator.ADD:
					new_value += modifier["value"]
				operator_enum.Operator.SUBTRACT:
					new_value -= modifier["value"]
				operator_enum.Operator.MULTIPLY:
					new_value *= modifier["value"]
				operator_enum.Operator.DIVIDE:
					new_value /= modifier["value"]

	modifier_value = new_value

func _remove_modifier(modifier_id: int):
	var modifier = modifiers.get(modifier_id)
	if modifier["attribute"] == name:
		modifiers.erase(modifier["entity_id"])

func _advance_duration(modifier_id: int):
	var modifier = modifiers[modifier_id]
	if modifier["duration"] <= 1:
		_remove_modifier(modifier_id)
	else:
		modifier["duration"] -= 1

func add(value_type: int, value: int):
	match value_type:
		value_type_enum.AttributeValueType.BASE:
			base_value += value
		value_type_enum.AttributeValueType.CURRENT:
			current_value += value
		value_type_enum.AttributeValueType.MAX:
			max_value += value
		value_type_enum.AttributeValueType.MIN:
			min_value += value

func subtract(value_type: int, value: int):
	match value_type:
		value_type_enum.AttributeValueType.BASE:
			base_value -= value
		value_type_enum.AttributeValueType.CURRENT:
			current_value =- value
		value_type_enum.AttributeValueType.MAX:
			max_value -= value
		value_type_enum.AttributeValueType.MIN:
			min_value -= value

func multiply(value_type: int, value: int):
	match value_type:
		value_type_enum.AttributeValueType.BASE:
			base_value *= value
		value_type_enum.AttributeValueType.CURRENT:
			current_value *= value
		value_type_enum.AttributeValueType.MAX:
			max_value *= value
		value_type_enum.AttributeValueType.MIN:
			min_value *= value

func divide(value_type: int, value: int):
	match value_type:
		value_type_enum.AttributeValueType.BASE:
			base_value /= value
		value_type_enum.AttributeValueType.CURRENT:
			current_value /= value
		value_type_enum.AttributeValueType.MAX:
			max_value /= value
		value_type_enum.AttributeValueType.MIN:
			min_value /= value


func _on_EventBus_modifier_added(modifier: Dictionary):
	var entity_id = modifier["target_entity_id"]
	if get_instance_id() == entity_id:
		if modifier["attribute"] == name:
			var modifier_id = modifier["id"]
			modifiers[modifier_id] = modifier

func _on_EventBus_modifier_calculated(entity_id: int):
	if get_instance_id() == entity_id:
		_calculate_modifier_value()

func _on_EventBus_modifier_removed(entity_id: int, modifier_id: int):
	if get_instance_id() == entity_id:
		if not modifiers.has(modifier_id):
			return
		modifiers.erase(modifier_id)
