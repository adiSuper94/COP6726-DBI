CC = g++ -O2 -Wno-deprecated 

tag = -i

ifdef linux
tag = -n
endif


main:   y.tab.o lex.yy.o main.o
	$(CC) -o main y.tab.o lex.yy.o main.o -lfl

main.o : main.cc
	$(CC) -g -c main.cc

a4-1.out: Record.o Comparison.o ComparisonEngine.o Schema.o HeapDBFile.o BaseDBFile.o SortedDBFile.o BigQ.o Run.o File.o Pipe.o DBFile.o Statistics.o y.tab.o lex.yy.o test.o
	$(CC) -o a4-1.out Record.o Comparison.o ComparisonEngine.o Schema.o HeapDBFile.o BaseDBFile.o SortedDBFile.o BigQ.o Run.o File.o Pipe.o DBFile.o Statistics.o y.tab.o lex.yy.o test.o -lfl -lpthread
	
test.o: test.cc
	$(CC) -g -c test.cc

Statistics.o: Statistics.cc
	$(CC) -g -c Statistics.cc

Comparison.o: Comparison.cc
	$(CC) -g -c Comparison.cc
	
ComparisonEngine.o: ComparisonEngine.cc
	$(CC) -g -c ComparisonEngine.cc
	
DBFile.o: DBFile.cc
	$(CC) -g -c DBFile.cc

File.o: File.cc
	$(CC) -g -c File.cc

Record.o: Record.cc
	$(CC) -g -c Record.cc

Schema.o: Schema.cc
	$(CC) -g -c Schema.cc

Pipe.o: Pipe.cc
	$(CC) -g -c Pipe.cc

BigQ.o: BigQ.cc
	$(CC) -g -c BigQ.cc

HeapDBFile.o: HeapDBFile.cpp
	$(CC) -g -c HeapDBFile.cpp

BaseDBFile.o: BaseDBFile.cpp
	$(CC) -g -c BaseDBFile.cpp

SortedDBFile.o: SortedDBFile.cpp
	$(CC) -g -c SortedDBFile.cpp

Run.o: Run.cpp
	$(CC) -g -c Run.cpp

y.tab.o: Parser.y
	yacc -d Parser.y
	sed $(tag) y.tab.c -e "s/  __attribute__ ((__unused__))$$/# ifndef __cplusplus\n  __attribute__ ((__unused__));\n# endif/"
	g++ -c y.tab.c

lex.yy.o: Lexer.l
	lex  Lexer.l
	gcc  -c lex.yy.c

yyfunc.tab.o: ParserFunc.y
	yacc -p "yyfunc" -b "yyfunc" -d ParserFunc.y
	#sed $(tag) yyfunc.tab.c -e "s/  __attribute__ ((__unused__))$$/# ifndef __cplusplus\n  __attribute__ ((__unused__));\n# endif/"
	g++ -c yyfunc.tab.c


clean: 
	rm -f *.o
	rm -f *.out
	rm -f y.tab.c
	rm -f lex.yy.c
	rm -f y.tab.h
