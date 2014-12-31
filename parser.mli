type token =
  | ID of (string)
  | STRICT
  | GRAPH
  | EOF
  | SEMICOLON
  | LB
  | LCB
  | RB
  | RCB
  | SUBGRAPH
  | EDGEOP
  | COLON
  | EDGE
  | NODE
  | COMMA
  | EQUAL

val graph :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.graph
