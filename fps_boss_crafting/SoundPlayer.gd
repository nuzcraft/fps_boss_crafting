extends Node

const GUNSHOT := preload("res://Sounds/V_22P_trimmed.ogg")

onready var audioPlayers := $AudioPlayers
onready var musicPlayers := $MusicPlayers

func play_sound(sound):	
	for audioStreamPlayer in audioPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break

func play_music(sound):	
	for audioStreamPlayer in musicPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break
			
func stop_music():
	for audioStreamPlayer in musicPlayers.get_children():
		if audioStreamPlayer.playing:
			audioStreamPlayer.stop()
