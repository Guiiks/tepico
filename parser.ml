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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Syntax;;
# 24 "parser.ml"
let yytransl_const = [|
  258 (* STRICT *);
  259 (* GRAPH *);
    0 (* EOF *);
  260 (* SEMICOLON *);
  261 (* OB *);
  262 (* OC *);
  263 (* CB *);
  264 (* CC *);
  265 (* SUBGRAPH *);
  266 (* EDGEOP *);
  267 (* COLON *);
  268 (* EDGE *);
  269 (* NODE *);
  270 (* COMMA *);
  271 (* EQUAL *);
    0|]

let yytransl_block = [|
  257 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\001\000\002\000\002\000\002\000\
\002\000\004\000\004\000\005\000\005\000\005\000\006\000\006\000\
\006\000\006\000\007\000\007\000\007\000\008\000\008\000\008\000\
\009\000\009\000\009\000\009\000\010\000\011\000\011\000\003\000\
\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\001\000\007\000\006\000\006\000\005\000\000\000\001\000\003\000\
\002\000\001\000\003\000\005\000\004\000\003\000\003\000\002\000\
\003\000\002\000\002\000\002\000\002\000\000\000\003\000\004\000\
\000\000\004\000\005\000\005\000\002\000\003\000\003\000\001\000\
\001\000\003\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\001\000\037\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\035\000\032\000\
\033\000\000\000\000\000\000\000\000\000\000\000\000\000\019\000\
\000\000\000\000\000\000\021\000\020\000\000\000\000\000\009\000\
\000\000\000\000\029\000\000\000\000\000\000\000\000\000\011\000\
\034\000\000\000\000\000\014\000\000\000\000\000\005\000\008\000\
\000\000\000\000\000\000\031\000\030\000\000\000\003\000\004\000\
\000\000\000\000\000\000\013\000\017\000\015\000\002\000\000\000\
\024\000\012\000\000\000\000\000\026\000\027\000\028\000"

let yydgoto = "\002\000\
\006\000\019\000\020\000\021\000\022\000\042\000\023\000\032\000\
\051\000\024\000\025\000"

let yysindex = "\011\000\
\001\000\000\000\012\255\010\255\000\000\000\000\017\255\016\255\
\122\255\018\255\122\255\122\255\028\255\026\255\122\255\020\255\
\026\255\026\255\032\255\109\255\025\255\015\255\000\000\000\000\
\000\000\122\255\036\255\047\255\033\255\058\255\063\255\000\000\
\059\255\027\255\122\255\000\000\000\000\068\000\122\255\000\000\
\008\255\026\255\000\000\026\255\064\255\077\000\080\000\000\000\
\000\000\066\255\078\255\000\000\122\255\080\255\000\000\000\000\
\079\255\015\255\015\255\000\000\000\000\093\000\000\000\000\000\
\093\255\026\255\090\255\000\000\000\000\000\000\000\000\006\255\
\000\000\000\000\063\255\063\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\095\255\000\000\095\255\095\255\044\255\083\255\095\255\000\000\
\083\255\083\255\000\000\095\255\083\255\096\255\000\000\000\000\
\000\000\095\255\000\000\000\000\000\000\000\000\094\255\000\000\
\000\000\000\000\095\255\000\000\000\000\000\000\095\255\000\000\
\000\000\083\255\000\000\083\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\095\255\000\000\000\000\000\000\
\044\255\057\255\070\255\000\000\000\000\000\000\000\000\000\000\
\000\000\083\255\000\000\000\000\000\000\000\000\000\000\094\255\
\000\000\000\000\094\255\094\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\000\000\065\000\066\000\234\255\000\000\241\255\
\222\255\000\000\000\000"

let yytablesize = 260
let yytable = "\044\000\
\005\000\036\000\037\000\027\000\028\000\043\000\050\000\033\000\
\057\000\075\000\008\000\001\000\040\000\015\000\007\000\009\000\
\016\000\010\000\045\000\076\000\034\000\012\000\011\000\026\000\
\041\000\035\000\060\000\054\000\061\000\031\000\031\000\056\000\
\053\000\048\000\041\000\069\000\070\000\077\000\029\000\038\000\
\078\000\079\000\030\000\046\000\010\000\067\000\010\000\010\000\
\010\000\010\000\073\000\010\000\010\000\010\000\047\000\010\000\
\010\000\018\000\049\000\018\000\018\000\018\000\018\000\050\000\
\018\000\018\000\052\000\055\000\018\000\018\000\016\000\062\000\
\016\000\016\000\016\000\016\000\063\000\016\000\016\000\064\000\
\065\000\016\000\016\000\022\000\066\000\022\000\022\000\068\000\
\022\000\029\000\022\000\022\000\071\000\072\000\022\000\022\000\
\036\000\074\000\036\000\036\000\025\000\036\000\006\000\036\000\
\036\000\058\000\059\000\036\000\036\000\013\000\000\000\014\000\
\039\000\000\000\015\000\000\000\000\000\016\000\000\000\000\000\
\017\000\018\000\013\000\000\000\014\000\000\000\000\000\015\000\
\000\000\000\000\016\000\000\000\000\000\017\000\018\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\004\000"

let yycheck = "\022\000\
\000\000\017\000\018\000\011\000\012\000\021\000\001\001\015\000\
\001\001\004\001\001\001\001\000\020\000\006\001\003\001\006\001\
\009\001\001\001\026\000\014\001\001\001\006\001\006\001\006\001\
\010\001\006\001\042\000\035\000\044\000\005\001\005\001\039\000\
\006\001\001\001\010\001\058\000\059\000\072\000\011\001\008\001\
\075\000\076\000\015\001\008\001\001\001\053\000\003\001\004\001\
\005\001\006\001\066\000\008\001\009\001\010\001\008\001\012\001\
\013\001\001\001\001\001\003\001\004\001\005\001\006\001\001\001\
\008\001\009\001\008\001\000\000\012\001\013\001\001\001\008\001\
\003\001\004\001\005\001\006\001\000\000\008\001\009\001\000\000\
\015\001\012\001\013\001\001\001\007\001\003\001\004\001\008\001\
\006\001\011\001\008\001\009\001\000\000\001\001\012\001\013\001\
\001\001\008\001\003\001\004\001\007\001\006\001\008\001\008\001\
\009\001\041\000\041\000\012\001\013\001\001\001\255\255\003\001\
\004\001\255\255\006\001\255\255\255\255\009\001\255\255\255\255\
\012\001\013\001\001\001\255\255\003\001\255\255\255\255\006\001\
\255\255\255\255\009\001\255\255\255\255\012\001\013\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\002\001\003\001"

let yynames_const = "\
  STRICT\000\
  GRAPH\000\
  EOF\000\
  SEMICOLON\000\
  OB\000\
  OC\000\
  CB\000\
  CC\000\
  SUBGRAPH\000\
  EDGEOP\000\
  COLON\000\
  EDGE\000\
  NODE\000\
  COMMA\000\
  EQUAL\000\
  "

let yynames_block = "\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "parser.mly"
      ( GRAPH(ID(""), []) )
# 204 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 23 "parser.mly"
                                      ( GRAPH(ID(_3), _5) )
# 212 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 24 "parser.mly"
                                   ( GRAPH(ID(""), _4) )
# 219 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 25 "parser.mly"
                                ( GRAPH(ID(_2), _4) )
# 227 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 26 "parser.mly"
                             ( GRAPH(ID(""), _3) )
# 234 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    Obj.repr(
# 30 "parser.mly"
  ([])
# 240 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 31 "parser.mly"
        ( [_1] )
# 247 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 32 "parser.mly"
                            ( _1 :: _3 )
# 255 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 33 "parser.mly"
                  ( _1 :: _2 )
# 263 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 37 "parser.mly"
     ( (ID(_1), ID("")) )
# 270 "parser.ml"
               : 'node_id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 38 "parser.mly"
               ( (ID(_1), ID(_3)) )
# 278 "parser.ml"
               : 'node_id))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 42 "parser.mly"
                              ( SUBGRAPH(ID(_2), _4) )
# 286 "parser.ml"
               : 'subgraph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 43 "parser.mly"
                            ( SUBGRAPH(ID(""), _3) )
# 293 "parser.ml"
               : 'subgraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 44 "parser.mly"
                   ( SUBGRAPH(ID(""), _2) )
# 300 "parser.ml"
               : 'subgraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'subgraph) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'edgeRHS) in
    Obj.repr(
# 48 "parser.mly"
                          ( EDGERHS(_2, _3))
# 308 "parser.ml"
               : 'edgeRHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'subgraph) in
    Obj.repr(
# 49 "parser.mly"
                   ( EDGERHS(_2, EDGERHS_EMPTY) )
# 315 "parser.ml"
               : 'edgeRHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'node_id) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'edgeRHS) in
    Obj.repr(
# 50 "parser.mly"
                          ( EDGERHS(NODE_STMT(_2, []), _3) )
# 323 "parser.ml"
               : 'edgeRHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'node_id) in
    Obj.repr(
# 51 "parser.mly"
                  ( EDGERHS(NODE_STMT(_2, []), EDGERHS_EMPTY) )
# 330 "parser.ml"
               : 'edgeRHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 55 "parser.mly"
                  ( ATTR_STMT("graph", _2) )
# 337 "parser.ml"
               : 'attr_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 56 "parser.mly"
                  ( ATTR_STMT("node", _2) )
# 344 "parser.ml"
               : 'attr_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 57 "parser.mly"
                  ( ATTR_STMT("edge", _2) )
# 351 "parser.ml"
               : 'attr_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
  ([])
# 357 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'a_list) in
    Obj.repr(
# 62 "parser.mly"
                ( [_2] )
# 364 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'a_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 63 "parser.mly"
                          ( [_2] @ _4 )
# 372 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "parser.mly"
  ([])
# 378 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 68 "parser.mly"
                       ( [(ID(_1),ID(_3))] @ _4)
# 387 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 69 "parser.mly"
                                ( [(ID(_1),ID(_3))] @ _5)
# 396 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 70 "parser.mly"
                            ( [(ID(_1),ID(_3))] @ _5)
# 405 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'node_id) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 74 "parser.mly"
                   ( NODE_STMT(_1, _2) )
# 413 "parser.ml"
               : 'node_stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'subgraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'edgeRHS) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 78 "parser.mly"
                             ( EDGE_STMT(_1, _2, _3) )
# 422 "parser.ml"
               : 'edge_stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'node_id) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'edgeRHS) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 79 "parser.mly"
                             (EDGE_STMT(NODE_STMT(_1, []), _2, _3) )
# 431 "parser.ml"
               : 'edge_stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'node_stmt) in
    Obj.repr(
# 83 "parser.mly"
            ( _1 )
# 438 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'edge_stmt) in
    Obj.repr(
# 84 "parser.mly"
             ( _1 )
# 445 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
               ( ID_ID(ID(_1), ID(_3)) )
# 453 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attr_stmt) in
    Obj.repr(
# 86 "parser.mly"
             ( _1 )
# 460 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'subgraph) in
    Obj.repr(
# 87 "parser.mly"
            ( _1 )
# 467 "parser.ml"
               : 'stmt))
(* Entry graph *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let graph (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Syntax.graph)
;;
