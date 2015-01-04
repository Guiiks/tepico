(* functions.ml *)
open Filename
open Syntax
open Printf


(*Converts a couple ("id", "port") into a string "id"*)
let id_id_to_string id = match id with
	| (ID(a), ID(b)) -> a
;; 

(* Converts an id couple into a string couple - an id couple is a parameter before analysis *)

let id_id_to_string_string id = match id with
	| (ID(a), ID(b)) -> (a, b)
;;


(* Returns the node list *)
let get_node_list_from_couple couple = match couple with
	| (a, b) -> a
;;

(* Returns the edge list *)

let get_edge_list_from_couple couple = match couple with
	| (a, b) -> b
;; 



(* Converts a a_list ( = an id couple list) into a string couple list *)

let rec a_list_to_string_string_list a_list = match a_list with
	| [] -> []
	| [a] -> [id_id_to_string_string a]
	| head :: tail -> [(id_id_to_string_string head)]@(a_list_to_string_string_list tail)
;;

(* Converts a a_list list into a string couple list *)

let rec attr_list_to_string_string_list params = match params with 
	| [] -> []
	| head :: tail -> (a_list_to_string_string_list head)@(attr_list_to_string_string_list tail) 
;;

(* Compares a node id with a string *)

let compare_nodes node id = match node with
	| NODE (node_id, node_params) -> if id = node_id then true else false
;;

(* Get a parameter name *)

let get_param_name param = match param with
	| (a, b) -> a
;;

(* Replace the parameter value  if exists by his new value *)

let replace_param_value param1 param2 = match (param1, param2) with
	| ((a,b), (c,d)) -> (a,d)
;;

(* Compares 2 parameters names *)
let compare_params param1 param2 = 
	if (get_param_name param1) = (get_param_name param2) 
	then true 
	else false
;;

(* add the current parameter into the parameters list *)

let rec sweep_param_list stmt_params param = match stmt_params with
	| [] -> [param]
	| head :: tail -> if (compare_params head param) then [(replace_param_value head param)]@tail else [head]@(sweep_param_list tail param)
;;

(* sweeps the parameters list of a current statement to modify every single parameter *)

let rec sweep_both_param_list stmt_params params = match params with
	| [] -> []
	| head :: tail -> (sweep_param_list stmt_params head)@(sweep_both_param_list stmt_params tail)
;;

(* Merges a parameters list of an edge with a parameter list *)
let analyze_edge_param_list edge params = match edge with
	| EDGE (start_node, end_node, edge_params) -> EDGE(start_node, end_node, (sweep_both_param_list edge_params params))
;;	

(* Merges a parameters list of a node with a parameter list *)
let analyze_node_param_list node params = match node with
	| NODE (node_id, node_params) -> NODE(node_id, (sweep_both_param_list node_params params))  
;;

(* add an id label to the parameter if not exists *)
let rec add_label id params = match params with
	| [] -> [("label", id)]
	| head :: tail -> if (compare_params head ("label", "")) 
		then params
		else [head]@(add_label id tail) 
;;

(* adds a non-existing node with his parameters in the node list *)

let rec sweep_node_list couple id params = match (get_node_list_from_couple couple) with 
	| [] -> ([NODE(id, (add_label id params))], get_edge_list_from_couple couple)
	|	head :: tail -> if (compare_nodes head id) 
		then ([(analyze_node_param_list head params)]@tail, (get_edge_list_from_couple couple))
		else ([head]@(get_node_list_from_couple(sweep_node_list (tail, (get_edge_list_from_couple couple)) id params)), (get_edge_list_from_couple couple)) 
;;

(* Compares an edge with the starting node string and the ending node string *)

let compare_edges edge start_node end_node = match edge with
	| EDGE (sn, en, params) -> if (sn = start_node && en = end_node)
		then true
		else false
;;

(* adds a non-existing edge with his parameters in the node list *)

let rec sweep_edge_list couple start_node end_node params = match (get_edge_list_from_couple couple) with
	| [] -> ((get_node_list_from_couple couple), [EDGE(start_node, end_node, params)]) 
	| head :: tail -> if (compare_edges head start_node end_node)
		then ((get_node_list_from_couple couple), [(analyze_edge_param_list head params)]@tail)
		else ((get_node_list_from_couple couple), [head]@(get_edge_list_from_couple(sweep_edge_list ((get_node_list_from_couple couple), tail) start_node end_node params)))
;;

(* modify the parameters of every single edge in the edge list *)

let rec add_params_to_each_edge edges params = match edges with
	| [] -> []
	| head :: tail -> [(analyze_edge_param_list head params)]@(add_params_to_each_edge tail params)
;; 

(* modify the parameters of every single node in the node list *)

let rec add_params_to_each_node nodes params = match nodes with
	| [] -> []
	| head :: tail -> [(analyze_node_param_list head params)]@(add_params_to_each_node tail params)
