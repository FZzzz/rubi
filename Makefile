CFLAGS = -Wall -m32 -g -mstackrealign -std=gnu99 -O2
C = $(CC) $(CFLAGS)

rubi: lex.o engine.o codegen.o
	$(C) -o $@ $^

minilua: dynasm/minilua.c
	$(CC) -Wall -std=gnu99 -O2 -o $@ $< -lm

engine.o: engine.c rubi.h
	$(C) -o $@ -c engine.c

lex.o: lex.c
	$(C) -o $@ -c lex.c

codegen.o: parser.h parser.dasc expr.dasc stdlib.dasc minilua
	cat parser.dasc expr.dasc stdlib.dasc | ./minilua dynasm/dynasm.lua -o codegen.c -
	$(C) -o $@ -c codegen.c

bench: rubi
	python bench.py > output.txt
	gnuplot runtime.gp

clean:
	$(RM) a.out rubi minilua *.o *~ text codegen.c runtime.png output.txt
