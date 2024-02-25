all:
	flex ex5.l
	gcc lex.yy.c -o output -lfl -lm
	./output
