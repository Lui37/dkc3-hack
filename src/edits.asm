@include

; u checksum
org $00FFDC
		dw $B28C^$FFFF, $B28C

org end_bananas
		RTS
		