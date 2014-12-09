all:
	bison -d graphviz.y
	mv graphviz.tab.c graphviz.y.c
	flex graphviz.l
	mv lex.yy.c graphviz.lex.c
	gcc -c graphviz.lex.c -o graphviz.lex.o
	gcc -c graphviz.lex.c -o graphviz.lex.o
	gcc -c graphviz.y.c -o graphviz.y.o
	gcc -o graphviz graphviz.lex.o graphviz.y.o -ll -lm