open Printf
open Filename
open Syntax
open Functions

let export_to_html couple filename =
	let header = open_in "./includes/header.html" in
	let footer = open_in "./includes/footer.html" in
	let graph_final = open_out ("./output/" ^ filename ^ ".html") in
	
	try
		while true; do
			fprintf graph_final "%s\n" (input_line header);
		done;
	with End_of_file ->
		close_in header;
		fprintf graph_final "%s" (print_graph couple);
		try
			while true; do 
				fprintf graph_final "%s\n" (input_line footer);
			done;
		with End_of_file ->
			close_out graph_final;
			close_in footer;
;;

(* Main Program *)

let _ =
	if (Array.length Sys.argv) == 2 then begin  
		if check_suffix (Sys.argv.(1))  ".dot" then begin
			let file = open_in Sys.argv.(1) in 
			try
				let lexbuf = Lexing.from_channel file in
					let graph = Parser.graph Lexer.token lexbuf in
						print_endline ("Graph: OK" ^ "\nContenu du graphe: " ^ (graph_to_string graph) ^ "\n"); let couple = call_create_nodes_edges graph in	
							print_endline ("Nodes and edges: OK\n" ^ (couple_to_string couple) ^ "\n"); export_to_html couple (chop_extension (basename (Sys.argv.(1))));
							print_endline ("HTML generated in /output directory.\n" ^ (print_graph couple) ^ "\n");
							flush stdout
			with Lexer.Eof ->
				close_in file;
				exit 0
		end
		else begin
			print_endline "Bad file extension: .dot expected" ; exit 0
		end
	end else begin 
		print_endline "Expected command: ./main file.dot" ; exit 0 
	end;;
