(* functions.ml *)
open Filename
open Syntax
open Printf


(* Convertit un couple id et port en une string composé de l'id, le port n'étant pas implémenté dans le sujet *)
let id_id_to_string id = match id with
	| (ID(a), ID(b)) -> a
;; 


(* Renvoie la liste de noeuds *)
let get_node_list_from_couple couple = match couple with
	| (a, b) -> a
;;

(* Renvoie la liste d'arrêtes *)

let get_edge_list_from_couple couple = match couple with
	| (a, b) -> b
;; 

(* Un couple d'id correspond à un paramètre avant l'analyse par le middle end, on convertit ça en couple de string *)

let id_id_to_string_string id = match id with
	| (ID(a), ID(b)) -> (a, b)
;;

(* Une a_list est une liste de couple d'id, il faut la traduire en liste de couple de string pour le middle end *)

let rec a_list_to_string_string_list a_list = match a_list with
	| [] -> []
	| [a] -> [id_id_to_string_string a]
	| head :: tail -> [(id_id_to_string_string head)]@(a_list_to_string_string_list tail)
;;

(* Une attr_list est une liste de a_list, la réduction se fait en une liste de couple de string*)

let rec attr_list_to_string_string_list params = match params with 
	| [] -> []
	| head :: tail -> (a_list_to_string_string_list head)@(attr_list_to_string_string_list tail) 
;;

(* Compare l'identifiant d'un noeud avec une chaîne de caractère *)

let compare_nodes node id = match node with
	| NODE (node_id, node_params) -> if id = node_id then true else false
;;

(* Récupère le nom d'un paramètre, utile pour la comparaison *)
let get_param_name param = match param with
	| (a, b) -> a
;;

(* Dans le middle end, si un paramètre existe déjà, on remplace automatiquement sa valeur par la nouvelle *)
let replace_param_value param1 param2 = match (param1, param2) with
	| ((a,b), (c,d)) -> (a,d)
;;

(* Compare le nom de deux paramètres, true s'ils sont identiques, case sensitive *)
let compare_params param1 param2 = 
	if (get_param_name param1) = (get_param_name param2) 
	then true 
	else false
;;

(* Parcourt la liste des paramètres existants du noeud pour savoir quoi faire du paramètre courant (ajout ou modification) *)

let rec sweep_param_list stmt_params param = match stmt_params with
	| [] -> [param]
	| head :: tail -> if (compare_params head param) then [(replace_param_value head param)]@tail else [head]@(sweep_param_list tail param)
;;

(* Parcourt la liste des paramètres d'un stmt en cours d'analyse. Chaque paramètre est traité pour savoir s'il faut l'ajouter ou modifier un existant *)

let rec sweep_both_param_list stmt_params params = match params with
	| [] -> []
	| head :: tail -> (sweep_param_list stmt_params head)@(sweep_both_param_list stmt_params tail)
;;

(* Récupère la liste des paramètres d'une arête pour la fusionner avec une liste de paramètres *)
let analyze_edge_param_list edge params = match edge with
	| EDGE (start_node, end_node, edge_params) -> EDGE(start_node, end_node, (sweep_both_param_list edge_params params))
;;	

(* Récupère la liste des paramètre d'un noeud pour la fusionner avec une liste de paramètres *)
let analyze_node_param_list node params = match node with
	| NODE (node_id, node_params) -> NODE(node_id, (sweep_both_param_list node_params params))  
;;

(* Ajoute un label valant l'ID s'il n'en pas déjà un lors de la création d'un noeud *)
let rec add_label id params = match params with
	| [] -> [("label", id)]
	| head :: tail -> if (compare_params head ("label", "")) 
		then params
		else [head]@(add_label id tail) 
;;

(* La liste des noeuds est parcourue, si un nom n'est pas présent, on l'ajoute avec ses paramètres, 
	sinon, on ne crée pas de noeud mais on parcourt les paramètres pour voir s'il y en a des nouveaux ou des modifiables *)

let rec sweep_node_list couple id params = match (get_node_list_from_couple couple) with 
	| [] -> ([NODE(id, (add_label id params))], get_edge_list_from_couple couple)
	|	head :: tail -> if (compare_nodes head id) 
		then ([(analyze_node_param_list head params)]@tail, (get_edge_list_from_couple couple))
		else ([head]@(get_node_list_from_couple(sweep_node_list (tail, (get_edge_list_from_couple couple)) id params)), (get_edge_list_from_couple couple)) 
;;

(* Compare une arête avec deux strings *)
let compare_edges edge start_node end_node = match edge with
	| EDGE (sn, en, params) -> if (sn = start_node && en = end_node)
		then true
		else false
;;

(* La liste des arêtes est parcourue, si un nom n'est pas présent, on l'ajoute avec ses paramètres, 
	sinon, on ne crée pas d'arête mais on parcourt les paramètres pour voir s'il y en a des nouveaux ou des modifiables *)
let rec sweep_edge_list couple start_node end_node params = match (get_edge_list_from_couple couple) with
	| [] -> ((get_node_list_from_couple couple), [EDGE(start_node, end_node, params)]) 
	| head :: tail -> if (compare_edges head start_node end_node)
		then ((get_node_list_from_couple couple), [(analyze_edge_param_list head params)]@tail)
		else ((get_node_list_from_couple couple), [head]@(get_edge_list_from_couple(sweep_edge_list ((get_node_list_from_couple couple), tail) start_node end_node params)))
;;

(* Parcourt la liste d'arêtes pour ajouter ou modifier les paramètres de params *)
let rec add_params_to_each_edge edges params = match edges with
	| [] -> []
	| head :: tail -> [(analyze_edge_param_list head params)]@(add_params_to_each_edge tail params)
;; 

(* Parcourt la liste de noeuds pour ajouter ou modifier les paramètres de params *)
let rec add_params_to_each_node nodes params = match nodes with
	| [] -> []
	| head :: tail -> [(analyze_node_param_list head params)]@(add_params_to_each_node tail params)
;; 

(* Analise un attr_stmt pour savoir s'il faut l'appliquer au graph, aux noeuds ou arêtes et agit en fonction *) 
let add_params_from_attr_stmt stmt_type params couple = match stmt_type with
	| "graph" -> couple (* Les attributs de graph ne sont pas transmis à D3.js *)
	| "node" -> ((add_params_to_each_node (get_node_list_from_couple couple) params), (get_edge_list_from_couple couple))
	| "edge" -> ((get_node_list_from_couple couple), (add_params_to_each_edge (get_edge_list_from_couple couple) params)) 
	| _ -> couple
;;

(* Ajoute une arête à un ensemble d'arêtes existant *)
let add_edge_to_edges edges edge = match edge with
	| EDGE(start_node, end_node, params) -> get_edge_list_from_couple (sweep_edge_list ([], edges) start_node end_node params)
;;

(* Parcout  l'ensemble des arêtes récentes pour les ajouter à l'ancien ou modifier celles de l'ancien s'il y en a des communes *)
let rec merge_edges edges1 edges2 = match edges2 with
	| [] -> edges1
	| head :: tail -> merge_edges (add_edge_to_edges edges1 head) tail
;;

(* Ajoute un noeud à un ensemble de noeuds existant *)
let add_node_to_nodes nodes node = match node with
	| NODE (id, params) -> get_node_list_from_couple (sweep_node_list (nodes, []) id params)
;;

(* Parcourt l'ensemble des noeuds récents pour les ajouter à l'ancien ou modifier ceux de l'ancien s'il y en a des communs *) 
let rec merge_nodes nodes1 nodes2 = match nodes2 with
	| [] -> nodes1
	| head :: tail -> merge_nodes (add_node_to_nodes nodes1 head) tail
;;

(* Fusionne deux ensembles de noeuds et arêtes. Couple2 étant l'ensemble le plus récent, ses params identiques à ceux de couple1 modifier ceux du premier *)
let merge_couple couple1 couple2 = match (couple1, couple2) with
	| ((nodes1, edges1), (nodes2, edges2)) -> ((merge_nodes nodes1 nodes2), (merge_edges edges1 edges2))
;;

let create_edge node1 node2 params = match (node1, node2) with
	|	(NODE(id1, params1), NODE(id2, params2)) -> EDGE(id1, id2, params)
;;

let rec create_multiple_edges nodes node params = match nodes with
	| [] -> []
	| head :: tail -> [create_edge node head params]@(create_multiple_edges tail node params)
;;

(* Crée une arête pour chaque noeud d'un premier ensemble avec chaque noeud du second *)
let rec create_edges_between_nodes nodes1 nodes2 params = match nodes1 with
	| [] -> []
	| head :: tail -> (create_multiple_edges nodes2 head params)@(create_edges_between_nodes tail nodes2 params)
;;

(* Point d'entrée du traitement du graph *)
let rec call_create_nodes_edges graph =
(* Analyse le stmt courant parmi une liste pour savoir quoi faire (ajout de noeud, arête, modification ou ajout de paramètre *)
	let rec analyze_stmt stmt couple = match stmt with 
		| NODE_STMT(id, params) -> sweep_node_list couple (id_id_to_string id) (attr_list_to_string_string_list params)
		| ATTR_STMT (stmt_type, params) -> (add_params_from_attr_stmt stmt_type (attr_list_to_string_string_list params) couple)
		| ID_ID param -> couple
		| EDGE_STMT(stmt, edgeRHS, params) -> merge_couple (sweep_edge_stmt stmt edgeRHS ([], []) (attr_list_to_string_string_list params)) couple
		| SUBGRAPH (id, stmt_list) -> merge_couple couple (call_create_nodes_edges (GRAPH(id, stmt_list))) (* Crée le sous-ensemble de sommets d'arêtes du subgraph et le fusionne avec celui du graph *) and
			(* Crée les arêtes issus d'un edge_stmt, si un noeud composant l'arête n'existe pas, il est aussi ajouté *)
			sweep_edge_stmt stmt edgeRHS couple params = match edgeRHS with
				| EDGERHS_EMPTY -> ([], [])
				| EDGERHS (next_stmt, next_edgeRHS)-> let c1 = (analyze_stmt stmt ([], [])) in
					let c2 = (analyze_stmt next_stmt ([], [])) in 
					let c3 = merge_couple c1 c2 in 
					let c4 = ((get_node_list_from_couple c3), (get_edge_list_from_couple c3)@(create_edges_between_nodes (get_node_list_from_couple c1) (get_node_list_from_couple c2) params)) in
					let c5 = (merge_couple c4 (sweep_edge_stmt next_stmt next_edgeRHS couple params)) in
					(merge_couple couple c5) in
				(* Parcourt tous les stmts d'un graphe, retourne l'ensemble des noeuds ou arêtes *)
				let rec sweep_stmt_list stmt_list couple = match stmt_list with
				| [] -> couple
				| head :: tail -> sweep_stmt_list tail (analyze_stmt head couple) in
					let couple = ([], []) in  
						match graph with
						| GRAPH (id, stmt_list) -> sweep_stmt_list stmt_list couple
;;

<<<<<<< HEAD
(* Transforme une string en char list *)
let explode s =
  let rec expl i l =
    if i < 0 then l else
    expl (i - 1) (s.[i] :: l) in
  expl (String.length s - 1) [];;

(* Encode un caractère selon le sujet du projet *)
let encode_char letter = 
	let code = int_of_char letter in
		if (code < 48 || code > 57 && code < 65 || code > 90 && code < 97 || code > 122) 
			then "_" ^ (Printf.sprintf "%x" code) 
			else String.make 1 letter 
;;	

let rec encode word = match word with
	| [] -> "" 
	| head :: tail -> (encode_char head)^(encode tail)
;;

let print_param param = match param with
	| (attr, value) -> ", " ^ attr ^ " : \"" ^ value ^ "\""
;;

let rec print_params params = match params with
	| [] -> ""
	| head :: tail -> (print_param head) ^ (print_params tail)
;;

let print_node node = match node with 
	| NODE(id, params) -> let encoded_id = (encode (explode id)) in "var " ^ encoded_id ^ " = { x : 20, y : 20 " ^ (print_params params) ^ "};\nnodes.push(" ^ encoded_id ^");\n"
;;

let rec print_nodes nodes = match nodes with
	| [] -> ""
	| head :: tail -> (print_node head) ^ (print_nodes tail)
;;

let print_edge edge count = match edge with
	| EDGE(start_node, end_node, params) -> "var edge" ^ (string_of_int count) ^ " = { source : " ^ (encode (explode start_node)) ^ ", target : " ^ (encode (explode end_node)) ^ (print_params params) ^"};\nlinks.push(edge" ^ (string_of_int count) ^ ");\n" 

let rec print_edges edges count = match edges with 
	| [] -> ""
	| head :: tail -> (print_edge head count) ^ (print_edges tail (count + 1))
;;

let print_graph couple = match couple with 
	| (nodes, edges) -> (print_nodes nodes)^(print_edges edges 0)
;;
