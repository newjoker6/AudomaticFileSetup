extends Control

##### Shorthand Variables #####
onready var File_Browser = $file_dialog
onready var Dir_Path = $Dir_Selected
onready var Browse = $Browse_Button
onready var Presets = $Preset_Selections


##### Data Variables #####
var preset_options = ["Select File Preset"]
var preset_list = ["Unity", "Unreal", "WiiU", "Bethesda"]
var sorted_presets= []
var selected_preset = ""
var custom_presets = []

var preset_folder = str(OS.get_executable_path().replace(OS.get_executable_path().get_file(), "")) + "Presets"
#var preset_folder = "E:/PCUSER/Documents/AppDev/PRESET_TEST_FOLDER"


##### On Boot Code #####

# Called when the node enters the scene tree for the first time.
func _ready():
	print(preset_folder)
	_create_presets_folder(str(OS.get_executable_path().replace(OS.get_executable_path().get_file(), "")))
	_connect_signals()
	_reload_presets()
	save_demo()


##### Reusable Code #####
func _reload_presets():
	custom_presets.clear()
	sorted_presets.clear()
	Presets.clear()
	_check_for_presets(preset_folder)
	_add_presets()


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
	if Dir_Path.text != "" and selected_preset in sorted_presets and not selected_preset in custom_presets:
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
			
	elif selected_preset in custom_presets:
		 # set and load custom file structure
		Custom._create_folders(Dir_Path.text, selected_preset, preset_folder)


func _on_ReloadPresets_pressed():
	_reload_presets()


func _on_CreatePresetButton_pressed():
	pass # Replace with function body.



##### Running Code #####
func _add_presets():
	for cust in custom_presets:
		sorted_presets.append(cust)
	for option in preset_list:
		sorted_presets.append(option)
	sorted_presets.sort()
	sorted_presets.insert(0, "Select File Preset")
	for option in sorted_presets:
		Presets.add_item(option)
		Presets.add_separator()
	
	Presets.set_item_disabled(0, true)


func _create_presets_folder(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		dir.make_dir(preset_folder)
		


func save_demo():
	var f = File.new()
	f.open(preset_folder + "/demo.json", f.WRITE)
	f.store_line(to_json(Unreal.File_Structure))
	f.close()


func _check_for_presets(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				custom_presets.append(file_name.replace("." + file_name.get_extension(), ""))
			
			file_name = dir.get_next()
		































