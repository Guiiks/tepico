
(* Ce fichier contient l'analyseur lexical dont le but va être de 'consommer' 
	les symboles pour les fournir à l'analyseur syntaxique *)

{
	open Parser
	open String
	exception Eof
}

(* Les graph, subgraph, strict, node et edge ne sont pas sensibles à la casse *)
rule token = parse
	| ['g' 'G']['r' 'R']['a' 'A']['p' 'P']['h' 'H'] { GRAPH }
	| ['s' 'S']['u' 'U']['b' 'B']['g' 'G']['r' 'R']['a' 'A']['p' 'P']['h' 'H'] { SUBGRAPH }
	| ['s' 'S']['t' 'T']['r' 'R']['i' 'I']['c' 'C']['t' 'T'] { STRICT }
	| ['n' 'N']['o' 'O']['d' 'D']['e' 'E'] { NODE }
	| ['e' 'E']['d' 'D']['g' 'G']['e' 'E'] { EDGE }
	| '{' { OC }
	| '}' { CC }
	| '[' { OB }
	| ']' { CB }
	| "--" { EDGE_SEPARATOR }
	| ';' { SEMICOLON }
	| ':' { COLON }
	| '=' { EQUAL }
	| ',' { COMMA }
	| [' ' '\t' '\n'] { token lexbuf }
	| '<' | '>' { token lexbuf }  (* Suppression des balises HTML *)
	| ("")+'#' { comment lexbuf }  (* Suppression des commentaires au début du fichier *)
	| "\n#" { comment lexbuf }  (* Suppression des commentaires après # dans le document *)
	| "(*" { multilines_comment lexbuf } (* Suppression des commentaires multi-lignes *)
	| "//" { comment lexbuf } (* Suppression des commentaires en fin de ligne // *)
	| [^'0'-'9' '\n' '\t' ' ' '[' ']' ';' ':' '=' ',' '{' '}' '#' '"'][^'\n' '\t' ' ' '[' ']' ';' ':' '=' ',' '{' '}' '#' '"']* | ['0'-'9']+ as value { ID value }
	| ['"'][^ '"']*['"']  as value { ID (sub value 1 ((length value)-2)) }
	| eof | _ { EOF }
	
(* Fonction de parsage des commentaires sur une ligne *)
and comment = parse
	| '\n' { token lexbuf }
	| _ { comment lexbuf }
	| eof { raise End_of_file }

(* Fonction de parsage des commentaires multi-lignes *)
and multilines_comment = parse
	| "*)" { token lexbuf }
	| _ { multilines_comment lexbuf }
	| eof { raise End_of_file }
