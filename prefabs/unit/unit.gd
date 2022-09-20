extends KinematicBody

var unit: Resource
var job: Resource
var attributes: Dictionary
var reserves: Dictionary
var abilities: Dictionary

var unit_id: int = get_instance_id()
var unit_name: int

func _init(new_unit_name: int):
	unit_name = new_unit_name

func _ready():
	_load_new_data()
	
func _load_new_data():
	var CollectionsEnum = Collections.CollectionsEnum
	unit = Collections.get_entity_from_collection(CollectionsEnum.UNIT, unit_name).duplicate()
	
	var job_id = unit["job"]
	job = Collections.get_entity_from_collection(CollectionsEnum.JOB, job_id).duplicate()
	
	var AttributesEnum = Collections.get_collection_enum(CollectionsEnum.ATTRIBUTE)
	attributes = {
		AttributesEnum.HEALTH_MAX: Collections.get_entity_from_collection(CollectionsEnum.ATTRIBUTE, AttributesEnum.HEALTH_MAX).duplicate(),
		AttributesEnum.MANA_MAX: Collections.get_entity_from_collection(CollectionsEnum.ATTRIBUTE, AttributesEnum.MANA_MAX).duplicate(),
	}
	
	var ReservesEnum = Collections.get_collection_enum(CollectionsEnum.RESERVE)
	reserves = {
		ReservesEnum.HEALTH: Collections.get_entity_from_collection(CollectionsEnum.RESERVE, ReservesEnum.HEALTH).duplicate(),
		ReservesEnum.MANA: Collections.get_entity_from_collection(CollectionsEnum.RESERVE, ReservesEnum.MANA).duplicate()
	}
	
