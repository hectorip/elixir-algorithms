# Find the longest substring with no repeated letters
input = "abcded"

input
  |> Enum.map_reduce(
    %{current: {"", 0}, max: {"", 0}},
    (char, s) -> IO.puts(char) end)
  )
