type position = int * int

module Pairs =
       struct
         type t = position
         let compare (x0,y0) (x1,y1) =
           match Stdlib.compare y0 y1 with
               0 -> Stdlib.compare x0 x1
             | c -> c
       end

module PositionMap = Map.Make(Pairs)

type instruction = On | Off | Toggle

type command = {
  instruction : instruction;
  x : position;
  y : position;
}

let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let position_of_string s =
  let nums = String.split_on_char ',' s in
  match nums with
  | left :: right :: [] -> (int_of_string left, int_of_string right)
  | _ -> failwith "invalid input"

let parse_line s = match String.split_on_char ' ' s with
  | _ :: b :: _ :: d :: [] -> { instruction = Toggle; x = position_of_string b; y = position_of_string d }
  | _ :: b :: c :: _ :: e :: [] -> (match b with
    | "on" -> { instruction = On; x = position_of_string c; y = position_of_string e }
    | "off" -> { instruction = Off; x = position_of_string c; y = position_of_string e }
    | _ -> failwith "Invalid input")
  | _ -> failwith "Invalid input"

let process_input file =
  let input = read_input_file file in
  let lines = List.filter (fun s -> s <> "") (String.split_on_char '\n' input) in
  List.map parse_line lines

let solve_one = 42

let solve_two = 42
