extends Resource
class_name ReserveSchema


export(String) var name: String
export(int) var current_value: int
export(int) var max_value: int

func _ready():
	EventBus.connect("resource_max_changed", self, "_on_EventBus_resource_max_changed")

func decrease(amount: int):
	current_value -= amount

func increase(amount: int):
	current_value += amount

func reset():
	current_value = max_value


func _on_EventBus_resource_max_changed(entity_id: int, resource_type: String, new_value: int):
	if entity_id == get_instance_id():
		if resource_type == name:
			max_value = new_value
