let () =
  let result_one = Ocaml.Solution.solve_one in
  print_endline (Printf.sprintf "Result part one: %d\n" result_one);
  let result_two = Ocaml.Solution.solve_two in
  print_endline (Printf.sprintf "Result part two: %d\n" result_two)
