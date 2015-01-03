%{
open Syntax;;
%}

%token <string> ID
%token STRICT GRAPH EOF
%token SEMICOLON
%token OB OC CB CC
%token SUBGRAPH
%token EDGEOP
%token COLON
%token EDGE
%token NODE
%token COMMA
%token EQUAL

%start graph
%type <Syntax.graph> graph
%%

graph:
		EOF { GRAPH(ID(""), []) }
	| STRICT GRAPH ID OC stmt_list CC EOF{ GRAPH(ID($3), $5) }
	| STRICT GRAPH OC stmt_list CC EOF{ GRAPH(ID(""), $4) } 
	| GRAPH ID OC stmt_list CC EOF { GRAPH(ID($2), $4) }
	| GRAPH OC stmt_list CC EOF { GRAPH(ID(""), $3) }
;

stmt_list:
		{[]} 
	| stmt { [$1] }
	| stmt SEMICOLON stmt_list { $1 :: $3 }
	| stmt stmt_list { $1 :: $2 }
;	

node_id: 
		ID { (ID($1), ID("")) }
	| ID COLON ID { (ID($1), ID($3)) }
;

subgraph: 
		SUBGRAPH ID OC stmt_list CC { SUBGRAPH(ID($2), $4) }
	| SUBGRAPH OC stmt_list CC { SUBGRAPH(ID(""), $3) }
	| OC stmt_list CC { SUBGRAPH(ID(""), $2) } 
;

edgeRHS: 
		EDGEOP subgraph edgeRHS { EDGERHS($2, $3)}
	| EDGEOP subgraph { EDGERHS($2, EDGERHS_EMPTY) }
	| EDGEOP node_id edgeRHS { EDGERHS(NODE_STMT($2, []), $3) }
	| EDGEOP node_id { EDGERHS(NODE_STMT($2, []), EDGERHS_EMPTY) }
; 

attr_stmt: 
		GRAPH attr_list { ATTR_STMT("graph", $2) }
	| NODE attr_list { ATTR_STMT("node", $2) }
	| EDGE attr_list { ATTR_STMT("edge", $2) }
;

attr_list: 
		{[]}
	|	OB a_list CB { [$2] }
	|	OB a_list CB attr_list { [$2] @ $4 }
;

a_list:
		{[]} 
	| ID EQUAL ID  a_list { [(ID($1),ID($3))] @ $4}
	| ID EQUAL ID SEMICOLON a_list { [(ID($1),ID($3))] @ $5}
	| ID EQUAL ID COMMA a_list { [(ID($1),ID($3))] @ $5}
;

node_stmt: 
	node_id attr_list { NODE_STMT($1, $2) }
;

edge_stmt: 
		subgraph edgeRHS attr_list { EDGE_STMT($1, $2, $3) }
	| node_id edgeRHS attr_list {EDGE_STMT(NODE_STMT($1, []), $2, $3) }
; 

stmt:
		node_stmt { $1 }
	| edge_stmt { $1 }
	| ID EQUAL ID { ID_ID(ID($1), ID($3)) }
	| attr_stmt { $1 }
	| subgraph { $1 }
;
%%
