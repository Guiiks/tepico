all: 
	ocamllex lexer.mll
	ocamlyacc -v parser.mly 
	ocamlc -c syntax.mli
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c dot2D3.ml
	ocamlc -c main.ml
	ocamlc -o main lexer.cmo 	parser.cmo dot2D3.cmo main.cmo

clean:
	rm -rf main *.cmo *.cmi parser.mli *~ lexer.ml parser.ml parser.output
	rm output/*.html