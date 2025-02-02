EXEC = lexer
SRC = src/lexer.l
OBJ = lex.yy.c
CC = gcc
CFLAGS = -ll

all: $(EXEC)

lex.yy.c: $(SRC)
	flex $(SRC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC) $(CFLAGS)

clean:
	rm -f lex.yy.c $(EXEC)

.PHONY: all clean