extends Node

enum AbilityEnum {

}

enum BehaviorEnum {

}

enum JobEnum {
	KNIGHT,
	ROGUE,
	WIZARD
}

enum AttributeEnum {
	HEALTH,
	MANA
}

enum UnitEnum {
	SALLY,
	TIM,
	WYATT
}

##########################################################

const Ability: Dictionary = {

}

const Behavior: Dictionary = {

}

const Job: Dictionary = {
	JobEnum.KNIGHT: preload("res://data/job/knight.tres"),
	JobEnum.ROGUE: preload("res://data/job/rogue.tres"),
	JobEnum.WIZARD: preload("res://data/job/wizard.tres")
}

const Attribute: Dictionary = {
	AttributeEnum.HEALTH: preload("res://data/attribute/health.tres"),
	AttributeEnum.MANA: preload("res://data/attribute/mana.tres")
}

const Unit: Dictionary = {
	UnitEnum.SALLY: preload("res://data/unit/sally.tres"),
	UnitEnum.TIM: preload("res://data/unit/tim.tres"),
	UnitEnum.WYATT: preload("res://data/unit/wyatt.tres")
}


