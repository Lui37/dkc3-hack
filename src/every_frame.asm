@include

every_frame:
		LDA !counter_60hz
		SEC
		SBC !previous_60hz
		STA !real_frames_elapsed
		DEC
		BMI .end
		SED
		CLC
		ADC !dropped_frames
		STA !dropped_frames
		CLD
	.end:
		LDA !counter_60hz
		STA !previous_60hz
		
		LDA $4C
		STA $4A
		RTL
		