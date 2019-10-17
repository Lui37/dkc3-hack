@include

on_goal:
		STA !goal_flag
		JML $BEC02A


every_igt_frame:
		JSR tick_timer
		INC $00
		INC $C2
		RTL
		
tick_timer:
		; decimal mode
		SEP #$28
		LDA !timer_stopped
		BNE .done
		
		; skip if game is paused
		BIT !pause_flags
		BVS .done
		
		LDA !timer_frames
		CLC
		ADC !real_frames_elapsed
		STA !timer_frames
		CMP #$60
		BCC .done
		
		SBC #$60
		STA !timer_frames
		TDC
		ADC !timer_seconds
		STA !timer_seconds
		CMP #$60
		BCC .done
		
		SBC #$60
		STA !timer_seconds
		TDC
		ADC !timer_minutes
		STA !timer_minutes
		CMP #$10
		BCC .no_cap
		LDA #$59
		STA !timer_frames
		LDA #$59
		STA !timer_seconds
		LDA #$59
	.no_cap:
		STA !timer_minutes
	.done:
		REP #$28
		RTS
		