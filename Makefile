u:
	cp sfc/dkc3_u.sfc target/dkc3hack_u.sfc && cd src && asar -Drom_revision=0 --fix-checksum=off main.asm ../target/dkc3hack_u.sfc && cd -
	
j1.0:
	cp sfc/dkc3_j1.0.sfc target/dkc3hack_j1.0.sfc && cd src && asar -Drom_revision=1 --fix-checksum=off main.asm ../target/dkc3hack_j1.0.sfc && cd -

j1.1:
	cp sfc/dkc3_j1.1.sfc target/dkc3hack_j1.1.sfc && cd src && asar -Drom_revision=2 --fix-checksum=off main.asm ../target/dkc3hack_j1.1.sfc && cd -
	
j1.0ss:
	cp "sfc/DKC3 Practice 0.10.sfc" "target/DKC3 Practice 0.10 + timer.sfc" && cd src && asar -Drom_revision=1 main.asm "../target/DKC3 Practice 0.10 + timer.sfc" && cd -

all: u j1.0 j1.1 j1.0ss

clean:
	rm -f target/*
