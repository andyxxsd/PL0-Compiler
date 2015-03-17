all: lex
lex: counter.o lex.o
	g++ lex.o counter.o -o lex -ll
lex.o: lex.yy.c
	gcc -c lex.yy.c -o lex.o
counter.o: counter.cpp
	g++ -c counter.cpp -o counter.o
lex.yy.c: PL0_LEX.lex
	flex PL0_LEX.lex
love: clean
clean:
	rm -f *.o lex lex.yy.c