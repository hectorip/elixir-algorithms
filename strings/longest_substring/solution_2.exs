# Solution using indexes

solution = fn input ->

input
  |> Enum.reduce(fn c, state ->
    IO.puts(c)
  end)

end
