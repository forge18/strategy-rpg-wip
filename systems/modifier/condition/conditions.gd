extends Reference


const ConditionsEnum = preload("res://systems/modifier/condition/conditions_enum.gd")


var conditions = {
	ConditionsEnum.IS_DEAD: funcref(self, "is_dead")
}

############################################

func _get_condition(condition_enum_id):
	if conditions.has(condition_enum_id):
		return conditions.get(condition_enum_id)
	return null

############################################

static func is_dead(arguments: Array):
	pass
