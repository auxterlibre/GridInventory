class_name InventorySlot
extends Control

var data:ItemData

onready var icon:TextureRect = $Icon
onready var background:ColorRect = $Background

func _ready():
	background.modulate.a = 0.1

func set_data(_data:ItemData):
	data = _data
	icon.texture = _data.icon
	icon.visible = true


func on_mouse_entered():
	background.modulate.a = 0.8


func on_mouse_exited():
	background.modulate.a = 0.1
