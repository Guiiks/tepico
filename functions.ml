(* functions.ml *)
open Filename
open Syntax
open Printf




(* ToString Functions *)

(* Converts a couple ("id", "port") into a string "id" *)
let id_couple_to_string id = match id with
	| (ID(a), ID(b)) -> a
;; 

(* Converts an id couple into a string couple - an id couple is a parameter before analysis *)
let id_couple_to_string_couple id = match id with
	| (ID(a), ID(b)) -> (a, b)
;;




(* Kind of constructors *)

(* Creates an edge between 2 nodes with the parameters *)
let create_edge node1 node2 params = match (node1, node2) with
	|	(NODE(id1, params1), NODE(id2, params2)) -> EDGE(id1, id2, params)
;;

(* Creates edges between a node and a set of nodes *)
let rec create_multiple_edges nodes node params = match nodes with
	| [] -> []
	| head :: tail -> [create_edge node head params]@(create_multiple_edges tail node params)
;;

(* Creates all the edges between every single node of 2 set of nodes *)
let rec create_edges_between_nodes nodes1 nodes2 params = match nodes1 with
	| [] -> []
	| head :: tail -> (create_multiple_edges nodes2 head params)@(create_edges_between_nodes tail nodes2 params)
;;




(* Getters *)

(* Returns the node list *)
let get_node_list couple = match couple with
	| (a, b) -> a
;;

(* Returns the edge list *)
let get_edge_list couple = match couple with
	| (a, b) -> b
;; 

(* Get a parameter name *)
let get_param param = match param with
	| (a, b) -> a
;;




(* Setters *)

(* Replace the parameter value  if exists by his new value *)
let update_param param1 param2 = match (param1, param2) with
	| ((a,b), (c,d)) -> (a,d)
;;




(* Converts a a_list ( = an id couple list) into a string couple list *)
let rec a_list_to_string_couple_list a_list = match a_list with
	| [] -> []
	| [a] -> [id_couple_to_string_couple a]
	| head :: tail -> [(id_couple_to_string_couple head)]@(a_list_to_string_couple_list tail)
;;

(* Converts a a_list list into a string couple list *)
let rec attr_list_to_string_couple_list params = match params with 
	| [] -> []
	| head :: tail -> (a_list_to_string_couple_list head)@(attr_list_to_string_couple_list tail) 
;;




(* Comparators *)

(* Compares a node id with a string *)
let compare_nodes node id = match node with
	| NODE (node_id, node_params) -> if id = node_id then true else false
;;

(* Compares 2 parameters names *)
let compare_params param1 param2 = 
	if (get_param param1) = (get_param param2) 
	then true 
	else false
;;

(* Compares an edge with the starting node string and the ending node string *)
let compare_edges edge start_node end_node = match edge with
	| EDGE (sn, en, params) -> if (sn = start_node && en = end_node)
		then true
		else false
;;




(* Adds an id label to the parameter if not exists *)
let rec add_label id params = match params with
	| [] -> [("label", id)]
	| head :: tail -> if (compare_params head ("label", "")) 
		then params
		else [head]@(add_label id tail) 
;;

(* Adds the current parameter into the parameters list *)
let rec add_to_param_list elem_params param = match elem_params with
	| [] -> [param]
	| head :: tail -> if (compare_params head param) then [(update_param head param)]@tail else [head]@(add_to_param_list tail param)
;;

(* Sweeps the parameters list of a current statement to modify every single parameter *)
let rec sweep_both_param_list elem_params params = match params with
	| [] -> []
	| head :: tail -> (add_to_param_list elem_params head)@(sweep_both_param_list elem_params tail)
;;

(* Merges a parameters list of an edge with a parameter list *)
let analyze_edge_param_list edge params = match edge with
	| EDGE (start_node, end_node, edge_params) -> EDGE(start_node, end_node, (sweep_both_param_list edge_params params))
;;	

(* Merges a parameters list of a node with a parameter list *)
let analyze_node_param_list node params = match node with
	| NODE (node_id, node_params) -> NODE(node_id, (sweep_both_param_list node_params params))  
;;




(* Adding functions *)

(* Adds a non-existing node with his parameters in the node list *)
let rec add_to_node_list couple id params = match (get_node_list couple) with 
	| [] -> ([NODE(id, (add_label id params))], get_edge_list couple)
	|	head :: tail -> if (compare_nodes head id) 
		then ([(analyze_node_param_list head params)]@tail, (get_edge_list couple))
		else ([head]@(get_node_list(add_to_node_list (tail, (get_edge_list couple)) id params)), (get_edge_list couple)) 
