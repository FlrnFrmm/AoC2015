type direction = North | East | South | West

let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let parse_char c = match c with
  | '^' -> Ok North
  | '>' -> Ok East
  | 'v' -> Ok South
  | '<' -> Ok West
  | other -> Error (Printf.sprintf "%c is not a valied char" other)

let parse_input file =
  let input = read_input_file file in
  let chars = input |> String.to_seq |> List.of_seq in
  List.filter_map Result.to_option (List.map parse_char chars)

let next_position (x, y) direction = match direction with
  | North -> (x, y + 1)
  | East -> (x + 1, y)
  | South -> (x, y - 1)
  | West -> (x - 1, y)

let solve_one =
  let directions = parse_input "input.txt" in
  let positions = List.fold_left (fun acc dir -> next_position (List.hd acc) dir :: acc) [(0, 0)] directions in
  List.sort_uniq compare positions |> List.length

let solve_two =
  let directions = parse_input "input.txt" in
  let santa_directions = List.filteri (fun i _ -> i mod 2 = 0) directions in
  let robo_santa_directions = List.filteri (fun i _ -> i mod 2 = 1) directions in
  let santa_positions = List.fold_left (fun acc dir -> next_position (List.hd acc) dir :: acc) [(0, 0)] santa_directions in
  let robo_santa_positions = List.fold_left (fun acc dir -> next_position (List.hd acc) dir :: acc) [(0, 0)] robo_santa_directions in
  List.sort_uniq compare (santa_positions @ robo_santa_positions) |> List.length
