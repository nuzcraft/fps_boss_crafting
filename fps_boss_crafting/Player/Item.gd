class_name Item

enum {
	SKULL,
	EYE,
}

var name: String
var icon_path: String

func _init(type: int = SKULL):
	match type:
		SKULL:
			name = "skull"
			icon_path = "res://Textures/Item/skull.png"
		EYE:
			name = "eye"
			icon_path = "res://Textures/Item/eye.png"
			
func get_name() -> String:
	return name
	
func get_icon_path() -> String:
	return icon_path
		
