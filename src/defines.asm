@include

; define rom locations based on rom revision
if !rom_revision == 0
	hijack_every_frame = $808389
	freerom_B3 = $B3F957
	hijack_map = $B4B293
	hijack_lives = $BBB16C
	end_bananas = $BBB310
elseif !rom_revision == 1

elseif !rom_revision == 2

endif
	
; constants
!dropped_frames_x = $0008
!dropped_frames_y = $0900
!timer_x = $00CC
!timer_y = $0900

; wram
!freeram = $1E00

!fade_type = $04EE
!level_state = $05AF

!counter_60hz = $5A
!previous_60hz = !freeram+0

!dropped_frames = !freeram+2
!real_frames_elapsed = !freeram+4

!timer_frames = !freeram+6
!timer_seconds = !freeram+8
!timer_minutes = !freeram+10

!timer_stopped = !freeram+12
!timer_started = !freeram+13
