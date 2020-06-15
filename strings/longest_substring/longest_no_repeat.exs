# Find the longest substring with no repeated letters
inputs = [
  "codingisawesome",
  "12345678123456789abcdef",
  "programareshermoso",
  "hellohello"
]

solution = fn input ->
  input
  |> String.split("")
  |> Enum.reduce(
    {{"", 0, %{}}, {"", 0}},
    fn (char, state = { {current_s, current_len, current_map }, {max_s, max_l}}) ->
      if char == "" do
        state
      else
        current_position = Map.get(current_map, char, 0)
        current_len = current_len + 1
        if current_position > 0 do
          if (current_len - 1) >= max_l do
            max_s = current_s
            max_l = current_len
            current_s = String.slice(current_s, current_position+1..(current_len-1))
            current_len = current_len - current_position
            current_map |> Enum.filter(fn {k, v} -> v > current_position end) |>
            {{current_s <> char, current_len, current_map, {max_s, max_l}}
          else
            current_s = String.slice(current_s, current_position+1..(current_len-1))
            current_len = current_len - current_position
            {{current_s <> char, current_len, current_map, {max_s, max_l}}
          end
        else
          {{current_s <> char, current_len, Map.update(current_map, char, current_len ,fn (_) -> current_len end)}, {max_s, max_l}}
        end
      end
    end)
end

inputs
  |> Enum.map(solution)
  |> Enum.zip(inputs)
  |> IO.inspect()
