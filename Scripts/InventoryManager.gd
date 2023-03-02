class_name InventoryManager
extends Control

export var max_slots = 12
export var owned_items_list:Array

onready var slot_template:PackedScene = preload("res://Scenes/InventorySlot.tscn")
onready var grid:GridContainer = $Grid
onready var label:Label = $Label


func _ready():
	label.visible = false
	initialize()


func initialize():
	var new_slot
	for i in max_slots:
		new_slot = slot_template.instance()
		grid.add_child(new_slot)
		new_slot.connect("mouse_entered", self, "on_slot_mouse_entered", [new_slot])
		new_slot.connect("mouse_exited", self, "on_slot_mouse_exited", [new_slot])
	
	set_data(owned_items_list)


func set_data(_item_list:Array):
	var slot
	for i in _item_list.size():
		slot = grid.get_child(i)
		slot.set_data(_item_list[i])


func add_item(_item_data:ItemData):
	if owned_items_list.size() < max_slots:
		#Add item to list
		pass
	else:
		#Inventory is full
		pass


func remove_item(_item_data):
	owned_items_list.erase(_item_data)


func on_slot_mouse_entered(slot):
	if slot.data == null:
		return
		
	label.text = slot.data.name
	label.text += "\n"
	label.text += slot.data.description
	label.visible = true
	
	slot.on_mouse_entered()


func on_slot_mouse_exited(slot):
	label.visible = false
	slot.on_mouse_exited()
