all: mymain

CC=gcc
STRIP=strip
UPX=echo

mymath.o: mymath.c mymath.h
	$(CC) -fPIC -c -o $@ mymath.c
libmymath.so: mymath.o
	$(CC) -shared -Wl,-init=my_init -o $@ mymath.o
	$(STRIP) --strip-unneeded $@
	$(UPX) $@
mymain.o: mymain.c mymath.h
	$(CC) -c -o $@ mymain.c
	$(STRIP) --strip-unneeded $@
mymain: mymain.o libmymath.so
	$(CC) -Wl,-no-as-needed -L. -lmymath -o $@ mymain.o
	$(UPX) $@
