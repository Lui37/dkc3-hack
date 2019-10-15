@include

; define rom locations based on rom revision
if !rom_revision == 0
	hijack_every_frame = $808389
	freerom = $B3F957
	hijack_map = $B4B293
	hijack_goal = $B8ABE3
	hijack_lives = $BBB16C
	end_bananas = $BBB310
elseif !rom_revision == 1
	hijack_every_frame = $808378
	freerom = $B3F957
	hijack_map = $B4B17B
	hijack_goal = $B8AC02
	hijack_lives = $BBB17E
	end_bananas = $BBB322
elseif !rom_revision == 2
	hijack_every_frame = $808378
	freerom = $B9F907
	hijack_map = $B4B189
	hijack_goal = $B8AC15
	hijack_lives = $BBB17E
	end_bananas = $BBB322
endif

; constants
!dropped_frames_x = $0008
!dropped_frames_y = $0900
!timer_x = $00CC
!timer_y = $0900

; wram
!freeram = $1E30

!fade_type = $04ED

!counter_60hz = $5A
!previous_60hz = !freeram+0

!dropped_frames = !freeram+2
!real_frames_elapsed = !freeram+4

!timer_frames = !freeram+6
!timer_seconds = !freeram+8
!timer_minutes = !freeram+10

!timer_stopped = !freeram+12

!goal_flag = !freeram+14
