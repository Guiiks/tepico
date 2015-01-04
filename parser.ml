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
\002\000\002\000\002\000\002\000\003\000\003\000\003\000\004\000\
\004\000\004\000\005\000\005\000\005\000\005\000\008\000\008\000\
\009\000\009\000\009\000\009\000\009\000\011\000\011\000\011\000\
\011\000\001\000\001\000\001\000\001\000\001\000\010\000\007\000\
\007\000\006\000\006\000\006\000\000\000"

let yylen = "\002\000\
\005\000\005\000\004\000\000\000\002\000\002\000\002\000\004\000\
\003\000\000\000\002\000\002\000\003\000\003\000\003\000\003\000\
\001\000\001\000\003\000\001\000\001\000\003\000\002\000\001\000\
\000\000\006\000\005\000\007\000\006\000\001\000\002\000\001\000\
\003\000\003\000\005\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\030\000\037\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\017\000\000\000\000\000\020\000\000\000\021\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\007\000\006\000\000\000\000\000\000\000\031\000\
\000\000\000\000\023\000\000\000\000\000\000\000\000\000\033\000\
\019\000\000\000\000\000\000\000\000\000\034\000\000\000\000\000\
\000\000\015\000\016\000\022\000\027\000\000\000\029\000\026\000\
\000\000\000\000\000\000\036\000\013\000\014\000\028\000\000\000\
\008\000\035\000\000\000\000\000\003\000\002\000\001\000"

let yydgoto = "\002\000\
\006\000\051\000\019\000\032\000\039\000\020\000\021\000\022\000\
\023\000\024\000\025\000"

let yysindex = "\255\255\
\001\000\000\000\005\255\009\255\000\000\000\000\020\255\004\255\
\034\255\016\255\034\255\034\255\051\255\025\255\021\255\025\255\
\025\255\034\255\000\000\029\255\002\255\000\000\108\255\000\000\
\033\255\034\255\036\255\062\255\083\255\086\255\093\255\000\000\
\087\255\034\255\000\000\000\000\092\255\014\255\025\255\000\000\
\025\255\034\255\000\000\107\000\102\255\117\000\119\000\000\000\
\000\000\107\255\110\255\034\255\111\255\000\000\116\255\029\255\
\029\255\000\000\000\000\000\000\000\000\124\000\000\000\000\000\
\124\255\025\255\114\255\000\000\000\000\000\000\000\000\008\255\
\000\000\000\000\093\255\093\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\115\255\000\000\115\255\115\255\046\255\078\255\000\000\078\255\
\078\255\115\255\000\000\088\255\078\255\000\000\117\255\000\000\
\000\000\115\255\000\000\000\000\000\000\000\000\119\255\000\000\
\000\000\115\255\000\000\000\000\000\000\000\000\078\255\000\000\
\078\255\115\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\115\255\000\000\000\000\046\255\058\255\
\068\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\098\255\000\000\000\000\000\000\000\000\000\000\119\255\
\000\000\000\000\119\255\119\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\213\255\000\000\242\255\239\255\090\000\093\000\000\000\
\000\000\000\000\250\255"

let yytablesize = 260
let yytable = "\001\000\
\005\000\035\000\036\000\041\000\027\000\028\000\040\000\007\000\
\050\000\008\000\031\000\037\000\075\000\012\000\055\000\038\000\
\043\000\015\000\009\000\045\000\010\000\033\000\076\000\018\000\
\058\000\026\000\059\000\053\000\077\000\011\000\034\000\078\000\
\079\000\031\000\013\000\060\000\014\000\015\000\069\000\070\000\
\016\000\017\000\038\000\018\000\044\000\067\000\032\000\046\000\
\032\000\032\000\032\000\073\000\032\000\032\000\032\000\032\000\
\029\000\032\000\011\000\032\000\011\000\011\000\011\000\030\000\
\011\000\011\000\011\000\011\000\012\000\011\000\012\000\012\000\
\012\000\047\000\012\000\012\000\012\000\012\000\010\000\012\000\
\010\000\010\000\010\000\048\000\010\000\010\000\049\000\010\000\
\018\000\010\000\018\000\018\000\018\000\050\000\018\000\018\000\
\052\000\018\000\009\000\018\000\009\000\009\000\009\000\054\000\
\009\000\009\000\061\000\009\000\013\000\009\000\014\000\015\000\
\042\000\062\000\016\000\017\000\063\000\018\000\064\000\065\000\
\066\000\029\000\068\000\071\000\072\000\074\000\025\000\056\000\
\024\000\004\000\057\000\000\000\000\000\000\000\000\000\000\000\
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

let yycheck = "\001\000\
\000\000\016\000\017\000\021\000\011\000\012\000\021\000\003\001\
\001\001\001\001\009\001\018\000\005\001\010\001\001\001\014\001\
\023\000\004\001\010\001\026\000\001\001\001\001\015\001\010\001\
\039\000\010\001\041\000\034\000\072\000\010\001\010\001\075\000\
\076\000\009\001\001\001\042\000\003\001\004\001\056\000\057\000\
\007\001\008\001\014\001\010\001\012\001\052\000\001\001\012\001\
\003\001\004\001\005\001\066\000\007\001\008\001\009\001\010\001\
\006\001\012\001\001\001\014\001\003\001\004\001\005\001\013\001\
\007\001\008\001\009\001\010\001\001\001\012\001\003\001\004\001\
\005\001\012\001\007\001\008\001\009\001\010\001\001\001\012\001\
\003\001\004\001\005\001\001\001\007\001\008\001\001\001\010\001\
\001\001\012\001\003\001\004\001\005\001\001\001\007\001\008\001\
\010\001\010\001\001\001\012\001\003\001\004\001\005\001\012\001\
\007\001\008\001\000\000\010\001\001\001\012\001\003\001\004\001\
\005\001\012\001\007\001\008\001\000\000\010\001\000\000\013\001\
\011\001\006\001\012\001\000\000\001\001\012\001\012\001\038\000\
\012\001\011\001\038\000\255\255\255\255\255\255\255\255\255\255\
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
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 27 "parser.mly"
                            ( [(ID(_1),ID(_3))] @ _5)
