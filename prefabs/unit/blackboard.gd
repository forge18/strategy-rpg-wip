extends Node
class_name Blackboard

var data = {}

func get_value(key: String):
	return data[key]

func set_value(key: String, value) -> void:
	var previous_value = get_value(key)
	data[key] = value
	send_signal(key, previous_value, value)

func send_signal(key: String, previous_value, value):
	EventBus.emit_signal("blackboard_value_changed", {
		"unit_id": get_parent().unit_id,
		"key": key,
		"previous_value": previous_value,
		"value": value
	})
