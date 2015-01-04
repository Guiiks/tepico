
open Syntax
open Functions
open Html
open Filename


(* Main program *)
let _ =
	if (Array.length Sys.argv) == 2 then begin  
		if check_suffix (Sys.argv.(1))  ".dot" then begin
			let file = open_in Sys.argv.(1) in 
			try
				let lexbuf = Lexing.from_channel file in
					let graph = Parser.graph Lexer.token lexbuf in
						let filename = chop_extension (basename (Sys.argv.(1))) in
							let couple = call_create_nodes_edges graph in	
								export_graph_to_html couple filename;
								print_endline ("DONE.\n");
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
