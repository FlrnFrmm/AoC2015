let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let preprocess_input input =
  List.filter (fun x -> x == '(' || x == ')') (List.of_seq (String.to_seq input))

let solve_one input =
  List.fold_left (fun a v -> if v == '(' then a + 1 else a - 1) 0 input

let solve_two input =
  let rec find vs acc i =
    match vs with
    | [] -> None
    | '(' :: vs ->
      if (acc + 1) == -1 then Some i
      else find vs (acc + 1) (i + 1)
    | ')' :: vs ->
      if (acc - 1) == -1 then Some i
      else find vs (acc - 1) (i + 1)
    | _ :: vs -> find vs (acc - 1) (i + 1)
  in
  find input 0 1

let () =
    let input = "input.txt" |> read_input_file |> preprocess_input in
    let result_one = solve_one input in
    print_endline (Printf.sprintf "Result part one: %d\n" result_one);
    let result_two = solve_two input in
    print_endline (Printf.sprintf "Result part two: %d\n" (Option.value result_two ~default:0))
