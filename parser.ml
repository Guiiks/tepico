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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Syntax;;
# 24 "parser.ml"
let yytransl_const = [|
  258 (* STRICT *);
  259 (* GRAPH *);
    0 (* EOF *);
  260 (* SUBGRAPH *);
  261 (* SEMICOLON *);
  262 (* COLON *);
  263 (* EDGE *);
  264 (* NODE *);
  265 (* LSBRA *);
  266 (* LBRA *);
  267 (* RSBRA *);
  268 (* RBRA *);
  269 (* EQUAL *);
  270 (* EDGE_SEPARATOR *);
  271 (* COMMA *);
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
\000\000\000\000\021\000\020\000\000\000\000\000\000\000\009\000\
\000\000\000\000\029\000\000\000\000\000\000\000\000\000\011\000\
\034\000\000\000\000\000\000\000\000\000\014\000\005\000\008\000\
\000\000\000\000\000\000\031\000\030\000\000\000\003\000\004\000\
\000\000\000\000\000\000\013\000\017\000\015\000\002\000\000\000\
\024\000\012\000\000\000\000\000\026\000\027\000\028\000"

let yydgoto = "\002\000\
\006\000\019\000\020\000\021\000\022\000\042\000\023\000\032\000\
\051\000\024\000\025\000"

let yysindex = "\007\000\
\001\000\000\000\006\255\013\255\000\000\000\000\015\255\002\255\
\014\255\021\255\014\255\014\255\076\255\030\255\040\255\030\255\
\030\255\014\255\022\255\093\255\024\255\041\255\000\000\000\000\
\000\000\014\255\047\255\057\255\078\255\091\255\098\255\000\000\
\094\255\014\255\000\000\000\000\095\255\108\000\014\255\000\000\
\025\255\030\255\000\000\030\255\097\255\110\000\111\000\000\000\
\000\000\099\255\102\255\014\255\103\255\000\000\000\000\000\000\
\108\255\041\255\041\255\000\000\000\000\116\000\000\000\000\000\
\116\255\030\255\106\255\000\000\000\000\000\000\000\000\005\255\
\000\000\000\000\098\255\098\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\107\255\000\000\107\255\107\255\039\255\073\255\000\000\073\255\
\073\255\107\255\000\000\107\255\073\255\083\255\000\000\000\000\
\000\000\107\255\000\000\000\000\000\000\000\000\109\255\000\000\
\000\000\107\255\000\000\000\000\000\000\000\000\107\255\000\000\
\000\000\073\255\000\000\073\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\107\255\000\000\000\000\000\000\000\000\
\039\255\053\255\063\255\000\000\000\000\000\000\000\000\000\000\
\000\000\073\255\000\000\000\000\000\000\000\000\000\000\109\255\
\000\000\000\000\109\255\109\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\000\000\080\000\081\000\234\255\000\000\242\255\
\030\000\000\000\000\000"

let yytablesize = 260
let yytable = "\044\000\
\005\000\035\000\036\000\027\000\028\000\050\000\043\000\001\000\
\007\000\075\000\037\000\012\000\040\000\008\000\013\000\010\000\
\014\000\015\000\045\000\076\000\016\000\017\000\009\000\018\000\
\011\000\057\000\053\000\060\000\015\000\061\000\026\000\056\000\
\031\000\038\000\018\000\069\000\070\000\041\000\031\000\010\000\
\033\000\010\000\010\000\010\000\067\000\010\000\010\000\010\000\
\010\000\034\000\010\000\073\000\010\000\018\000\041\000\018\000\
\018\000\018\000\046\000\018\000\018\000\018\000\018\000\016\000\
\018\000\016\000\016\000\016\000\047\000\016\000\016\000\016\000\
\016\000\022\000\016\000\022\000\022\000\022\000\048\000\022\000\
\022\000\029\000\022\000\036\000\022\000\036\000\036\000\036\000\
\030\000\036\000\036\000\049\000\036\000\013\000\036\000\014\000\
\015\000\039\000\050\000\016\000\017\000\077\000\018\000\052\000\
\078\000\079\000\054\000\055\000\062\000\063\000\064\000\065\000\
\066\000\029\000\068\000\071\000\072\000\074\000\006\000\025\000\
\058\000\059\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\004\000"

let yycheck = "\022\000\
\000\000\016\000\017\000\011\000\012\000\001\001\021\000\001\000\
\003\001\005\001\018\000\010\001\020\000\001\001\001\001\001\001\
\003\001\004\001\026\000\015\001\007\001\008\001\010\001\010\001\
\010\001\001\001\034\000\042\000\004\001\044\000\010\001\039\000\
\009\001\012\001\010\001\058\000\059\000\014\001\009\001\001\001\
\001\001\003\001\004\001\005\001\052\000\007\001\008\001\009\001\
\010\001\010\001\012\001\066\000\014\001\001\001\014\001\003\001\
\004\001\005\001\012\001\007\001\008\001\009\001\010\001\001\001\
\012\001\003\001\004\001\005\001\012\001\007\001\008\001\009\001\
\010\001\001\001\012\001\003\001\004\001\005\001\001\001\007\001\
\008\001\006\001\010\001\001\001\012\001\003\001\004\001\005\001\
\013\001\007\001\008\001\001\001\010\001\001\001\012\001\003\001\
\004\001\005\001\001\001\007\001\008\001\072\000\010\001\010\001\
\075\000\076\000\012\001\000\000\012\001\000\000\000\000\013\001\
\011\001\006\001\012\001\000\000\001\001\012\001\012\001\011\001\
\041\000\041\000\255\255\255\255\255\255\255\255\255\255\255\255\
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
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\002\001\003\001"

let yynames_const = "\
  STRICT\000\
  GRAPH\000\
  EOF\000\
  SUBGRAPH\000\
  SEMICOLON\000\
  COLON\000\
  EDGE\000\
  NODE\000\
  LSBRA\000\
  LBRA\000\
  RSBRA\000\
  RBRA\000\
  EQUAL\000\
  EDGE_SEPARATOR\000\
  COMMA\000\
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
