
(*
	This file contains the lexical parser, its aim is to "consome" char by char and send them to the syntaxic parser.
	Reference: http://caml.inria.fr/pub/docs/manual-ocaml-4.00/manual026.html
*)

{
	open Parser
	open String
	exception Eof
}

rule token = parse

	(* Data structures *)
	| ['g' 'G']['r' 'R']['a' 'A']['p' 'P']['h' 'H'] { GRAPH }
	| ['s' 'S']['u' 'U']['b' 'B']['g' 'G']['r' 'R']['a' 'A']['p' 'P']['h' 'H'] { SUBGRAPH }
	| ['s' 'S']['t' 'T']['r' 'R']['i' 'I']['c' 'C']['t' 'T'] { STRICT }
	| ['n' 'N']['o' 'O']['d' 'D']['e' 'E'] { NODE }
	| ['e' 'E']['d' 'D']['g' 'G']['e' 'E'] { EDGE }

	(* Brackets *)
	| '[' { LSBRA }
	| ']' { RSBRA }
	| '{' { LBRA }
	| '}' { RBRA }

	(* Separators *)
	| "--" { EDGE_SEPARATOR }
	| ';' { SEMICOLON }
	| ':' { COLON }
	| '=' { EQUAL }
	| ',' { COMMA }
	| [' ' '\t' '\n'] { token lexbuf }

	(* Parameters and values *)
	| ['0'-'9']+ as value { ID value }
	| [^'0'-'9' '\n' '\t' '"' '{' '}' '[' ']' '=' ';' ':' ' ' ',' '#'][^'\n' '\t' '"' '{' '}' '[' ']' '=' ';' ':' ' ' ',' '#']*  as value { ID value }
	| ['"'][^ '"']*['"']  as value { ID (sub value 1 ((length value)-2)) }

	(* Comments and HTML tags *)
	| '<' | '>' { token lexbuf }
	| "\n#" | '\n' { token lexbuf }
	| "(*" | "*)" { token lexbuf }
	| "//" | '\n' { token lexbuf }

	(* End of File *)
	| eof | _ { EOF }

