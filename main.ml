open Printf
open Filename
open Syntax
open Dot2D3

let save_graph_in_html couple filename =
	let saved_graph = open_out ("./html/" ^ filename ^ ".html") in
	let header = open_in "./html/header.html" in
	let footer = open_in "./html/footer.html" in
	try
		while true; do
			fprintf saved_graph "%s\n" (input_line header);
		done;
	with End_of_file ->
		close_in header;
		fprintf saved_graph "%s" (print_graph couple);
		try
			while true; do 
				fprintf saved_graph "%s\n" (input_line footer);
			done;
		with End_of_file ->
			close_out saved_graph;
			close_in footer;
;;

(* Programme d'appel, lit le fichier .dot, le transforme en graph, l'analyse et retourne le fichier html *)
let _ =
	if (Array.length Sys.argv) == 2 then begin  
		if check_suffix (Sys.argv.(1))  ".dot" then begin
			let file = open_in Sys.argv.(1) in 
			try
				let lexbuf = Lexing.from_channel file in
					let graph = Parser.graph Lexer.token lexbuf in
						print_endline ("Graph: OK" ^ "\nContenu du graphe: " ^ (graph_to_string graph) ^ "\n"); let couple = call_create_nodes_edges graph in	
							print_endline ("Nodes and edges: OK\n" ^ (couple_to_string couple) ^ "\n"); save_graph_in_html couple (chop_extension (basename (Sys.argv.(1))));
							print_endline ("HTML generated in /output directory.\n" ^ (print_graph couple) ^ "\n");
							flush stdout
			with Lexer.Eof ->
				close_in file;
				exit 0
		end
		else begin
			print_endline "Bad file extension: .dot expected";exit 0
		end
	end else begin 
		print_endline "Expected command: ./dot2D3 file.dot"; exit 0 
	end;;