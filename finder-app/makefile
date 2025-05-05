# Check if CROSS_COMPILE is set, if so, use it for the compiler
ifdef CROSS_COMPILE
CC = $(CROSS_COMPILE)gcc
else
CC = gcc
endif


writer: writer.o
	$(CC) $(CFLAGS) writer.o -o writer
writer.o:
	$(CC) $(CFLAGS) -c writer.c -o writer.o
clean:
	rm -rf writer.o writer