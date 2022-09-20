extends Reference


const UnitEnum = preload("res://data/unit/enums/unit_enum.gd").UnitEnum

const Unit: Dictionary = {
	UnitEnum.SALLY: preload("res://data/unit/sally.tres"),
	UnitEnum.TIM: preload("res://data/unit/tim.tres"),
	UnitEnum.WYATT: preload("res://data/unit/wyatt.tres")
}
