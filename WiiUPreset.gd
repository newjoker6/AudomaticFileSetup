extends Node

var path = ""
var temp_path = "res://"


var File_Structure = {
	"code":{},
	"content":{
		"assets":{},
		"common":{},
		"mess":{},
		"rpls":{},
		"sound":{}
	},
	"meta":{}
}

func _ready():
	print("WiiU Ready")


func _create_folders(path):
	if path == "":
		print("Missing path")
	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		
		for key in File_Structure.keys():
				dir.make_dir("%s/%s" %[path, key])
		
		for folder in File_Structure["content"].keys():
			dir.make_dir("%s/content/%s" %[path, folder])