;; 

(* Applies the statement attribute to the node, to the edge or to the graph *)

let add_params_from_attr_stmt stmt_type params couple = match stmt_type with
	| "graph" -> couple 
	| "node" -> ((add_params_to_each_node (get_node_list_from_couple couple) params), (get_edge_list_from_couple couple))
	| "edge" -> ((get_node_list_from_couple couple), (add_params_to_each_edge (get_edge_list_from_couple couple) params)) 
	| _ -> couple
;;

(* add an edge to the set of all edges *)

let add_edge_to_edges edges edge = match edge with
	| EDGE(start_node, end_node, params) -> get_edge_list_from_couple (sweep_edge_list ([], edges) start_node end_node params)
;;

(* merge the new edges if they are the same as the old ones *)

let rec merge_edges edges1 edges2 = match edges2 with
	| [] -> edges1
	| head :: tail -> merge_edges (add_edge_to_edges edges1 head) tail
;;

(* add a node to the set of all nodes *)

let add_node_to_nodes nodes node = match node with
	| NODE (id, params) -> get_node_list_from_couple (sweep_node_list (nodes, []) id params)
;;

(* Parcourt l'ensemble des noeuds récents pour les ajouter à l'ancien ou modifier ceux de l'ancien s'il y en a des communs *) 
let rec merge_nodes nodes1 nodes2 = match nodes2 with
	| [] -> nodes1
	| head :: tail -> merge_nodes (add_node_to_nodes nodes1 head) tail
;;

(* merges a set of edges with a set of nodes using the 2 preceding functions *)

let merge_couple couple1 couple2 = match (couple1, couple2) with
	| ((nodes1, edges1), (nodes2, edges2)) -> ((merge_nodes nodes1 nodes2), (merge_edges edges1 edges2))
;;

(* Creates and edge between 2 nodes with the parameters *)

let create_edge node1 node2 params = match (node1, node2) with
	|	(NODE(id1, params1), NODE(id2, params2)) -> EDGE(id1, id2, params)
;;

(* Creates and edge between a node and a set of nodes *)

let rec create_multiple_edges nodes node params = match nodes with
	| [] -> []
	| head :: tail -> [create_edge node head params]@(create_multiple_edges tail node params)
;;

(* Creates all the edges between every single node of 2 set of nodes *)

let rec create_edges_between_nodes nodes1 nodes2 params = match nodes1 with
	| [] -> []
	| head :: tail -> (create_multiple_edges nodes2 head params)@(create_edges_between_nodes tail nodes2 params)
;;

(* The main function of graph analysis *)

let rec call_create_nodes_edges graph =

(* Analysis of the current statement and decides what to do (add a node, and edge, a parameter *)
	
	let rec analyze_stmt stmt couple = match stmt with 
		| NODE_STMT(id, params) -> sweep_node_list couple (id_id_to_string id) (attr_list_to_string_string_list params)
		| ATTR_STMT (stmt_type, params) -> (add_params_from_attr_stmt stmt_type (attr_list_to_string_string_list params) couple)
		| ID_ID param -> couple
		| EDGE_STMT(stmt, edgeRHS, params) -> merge_couple (sweep_edge_stmt stmt edgeRHS ([], []) (attr_list_to_string_string_list params)) couple
		| SUBGRAPH (id, stmt_list) -> merge_couple couple (call_create_nodes_edges (GRAPH(id, stmt_list))) (* Crée le sous-ensemble de sommets d'arêtes du subgraph et le fusionne avec celui du graph *) and
			(* Creates the edges from an edge statement. If the node is not existing, it's also added *)
			sweep_edge_stmt stmt edgeRHS couple params = match edgeRHS with
				| EDGERHS_EMPTY -> ([], [])
				| EDGERHS (next_stmt, next_edgeRHS)-> let c1 = (analyze_stmt stmt ([], [])) in
					let c2 = (analyze_stmt next_stmt ([], [])) in 
					let c3 = merge_couple c1 c2 in 
					let c4 = ((get_node_list_from_couple c3), (get_edge_list_from_couple c3)@(create_edges_between_nodes (get_node_list_from_couple c1) (get_node_list_from_couple c2) params)) in
					let c5 = (merge_couple c4 (sweep_edge_stmt next_stmt next_edgeRHS couple params)) in
					(merge_couple couple c5) in
				(* Gets the set of all nodes and edges from the statements of a graph *)
				let rec sweep_stmt_list stmt_list couple = match stmt_list with
				| [] -> couple
				| head :: tail -> sweep_stmt_list tail (analyze_stmt head couple) in
					let couple = ([], []) in  
						match graph with
						| GRAPH (id, stmt_list) -> sweep_stmt_list stmt_list couple
;;
