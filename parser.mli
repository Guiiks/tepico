type token =
  | ID of (string)
  | STRICT
  | GRAPH
  | EOF
  | SUBGRAPH
  | SEMICOLON
  | COLON
  | EDGE
  | NODE
  | LSBRA
  | LBRA
  | RSBRA
  | RBRA
  | EQUAL
  | EDGE_SEPARATOR
  | COMMA

val graph :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.graph
