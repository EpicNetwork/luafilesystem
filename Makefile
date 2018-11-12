T= lfs

CONFIG= ./config

include $(CONFIG)

SRCS= src/$T.c
OBJS= src/$T.o

# For Linux
linux:
	make src/lfs.so "DLLFLAGS = -shared -fPIC"

# For Mac OS
macosx:
	make src/lfs.so "DLLFLAGS = -bundle -undefined dynamic_lookup"

src/lfs.so: $(OBJS)
	$(CC) $(DLLFLAGS) -o src/lfs.so $(OBJS)

# For 32-bit Windows
win32:
	make src/lfs.dll "DLLFLAGS = -shared -fPIC"

# For 64-bit Windows
win64:
	make src/lfs.dll "DLLFLAGS = -shared -fPIC"

src/lfs.dll: $(OBJS)
	$(CC) $(DLLFLAGS) -o src/lfs.dll $(OBJS)

clean:
	rm -f src/lfs.so src/lfs.dll $(OBJS)
