LIBTOOL?=libtool

PGSQL_CFLAGS=-I `pg_config --includedir-server`
MYSQL_CFLAGS=`mysql_config --cflags`

SRC=pg_sphinx.c sphinx.c stringbuilder.c log.c
OBJ=$(SRC:.c=.lo)

libpgsphinx.la: $(OBJ)
	$(LIBTOOL) link gcc -module -g3 -o libpgsphinx.la $(OBJ) `mysql_config --libs_r` -rpath `pwd`

.c.lo:
	$(LIBTOOL) compile gcc -Wall -Wextra -Werror --std=c99 -pedantic -D_C99_SOURCE -D_POSIX_C_SOURCE -g3 -c $(PGSQL_CFLAGS) $(MYSQL_CFLAGS) $<

clean:
	rm -rf *.o *.lo .lib

.SUFFIXES: .c .lo .o

install: libpgsphinx.la
	$(LIBTOOL) install cp libpgsphinx.la `pg_config --pkglibdir`

uninstall:
	$(LIBTOOL) uninstall rm `pg_config --pkglibdir`/libpgsphinx.la

