let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let string_to_size s =
  let parts = String.split_on_char 'x' s in
  match parts with
  | [a; b; c] ->
    let a = int_of_string a in
    let b = int_of_string b in
    let c = int_of_string c in
    (a, b, c)
  | _ -> (0, 0, 0)

let sizes_from_input file =
    let input = read_input_file file in
    let lines = String.split_on_char '\n' input in
    List.map string_to_size lines

let needed_paper (l, w, h) = 2 * l * w + 2 * w * h + 2 * h * l + min (min (l * w) (w * h)) (h * l)

let needed_ribbon (l, w, h) =
  let sides = List.sort compare [l; w; h] in
  let ribbon = 2 * (List.nth sides 0) + 2 * (List.nth sides 1) in
  let bow = l * w * h in
  ribbon + bow

let solve_one sizes =
  List.fold_left (fun acc size -> acc + needed_paper size) 0 sizes

let solve_two sizes =
  List.fold_left (fun acc size -> acc + needed_ribbon size) 0 sizes

let () =
    let sizes = sizes_from_input "input.txt" in
    let result_one = solve_one sizes in
    print_endline (Printf.sprintf "Result part one: %d\n" result_one);
    let result_two = solve_two sizes in
    print_endline (Printf.sprintf "Result part two: %d\n" result_two)
