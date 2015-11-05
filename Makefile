all: cunit

cunit: holamundo.o holamundo-test.c
	gcc -Wall -Werror --coverage -o holamundo-test holamundo.o holamundo-test.c -lcunit

lcov: holamundo.o 
	lcov --capture --directory . --output-file coverage.info
	genhtml coverage.info --output-directory coverage	

holamundo.o: holamundo.h holamundo.c
	gcc -Wall -Werror -c --coverage holamundo.c

clean:
	rm -rf *~ *.o core holamundo holamundo-test *.tst coverage coverage.info *.gcno *.gcda
