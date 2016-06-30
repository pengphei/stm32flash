PREFIX = /usr/local
CFLAGS += -Wall -g

INSTALL = install

OBJS =	src/dev_table.o	\
	src/i2c.o		\
	src/init.o		\
	src/main.o		\
	src/port.o		\
	src/serial_common.o	\
	src/serial_platform.o	\
	src/stm32.o		\
	src/utils.o

LIBOBJS = parsers/parsers.a

all: stm32flash

serial_platform.o: src/serial_posix.c src/serial_w32.c

parsers/parsers.a: force
	cd parsers && $(MAKE) parsers.a

stm32flash: $(OBJS) $(LIBOBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBOBJS)

clean:
	rm -f $(OBJS) stm32flash
	cd parsers && $(MAKE) $@

install: all
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -m 755 stm32flash $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/man/man1
	$(INSTALL) -m 644 doc/stm32flash.1 $(DESTDIR)$(PREFIX)/share/man/man1

force:

.PHONY: all clean install force
