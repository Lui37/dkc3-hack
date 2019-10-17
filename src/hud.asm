@include

handle_displays:
		SEP #$20
		LDA !fade_type
		BMI .skip_update
		LDA !timer_stopped
		BNE .draw
		
	.update:
		LDA !timer_frames
		STA !timer_disp_frames
		LDA !timer_seconds
		STA !timer_disp_seconds
		LDA !timer_minutes
		STA !timer_disp_minutes
		
	.skip_update:
		; checking here lets the timer tick on the first frame you hit the goal
		; to properly account for lag frames
		LDA !goal_flag
		CMP #$40
		BNE +
		INC !timer_stopped
	+
		
	.draw:
		REP #$20
		; starting x position
		LDX #!timer_x
		; starting y position
		LDA #!timer_y
		STA $1A
		
		LDA !timer_disp_minutes
		JSR draw_digit
		; 2 pixels padding
		INX
		INX
		; tens
		LDA !timer_disp_seconds
		LSR #4
		JSR draw_digit
		; units
		LDA !timer_disp_seconds
		AND #$000F
		JSR draw_digit
		INX
		INX
		; tens
		LDA !timer_disp_frames
		LSR #4
		JSR draw_digit
		; units
		LDA !timer_disp_frames
		AND #$000F
		JSR draw_digit
		
draw_dropped_frames:
		; starting x position
		LDX #!dropped_frames_x
		; starting y position
		LDA #!dropped_frames_y
		STA $1A
		
		; check hundreds
		LDA !dropped_frames
		CMP #$0999
		BCC .no_cap
		LDA #$0009
		JSR draw_digit
		LDA #$0009
		JSR draw_digit
		LDA #$0009
		BRA .last
		
	.no_cap:
		; hundreds
		XBA
		AND #$00FF
		JSR draw_digit
		; tens
		LDA !dropped_frames
		LSR #4
		AND #$000F
		JSR draw_digit
		; units
		LDA !dropped_frames
		AND #$000F
	.last:
		JSR draw_digit
		RTL
		
		
draw_digit:
		LDY $82
		CLC
		ADC #$01CC
		ORA $3E
		STA $0002,y
		ADC #$000A
		STA $0006,y
		TXA
		ORA $1A
		STA $0000,y
		CLC
		ADC #$0800
		STA $0004,y
		TYA
		CLC
		ADC #$0008
		STA $82
		TXA
		CLC
		ADC #$0008
		TAX
		RTS
