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

/*
	Abstract Syntax Tree representing the DOT grammar
	Reference: https://godoc.org/code.google.com/p/gographviz/ast
*/

a_list:
	| ID EQUAL ID COMMA a_list { [(ID($1),ID($3))] @ $5}
	| ID EQUAL ID SEMICOLON a_list { [(ID($1),ID($3))] @ $5}
	| ID EQUAL ID a_list { [(ID($1),ID($3))] @ $4}
	| {[]} 
;

attr: 
	| GRAPH attr_list { ATTR("graph", $2) }
	| NODE attr_list { ATTR("node", $2) }
	| EDGE attr_list { ATTR("edge", $2) }
;

attr_list: 
	| LSBRA a_list RSBRA attr_list { [$2] @ $4 }
	| LSBRA a_list RSBRA { [$2] }
	| {[]}
;

edge_RHS:
	| EDGE_SEPARATOR subgraph { EDGE_RHS($2, NULL) }
	| EDGE_SEPARATOR node_id { EDGE_RHS(NODE_ELEM($2, []), NULL) }
	| EDGE_SEPARATOR subgraph edge_RHS { EDGE_RHS($2, $3)}
	| EDGE_SEPARATOR node_id edge_RHS { EDGE_RHS(NODE_ELEM($2, []), $3) }
; 

edge_elem: 
	| subgraph edge_RHS attr_list { EDGE_ELEM($1, $2, $3) }
	| node_id edge_RHS attr_list {EDGE_ELEM(NODE_ELEM($1, []), $2, $3) }
; 

elem:
	| attr { $1 }
	| subgraph { $1 }
	| ID EQUAL ID { ID_COUPLE(ID($1), ID($3)) }
	| edge_elem { $1 }
	| node_elem { $1 }
;

elem_list:
	| elem SEMICOLON elem_list { $1 :: $3 }
	| elem elem_list { $1 :: $2 }
	| elem { [$1] }
	| {[]} 
;

graph:
	| GRAPH ID LBRA elem_list RBRA EOF { GRAPH(ID($2), $4) }
	| GRAPH LBRA elem_list RBRA EOF { GRAPH(ID(""), $3) }
	| STRICT GRAPH ID LBRA elem_list RBRA EOF{ GRAPH(ID($3), $5) }
	| STRICT GRAPH LBRA elem_list RBRA EOF{ GRAPH(ID(""), $4) } 
	| EOF { GRAPH(ID(""), []) }
;

node_elem: 
	| node_id attr_list { NODE_ELEM($1, $2) }
;

node_id: 
	| ID { (ID($1), ID("")) }
	| ID COLON ID { (ID($1), ID($3)) }
;

subgraph: 
	| LBRA elem_list RBRA { SUBGRAPH(ID(""), $2) }
	| SUBGRAPH ID LBRA elem_list RBRA { SUBGRAPH(ID($2), $4) }
	| SUBGRAPH LBRA elem_list RBRA { SUBGRAPH(ID(""), $3) }
;

%%
