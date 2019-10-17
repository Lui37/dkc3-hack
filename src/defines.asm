@include

; define rom locations based on rom revision
if !rom_revision == 0
	hijack_every_frame = $808389
	hijack_level = $808353
	freerom = $B3F957
	hijack_map = $B4B293
	hijack_goal = $B8ABE3
	hijack_lives = $BBB16C
	end_bananas = $BBB310
elseif !rom_revision == 1
	hijack_every_frame = $808378
	hijack_level = $808342
	freerom = $B3F957
	hijack_map = $B4B17B
	hijack_goal = $B8AC02
	hijack_lives = $BBB17E
	end_bananas = $BBB322
elseif !rom_revision == 2
	hijack_every_frame = $808378
	hijack_level = $808342
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

!freeram_used = 0
macro def_freeram(id, size)
	!<id> := !freeram+!freeram_used
	!freeram_used #= !freeram_used+<size>
endmacro

!fade_type = $04ED
!pause_flags = $05AF

!counter_60hz = $5A

%def_freeram(previous_60hz, 2)

%def_freeram(dropped_frames, 2)
%def_freeram(real_frames_elapsed, 2)

%def_freeram(timer_frames, 2)
%def_freeram(timer_seconds, 2)
%def_freeram(timer_minutes, 2)

%def_freeram(timer_disp_frames, 2)
%def_freeram(timer_disp_seconds, 2)
%def_freeram(timer_disp_minutes, 2)

%def_freeram(timer_stopped, 2)

%def_freeram(goal_flag, 2)


assert !freeram+!freeram_used < $2000, "exceeded freeram area"
