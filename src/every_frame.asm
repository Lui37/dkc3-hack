@include

every_frame:
		LDA !counter_60hz
		SEC
		SBC !previous_60hz
		TAY
		CLC
		ADC !real_frames_elapsed
		STA !real_frames_elapsed
		TYA
		DEC
		CLC
		ADC !dropped_frames
		STA !dropped_frames
		
	.end:
		LDA !counter_60hz
		STA !previous_60hz
		
		LDA $4C
		STA $4A
		RTL
		