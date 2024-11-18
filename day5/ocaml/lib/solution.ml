let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let input_lines file =
  let input = read_input_file file in
  String.split_on_char '\n' input

let three_vowels s =
  let vowels = ['a'; 'e'; 'i'; 'o'; 'u'] in
  let count = List.fold_left (fun acc c -> if List.mem c vowels then acc + 1 else acc) 0 (List.of_seq (String.to_seq s)) in
  count >= 3

let double_letter s =
  let rec scan = function
    | [] | [_] -> false
    | a :: b :: tl -> if a = b then true else scan (b :: tl)
  in
  scan (String.to_seq s |> List.of_seq)

let bad_strings s =
  let bad_strings = ["ab"; "cd"; "pq"; "xy"] in
  let rec scan = function
    | [] | [_] -> false
    | a :: b :: tl -> if List.mem (String.of_seq (List.to_seq [a; b])) bad_strings then true else scan (b :: tl)
  in
  scan (String.to_seq s |> List.of_seq)

let check_string_one s =
  three_vowels s && double_letter s && not (bad_strings s)

let solve_one =
  let lines = input_lines "input.txt" in
  List.fold_left (fun acc s -> if check_string_one s then acc + 1 else acc) 0 lines

let has_repeated_substring s =
  let len = String.length s in
  let rec check i =
    if i >= len - 1 then false
    else
      let substr = String.sub s i 2 in
      let rec find_second j =
        if j >= len - 1 then false
        else if j > i + 1 && String.sub s j 2 = substr then true
        else find_second (j + 1)
      in
      if find_second (i + 2) then true
      else check (i + 1)
  in
  check 0

let has_letter_sandwich s =
  let len = String.length s in
  let rec check i =
    if i >= len - 2 then false
    else if s.[i] = s.[i + 2] then true
    else check (i + 1)
  in
  check 0

let check_string_two s =
  has_repeated_substring s && has_letter_sandwich s

let solve_two =
  let lines = input_lines "input.txt" in
  List.fold_left (fun acc s -> if check_string_two s then acc + 1 else acc) 0 lines
