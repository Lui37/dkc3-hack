hirom

; 0 for u1.0
; 1 for j1.0
; 2 for j1.1
!rom_revision ?= 0

incsrc "defines.asm"

incsrc "edits.asm"
incsrc "hijacks.asm"

org freerom
incsrc "every_frame.asm"
incsrc "level.asm"
incsrc "map.asm"
incsrc "hud.asm"