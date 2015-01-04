type id = ID of string
and node = NODE of string * (string * string) list
and edge = EDGE of string * string * (string * string) list

and edge_RHS = NULL
	| EDGE_RHS of elem * edge_RHS

and elem = NODE_ELEM of (id * id) * ((id * id) list) list
	| EDGE_ELEM of elem * edge_RHS * ((id * id) list) list
	| ATTR of string * ((id * id) list) list 
	| ID_COUPLE of (id * id) 
	| SUBGRAPH of id * elem list

and graph = GRAPH of id * elem list;;


