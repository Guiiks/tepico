
(* This file contains all functions to write the javascript code in the HTML file *)

open Syntax
open Printf
open Filename



(* Transforme une string en char list *)
let explode s =
 	let rec expl i l =
		if i < 0 then l else
			expl (i - 1) (s.[i] :: l) in
  			expl (String.length s - 1) [];;

(* Function that encodes a letter *)
let encode_char letter = 
	let code = int_of_char letter in
		if (code < 48 || code > 57 && code < 65 || code > 90 && code < 97 || code > 122) 
			then "_" ^ (Printf.sprintf "%x" code) 
			else String.make 1 letter 
;;	

(* Function to encode a word *)
let rec encode word = match word with
	| [] -> "" 
	| head :: tail -> (encode_char head)^(encode tail)
;;



(* Function that writes all parameters *)
let rec write_params params = match params with
	| [] -> ""
	| head :: tail -> match head with
		| (attr, value) -> ", " ^ attr ^ " : \"" ^ value ^ "\"" ^ (write_params tail)
;;

(* Function to write a list of nodes *)
let rec write_nodes nodes = match nodes with
	| [] -> ""
	| head :: tail -> match head with
		| NODE(id, params) -> let encoded_id = (encode (explode id)) in "var " ^ encoded_id ^ " = { x : 20, y : 20 " ^ (write_params params) ^ "};\nnodes.push(" ^ encoded_id ^");\n" ^ (write_nodes tail)
;;

(* Function to write a list of edges *)
let rec write_edges edges count = match edges with 
	| [] -> ""
	| head :: tail -> match head with
		| EDGE(start_node, end_node, params) -> "var edge" ^ (string_of_int count) ^ " = { source : " ^ (encode (explode start_node)) ^ ", target : " ^ (encode (explode end_node)) ^ (write_params params) ^"};\nlinks.push(edge" ^ (string_of_int count) ^ ");\n" ^ (write_edges tail (count + 1))
;;



(* Main function to export the graph to an HTML page *)
let export_graph_to_html couple filename =
	let saved_graph = open_out ("./output/" ^ filename ^ ".html") in
	let header = open_in "./includes/header.html" in
	let footer = open_in "./includes/footer.html" in
	try
	(* Writing the header part *)
		while true; do
			fprintf saved_graph "%s\n" (input_line header);
		done;
	with End_of_file ->
		close_in header;

		(* Writing the graph *)
		fprintf saved_graph "%s" (match couple with (nodes, edges) -> (write_nodes nodes)^(write_edges edges 0));
		try

			(* Writing the footer *)
			while true; do 
				fprintf saved_graph "%s\n" (input_line footer);
			done;

		with End_of_file ->
			close_out saved_graph;
			close_in footer;
;;