# 207 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 28 "parser.mly"
                                ( [(ID(_1),ID(_3))] @ _5)
# 216 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'a_list) in
    Obj.repr(
# 29 "parser.mly"
                      ( [(ID(_1),ID(_3))] @ _4)
# 225 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 30 "parser.mly"
   ([])
# 231 "parser.ml"
               : 'a_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 34 "parser.mly"
                   ( ATTR("graph", _2) )
# 238 "parser.ml"
               : 'attr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 35 "parser.mly"
                  ( ATTR("node", _2) )
# 245 "parser.ml"
               : 'attr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 36 "parser.mly"
                  ( ATTR("edge", _2) )
# 252 "parser.ml"
               : 'attr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'a_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 40 "parser.mly"
                                ( [_2] @ _4 )
# 260 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'a_list) in
    Obj.repr(
# 41 "parser.mly"
                      ( [_2] )
# 267 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
   ([])
# 273 "parser.ml"
               : 'attr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'subgraph) in
    Obj.repr(
# 46 "parser.mly"
                           ( EDGE_RHS(_2, NULL) )
# 280 "parser.ml"
               : 'edge_RHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'node_id) in
    Obj.repr(
# 47 "parser.mly"
                          ( EDGE_RHS(NODE_ELEM(_2, []), NULL) )
# 287 "parser.ml"
               : 'edge_RHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'subgraph) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'edge_RHS) in
    Obj.repr(
# 48 "parser.mly"
                                    ( EDGE_RHS(_2, _3))
# 295 "parser.ml"
               : 'edge_RHS))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'node_id) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'edge_RHS) in
    Obj.repr(
# 49 "parser.mly"
                                   ( EDGE_RHS(NODE_ELEM(_2, []), _3) )
# 303 "parser.ml"
               : 'edge_RHS))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'subgraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'edge_RHS) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 53 "parser.mly"
                               ( EDGE_ELEM(_1, _2, _3) )
# 312 "parser.ml"
               : 'edge_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'node_id) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'edge_RHS) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 54 "parser.mly"
                              (EDGE_ELEM(NODE_ELEM(_1, []), _2, _3) )
# 321 "parser.ml"
               : 'edge_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attr) in
    Obj.repr(
# 58 "parser.mly"
        ( _1 )
# 328 "parser.ml"
               : 'elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'subgraph) in
    Obj.repr(
# 59 "parser.mly"
            ( _1 )
# 335 "parser.ml"
               : 'elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 60 "parser.mly"
               ( ID_COUPLE(ID(_1), ID(_3)) )
# 343 "parser.ml"
               : 'elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'edge_elem) in
    Obj.repr(
# 61 "parser.mly"
             ( _1 )
# 350 "parser.ml"
               : 'elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'node_elem) in
    Obj.repr(
# 62 "parser.mly"
             ( _1 )
# 357 "parser.ml"
               : 'elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elem) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'elem_list) in
    Obj.repr(
# 66 "parser.mly"
                            ( _1 :: _3 )
# 365 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'elem) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'elem_list) in
    Obj.repr(
# 67 "parser.mly"
                  ( _1 :: _2 )
# 373 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'elem) in
    Obj.repr(
# 68 "parser.mly"
        ( [_1] )
# 380 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "parser.mly"
   ([])
# 386 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    Obj.repr(
# 73 "parser.mly"
                                    ( GRAPH(ID(_2), _4) )
# 394 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    Obj.repr(
# 74 "parser.mly"
                                 ( GRAPH(ID(""), _3) )
# 401 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    Obj.repr(
# 75 "parser.mly"
                                          ( GRAPH(ID(_3), _5) )
# 409 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    Obj.repr(
# 76 "parser.mly"
                                       ( GRAPH(ID(""), _4) )
# 416 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
       ( GRAPH(ID(""), []) )
# 422 "parser.ml"
               : Syntax.graph))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'node_id) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_list) in
    Obj.repr(
# 81 "parser.mly"
                     ( NODE_ELEM(_1, _2) )
# 430 "parser.ml"
               : 'node_elem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
      ( (ID(_1), ID("")) )
# 437 "parser.ml"
               : 'node_id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "parser.mly"
               ( (ID(_1), ID(_3)) )
# 445 "parser.ml"
               : 'node_id))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elem_list) in
    Obj.repr(
# 90 "parser.mly"
                       ( SUBGRAPH(ID(""), _2) )
# 452 "parser.ml"
               : 'subgraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'elem_list) in
    Obj.repr(
# 91 "parser.mly"
                                   ( SUBGRAPH(ID(_2), _4) )
# 460 "parser.ml"
               : 'subgraph))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'elem_list) in
    Obj.repr(
# 92 "parser.mly"
                                ( SUBGRAPH(ID(""), _3) )
# 467 "parser.ml"
               : 'subgraph))
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
