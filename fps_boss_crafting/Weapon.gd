extends Item
class_name Weapon

enum {
	WAND,
	SHOTWAND,
	MACHINEWAND
}

var equipped = false
var sound
var animation_name: String
var texture: Texture

func _init(type: int = WAND):
	match type:
		WAND:
			name = "wand"
			icon_path = "res://Textures/Item/skull.png"
			equipped = false
			sound = SoundPlayer.GUNSHOT
			animation_name = "shoot"
			texture = load("res://Textures/Player/wand.png")
		SHOTWAND:
			name = "shotwand"
			icon_path = "res://Textures/Item/eye.png"
			equipped = false
			sound = SoundPlayer.SHOTGUN
			animation_name = "shotgun shoot"
			texture = load("res://Textures/Player/shotwand.png")
		MACHINEWAND:
			name = "machinewand"
			icon_path = "res://Textures/Item/witch_hat.png"
			equipped = false
			sound = SoundPlayer.MACHINEGUN
			animation_name = "machinegun shoot"
			texture = load("res://Textures/Player/machinewand.png")
			
func equip():
	equipped = true
	
func dequip():
	equipped = false
	
func is_equipped():
	return equipped
	
func get_sound():
	return sound
	
func get_animation_name():
	return animation_name
	
func get_texture():
	return texture
