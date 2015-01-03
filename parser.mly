%{
open Syntax;;
%}

%token <string> ID
%token STRICT GRAPH EOF
%token SUBGRAPH
%token SEMICOLON
%token COLON
%token EDGE
%token NODE
%token LSBRA LBRA RSBRA RBRA
%token EQUAL
%token EDGE_SEPARATOR
%token COMMA

%start graph
%type <Syntax.graph> graph
%%

graph:
	| EOF { GRAPH(ID(""), []) }
	| STRICT GRAPH ID LBRA stmt_list RBRA EOF{ GRAPH(ID($3), $5) }
	| STRICT GRAPH LBRA stmt_list RBRA EOF{ GRAPH(ID(""), $4) } 
	| GRAPH ID LBRA stmt_list RBRA EOF { GRAPH(ID($2), $4) }
	| GRAPH LBRA stmt_list RBRA EOF { GRAPH(ID(""), $3) }
;

stmt_list:
	| {[]} 
	| stmt { [$1] }
	| stmt SEMICOLON stmt_list { $1 :: $3 }
	| stmt stmt_list { $1 :: $2 }
;	

node_id: 
	| ID { (ID($1), ID("")) }
	| ID COLON ID { (ID($1), ID($3)) }
;

subgraph: 
	| SUBGRAPH ID LBRA stmt_list RBRA { SUBGRAPH(ID($2), $4) }
	| SUBGRAPH LBRA stmt_list RBRA { SUBGRAPH(ID(""), $3) }
	| LBRA stmt_list RBRA { SUBGRAPH(ID(""), $2) } 
;

edgeRHS: 
	| EDGE_SEPARATOR subgraph edgeRHS { EDGERHS($2, $3)}
	| EDGE_SEPARATOR subgraph { EDGERHS($2, EDGERHS_EMPTY) }
	| EDGE_SEPARATOR node_id edgeRHS { EDGERHS(NODE_STMT($2, []), $3) }
	| EDGE_SEPARATOR node_id { EDGERHS(NODE_STMT($2, []), EDGERHS_EMPTY) }
; 

attr_stmt: 
	| GRAPH attr_list { ATTR_STMT("graph", $2) }
	| NODE attr_list { ATTR_STMT("node", $2) }
	| EDGE attr_list { ATTR_STMT("edge", $2) }
;

attr_list: 
	| {[]}
	| LSBRA a_list RSBRA { [$2] }
	| LSBRA a_list RSBRA attr_list { [$2] @ $4 }
;

a_list:
	| {[]} 
	| ID EQUAL ID  a_list { [(ID($1),ID($3))] @ $4}
	| ID EQUAL ID SEMICOLON a_list { [(ID($1),ID($3))] @ $5}
	| ID EQUAL ID COMMA a_list { [(ID($1),ID($3))] @ $5}
;

node_stmt: 
	| node_id attr_list { NODE_STMT($1, $2) }
;

edge_stmt: 
	| subgraph edgeRHS attr_list { EDGE_STMT($1, $2, $3) }
	| node_id edgeRHS attr_list {EDGE_STMT(NODE_STMT($1, []), $2, $3) }
; 

stmt:
	| node_stmt { $1 }
	| edge_stmt { $1 }
	| ID EQUAL ID { ID_ID(ID($1), ID($3)) }
	| attr_stmt { $1 }
	| subgraph { $1 }
;
%%
