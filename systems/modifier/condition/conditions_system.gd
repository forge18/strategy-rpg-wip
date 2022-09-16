extends Reference
class_name ConditionSystem


var conditions = preload("res://systems/modifier/condition/conditions.gd").new()

func get_condition(condition_enum_id):
	return conditions._get_condition(condition_enum_id)

func execute_condition(condition_enum_id: int, arguments: Array):
	var condition = get_condition(condition_enum_id)
	return condition.call_func(arguments)
