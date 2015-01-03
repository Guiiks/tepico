type token =
  | ID of (string)
  | STRICT
  | GRAPH
  | EOF
  | SEMICOLON
  | OB
  | OC
  | CB
  | CC
  | SUBGRAPH
  | EDGEOP
  | COLON
  | EDGE
  | NODE
  | COMMA
  | EQUAL

val graph :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.graph
