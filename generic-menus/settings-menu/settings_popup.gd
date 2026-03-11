extends Popup

@export var previous_volume : float
@export var volume : float
@export var resolution : Vector2i
@export var is_fullscreen : bool
@export var is_borderless : bool
@export var msaa : int
@export var vsync : bool

func set_button_values():
	$"GridContainer/VolumeSlider".value = volume
	if is_fullscreen: $"GridContainer/DisplayOptions".selected = 1
	elif borderless: $"GridContainer/DisplayOptions".selected = 2
	else: $"GridContainer/DisplayOptions".selected = 0
	for id in $"GridContainer/ResolutionOptions".get_item_count():
		if int($"GridContainer/ResolutionOptions".get_item_text(id).split(" x ")[0]) == resolution.x:
			$"GridContainer/ResolutionOptions".select(id)
			break
	$"GridContainer/MSAAOptions".select(msaa)
	$"GridContainer/VsyncCheck".button_pressed = vsync

func _on_SettingsPopup_about_to_show():
	previous_volume = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	volume = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	resolution = DisplayServer.window_get_size()
	is_fullscreen = ((DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == DisplayServer.WINDOW_MODE_FULLSCREEN))
	borderless = DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS)
	if is_fullscreen: $"GridContainer/ResolutionOptions".disabled = true
	msaa = get_viewport().msaa_2d
	vsync = (DisplayServer.window_get_vsync_mode() != DisplayServer.VSYNC_DISABLED)
	set_button_values()

func _on_VolumeSlider_value_changed(value):
	volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(volume))

func _on_DisplayOptions_item_selected(id):
	# 0 is Windowed, 1 is Fullscreen, 2 is Borderless
	match id:
		0:
			borderless = false
			is_fullscreen = false
		1:
			borderless = true
			is_fullscreen = true
		2:
			borderless = true
			is_fullscreen = false
	if is_fullscreen: $"GridContainer/ResolutionOptions".disabled = true
	else: $"GridContainer/ResolutionOptions".disabled = false

func _on_ResolutionOptions_item_selected(id):
	var selected_resolution = $"GridContainer/ResolutionOptions".get_item_text(id).split(" x ")
	resolution = Vector2i(int(selected_resolution[0]), int(selected_resolution[1]))

func _on_MSAAOptions_item_selected(id):
	msaa = id

func _on_VsyncCheck_pressed():
	vsync = $"GridContainer/VsyncCheck".pressed

func _on_Reset_pressed():
	volume = 1
	resolution = Vector2i(1920, 1080)
	borderless = true
	is_fullscreen = true
	$"GridContainer/ResolutionOptions".disabled = true
	msaa = 0
	vsync = true
	set_button_values()

func _on_Cancel_pressed():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(previous_volume))
	hide()

func _on_Save_pressed():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(volume))
	DisplayServer.window_set_size(resolution)
	DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN if (is_fullscreen) else DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
	get_window().borderless = borderless
	get_window().msaa_2d = msaa as Viewport.MSAA
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if (vsync) else DisplayServer.VSYNC_DISABLED)
	hide()
