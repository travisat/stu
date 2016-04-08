# st - simple terminaul
# See LICENSE file for copyright and license details.

include config.mk

SRC = stu.c
OBJ = ${SRC:.c=.o}

all: options stu

options:
	@echo stu build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.mk

stu: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f stu ${OBJ} stu-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p stu-${VERSION}
	@cp -R LICENSE Makefile README config.mk config.h stu.info stu.1 arg.h ${SRC} stu-${VERSION}
	@tar -cf stu-${VERSION}.tar stu-${VERSION}
	@gzip stu-${VERSION}.tar
	@rm -rf stu-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f stu ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/stu
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < stu.1 > ${DESTDIR}${MANPREFIX}/man1/stu.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/stu.1
	@echo Please see the README file regarding the terminfo entry of stu.
	@tic -s stu.info

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/stu
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/stu.1

.PHONY: all options clean dist install uninstall
