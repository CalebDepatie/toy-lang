.PHONY: all clean

all:
	gdc src/main.d src/lexer.d src/parser.d

clean:
	rm a.out