;;

(* Adds a non-existing edge with his parameters in the node list *)
let rec add_to_edge_list couple start_node end_node params = match (get_edge_list couple) with
	| [] -> ((get_node_list couple), [EDGE(start_node, end_node, params)]) 
	| head :: tail -> if (compare_edges head start_node end_node)
		then ((get_node_list couple), [(analyze_edge_param_list head params)]@tail)
		else ((get_node_list couple), [head]@(get_edge_list(add_to_edge_list ((get_node_list couple), tail) start_node end_node params)))
;;

(* Update parameters of every single edge in the edge list *)
let rec add_params_to_each_edge edges params = match edges with
	| [] -> []
	| head :: tail -> [(analyze_edge_param_list head params)]@(add_params_to_each_edge tail params)
;; 

(* Update parameters of every single node in the node list *)
let rec add_params_to_each_node nodes params = match nodes with
	| [] -> []
	| head :: tail -> [(analyze_node_param_list head params)]@(add_params_to_each_node tail params)
;; 

(* Applies the statement attribute to the node, to the edge or to the graph *)
let add_params_from_attr elem_type params couple = match elem_type with
	| "graph" -> couple 
	| "node" -> ((add_params_to_each_node (get_node_list couple) params), (get_edge_list couple))
	| "edge" -> ((get_node_list couple), (add_params_to_each_edge (get_edge_list couple) params)) 
	| _ -> couple
;;

(* Adds an edge to the set of all edges *)
let add_edge_to_edges edges edge = match edge with
	| EDGE(start_node, end_node, params) -> get_edge_list (add_to_edge_list ([], edges) start_node end_node params)
;;

(* Adds a node to the set of all nodes *)
let add_node_to_nodes nodes node = match node with
	| NODE (id, params) -> get_node_list (add_to_node_list (nodes, []) id params)
;;





(* Merge functions *)

(* Merge two list of edges while preventing from duplicates *) 
let rec merge_edges edges1 edges2 = match edges2 with
	| [] -> edges1
	| head :: tail -> merge_edges (add_edge_to_edges edges1 head) tail
;;

(* Merge two list of nodes while preventing from duplicates *) 
let rec merge_nodes nodes1 nodes2 = match nodes2 with
	| [] -> nodes1
	| head :: tail -> merge_nodes (add_node_to_nodes nodes1 head) tail
;;

(* Merge two couple of nodes and edges together *) 
let merge_couple couple1 couple2 = match (couple1, couple2) with
	| ((nodes1, edges1), (nodes2, edges2)) -> ((merge_nodes nodes1 nodes2), (merge_edges edges1 edges2))
;;





(* The main function of the graph analysis *)
let rec call_create_nodes_edges graph =

	(* Analyses of the current statement and decides what to do (add a node, an edge, a parameter) *)
	let rec analyze_elem elem couple = match elem with 
		| ID_COUPLE param -> couple
		| ATTR (elem_type, params) -> (add_params_from_attr elem_type (attr_list_to_string_couple_list params) couple)
		| NODE_ELEM(id, params) -> add_to_node_list couple (id_couple_to_string id) (attr_list_to_string_couple_list params)
		| EDGE_ELEM(elem, edge_RHS, params) -> merge_couple (add_to_edge_elem elem edge_RHS ([], []) (attr_list_to_string_couple_list params)) couple
		| SUBGRAPH (id, elem_list) -> merge_couple couple (call_create_nodes_edges (GRAPH(id, elem_list))) and

			(* Creates the edges from an edge statement. If the node is not existing, it's also added *)
			add_to_edge_elem elem edge_RHS couple params = match edge_RHS with
				| NULL -> ([], [])
				| EDGE_RHS (next_elem, next_edge_RHS)->
					(merge_couple couple (merge_couple (((get_node_list (merge_couple (analyze_elem elem ([], [])) (analyze_elem next_elem ([], [])))),
					(get_edge_list (merge_couple (analyze_elem elem ([], [])) (analyze_elem next_elem ([], []))))@(create_edges_between_nodes (get_node_list (analyze_elem elem ([], [])))
					(get_node_list (analyze_elem next_elem ([], []))) params))) (add_to_edge_elem next_elem next_edge_RHS couple params))) in

				(* Gets the set of all nodes and edges from the statements of a graph *)
				let rec sweep_elem_list elem_list couple = match elem_list with
				| [] -> couple
				| head :: tail -> sweep_elem_list tail (analyze_elem head couple) in
					let couple = ([], []) in  
						match graph with
						| GRAPH (id, elem_list) -> sweep_elem_list elem_list couple
;;




