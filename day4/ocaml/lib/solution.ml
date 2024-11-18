let read_input_file file =
  let in_channel = open_in file in
  try
    In_channel.input_all in_channel
  with e ->
    close_in_noerr in_channel;
    raise e

let solve_one = 42

let solve_two = 42
