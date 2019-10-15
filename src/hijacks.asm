@include

org hijack_every_frame
		JSL every_frame
		
org hijack_map
		JSR hijack_map_jump
		
org $B4FFFB
hijack_map_jump:
		JSL every_map_frame
		RTS
		
org hijack_lives
		JSL handle_displays
		RTS
		
org hijack_goal
		JSL on_goal
		