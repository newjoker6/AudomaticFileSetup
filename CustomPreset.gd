extends Node

#var path = ""
#var temp_path = "res://"


var File_Structure = {
}

func _ready():
	print("Custom Ready")


func _create_folders(path, preset_name, preset_folder):
	print("PATH", path)
	
	var f = File.new()
	f.open("%s/%s.json" %["E:/PCUSER/Documents/AppDev/Exports/Presets", preset_name], f.READ)
	File_Structure = parse_json(f.get_as_text())
	print(File_Structure)
	f.close()
	
	if path == "":
		print("Missing path")
	

	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()

		while file_name != "":
			for key1 in File_Structure.keys():
				dir.make_dir("%s/%s" %[path, key1])

				folder_set2(dir, path, key1)

				file_name = dir.get_next()
			
			
func folder_set2(dir, path, key1):
	if File_Structure[key1]:
		for key2 in File_Structure[key1]:
			dir.make_dir("%s/%s/%s" %[path, key1, key2])
			folder_set3(dir, path, key1, key2)
			
			
func folder_set3(dir, path, key1, key2):
	if File_Structure[key1][key2]:
		for key3 in File_Structure[key1][key2]:
			dir.make_dir("%s/%s/%s/%s" %[path, key1, key2, key3])
			folder_set4(dir, path, key1, key2, key3)
	
	
func folder_set4(dir, path, key1, key2, key3):
	if File_Structure[key1][key2][key3]:
		for key4 in File_Structure[key1][key2][key3]:
			dir.make_dir("%s/%s/%s/%s/%s" %[path, key1, key2, key3, key4])










