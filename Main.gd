extends Control

##### Shorthand Variables #####
onready var File_Browser = $file_dialog
onready var Dir_Path = $Dir_Selected
onready var Browse = $Browse_Button
onready var Presets = $Preset_Selections


##### Data Variables #####
var preset_options = ["Select File Preset"]
var preset_list = ["Unity", "Unreal", "WiiU", "Bethesda"]
var selected_preset = ""


##### On Boot Code #####

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()
	_add_presets()


##### Reusable Code #####



##### Signal Connections #####
func _connect_signals():
	Browse.connect("pressed", self, "_on_Browse_Button_pressed")
	File_Browser.connect("dir_selected", self, "_on_file_dialog_dir_selected")
	Presets.connect("item_selected", self, "_on_presets_selection")



func _on_file_dialog_dir_selected(dir):
	print("Selected %s" %dir)
	Dir_Path.text = dir



func _on_Browse_Button_pressed():
	File_Browser.popup_centered()



func _on_presets_selection(idx):
	selected_preset = Presets.get_item_text(idx)
	print(selected_preset)



func _on_button_pressed():
	if Dir_Path.text != "" and selected_preset in preset_options:
		match selected_preset:
			"Bethesda":
				print("creating folders")
				Bethesda._create_folders(Dir_Path.text)
			
			"Unity":
				print("creating folders")
				Unity._create_folders(Dir_Path.text)
			
			"Unreal":
				print("creating folders")
				Unreal._create_folders(Dir_Path.text)
			
			"WiiU":
				print("creating folders")
				WiiU._create_folders(Dir_Path.text)



##### Running Code #####
func _add_presets():
	preset_list.sort()
	for option in preset_list:
		preset_options.append(option)
	for option in preset_options:
		Presets.add_item(option)
		Presets.add_separator()
	
	Presets.set_item_disabled(0, true)


























