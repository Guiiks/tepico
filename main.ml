
open Syntax
open Functions
open Html
open Filename


(* Main function that checks if arguments and file are ok, then parse and export the tree to the HTML page *)

let _ =

	if (Array.length Sys.argv) != 2 then begin
		print_endline "Usage: ./main samples/a.dot";
		exit 1
	end else begin
		if check_suffix (Sys.argv.(1))  ".dot" then begin
			let file = open_in Sys.argv.(1) in 
			try
				let lexbuf = Lexing.from_channel file in
					let graph = Parser.graph Lexer.token lexbuf in
						let filename = chop_extension (basename (Sys.argv.(1))) in
							let couple = call_create_nodes_edges graph in	
								export_graph_to_html couple filename;
								print_endline ("\nDONE.\nExported in output/" ^ filename ^ ".html\n");
								flush stdout
			with Lexer.Eof ->
				close_in file;
				exit 0
		end else begin
			print_endline "Error: .dot file expected";
			exit 2
		end
	end