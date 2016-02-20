defmodule Tttoe do

  def main() do
    init()
  end

  defp init() do
    scenario = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}
    draw(scenario)
    tttoe(nil, scenario)
  end

  defp draw({c1, c2, c3, c4, c5, c6, c7, c8, c9}) do
    IO.puts("###################")
    IO.puts("#     #     #     #")
    IO.puts("#  #{c1}  #  #{c2}  #  #{c3}  #")
    IO.puts("#     #     #     #")
    IO.puts("###################")
    IO.puts("#     #     #     #")
    IO.puts("#  #{c4}  #  #{c5}  #  #{c6}  #")
    IO.puts("#     #     #     #")
    IO.puts("###################")
    IO.puts("#     #     #     #")
    IO.puts("#  #{c7}  #  #{c8}  #  #{c9}  #")
    IO.puts("#     #     #     #")
    IO.puts("###################")
  end

  defp tttoe(nil, {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}) do

    p = trunc(:random.uniform() * 10)

    case rem(p, 2) do
      0 -> player(:x, {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '})
      _ -> player(:o, {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '})
    end

  end

  defp tttoe(_, {c1, c2, c3, c4, c5, c6, c7, c8, c9})
    when c1 != ' ' and c2 != ' ' and c3 != ' '
      and c4 != ' ' and c5 != ' ' and c6 != ' '
      and c7 != ' ' and c8 != ' ' and c9 != ' ' do

      draw({c1, c2, c3, c4, c5, c6, c7, c8, c9})
      IO.puts("Tie game!")

  end

  defp tttoe(_, {c1, c2, c3, c4, c5, c6, c7, c8, c9})
    when (c1 == 'X' and c2 == 'X' and c3 == 'X')
      or (c4 == 'X' and c5 == 'X' and c6 == 'X')
      or (c7 == 'X' and c8 == 'X' and c9 == 'X')
      or (c1 == 'X' and c4 == 'X' and c7 == 'X')
      or (c2 == 'X' and c5 == 'X' and c8 == 'X')
      or (c3 == 'X' and c6 == 'X' and c9 == 'X')
      or (c1 == 'X' and c5 == 'X' and c9 == 'X')
      or (c3 == 'X' and c5 == 'X' and c7 == 'X') do

      draw({c1, c2, c3, c4, c5, c6, c7, c8, c9})
      IO.puts("Player X win!")

  end

  defp tttoe(_, {c1, c2, c3, c4, c5, c6, c7, c8, c9})
    when (c1 == 'O' and c2 == 'O' and c3 == 'O')
      or (c4 == 'O' and c5 == 'O' and c6 == 'O')
      or (c7 == 'O' and c8 == 'O' and c9 == 'O')
      or (c1 == 'O' and c4 == 'O' and c7 == 'O')
      or (c2 == 'O' and c5 == 'O' and c8 == 'O')
      or (c3 == 'O' and c6 == 'O' and c9 == 'O')
      or (c1 == 'O' and c5 == 'O' and c9 == 'O')
      or (c3 == 'O' and c5 == 'O' and c7 == 'O') do

      draw({c1, c2, c3, c4, c5, c6, c7, c8, c9})
      IO.puts("Player O win!")

  end

  defp tttoe(p, scenario) do
    draw(scenario)

    case p do
      :x -> player(:x, scenario)
      :o -> player(:o, scenario)
    end
  end

  defp player(p, {c1, c2, c3, c4, c5, c6, c7, c8, c9}) do

    c = case p do
      :x ->
        IO.gets("Player X: ") |> String.strip()
      :o ->
        IO.gets("Player O: ") |> String.strip()
    end

    case {p, c, {c1, c2, c3, c4, c5, c6, c7, c8, c9}} do
      {:x, "1", {' ', _, _, _, _, _, _, _, _}}  ->
        tttoe(:o, {'X', c2, c3, c4, c5, c6, c7, c8, c9})
      {:x, "2", {_, ' ', _, _, _, _, _, _, _}} ->
        tttoe(:o, {c1, 'X', c3, c4, c5, c6, c7, c8, c9})
      {:x, "3", {_, _, ' ', _, _, _, _, _, _}} ->
        tttoe(:o, {c1, c2, 'X', c4, c5, c6, c7, c8, c9})
      {:x, "4", {_, _, _, ' ', _, _, _, _, _}} ->
        tttoe(:o, {c1, c2, c3, 'X', c5, c6, c7, c8, c9})
      {:x, "5", {_, _, _, _, ' ', _, _, _, _}} ->
        tttoe(:o, {c1, c2, c3, c4, 'X', c6, c7, c8, c9})
      {:x, "6", {_, _, _, _, _, ' ', _, _, _}} ->
        tttoe(:o, {c1, c2, c3, c4, c5, 'X', c7, c8, c9})
      {:x, "7", {_, _, _, _, _, _, ' ', _, _}} ->
        tttoe(:o, {c1, c2, c3, c4, c5, c6, 'X', c8, c9})
      {:x, "8", {_, _, _, _, _, _, _, ' ', _}} ->
        tttoe(:o, {c1, c2, c3, c4, c5, c6, c7, 'X', c9})
      {:x, "9", {_, _, _, _, _, _, _, _, ' '}} ->
        tttoe(:o, {c1, c2, c3, c4, c5, c6, c7, c8, 'X'})
      {:o, "1", {' ', _, _, _, _, _, _, _, _}} ->
        tttoe(:x, {'O', c2, c3, c4, c5, c6, c7, c8, c9})
      {:o, "2", {_, ' ', _, _, _, _, _, _, _}} ->
        tttoe(:x, {c1, 'O', c3, c4, c5, c6, c7, c8, c9})
      {:o, "3", {_, _, ' ', _, _, _, _, _, _}} ->
        tttoe(:x, {c1, c2, 'O', c4, c5, c6, c7, c8, c9})
      {:o, "4", {_, _, _, ' ', _, _, _, _, _}} ->
        tttoe(:x, {c1, c2, c3, 'O', c5, c6, c7, c8, c9})
      {:o, "5", {_, _, _, _, ' ', _, _, _, _}} ->
        tttoe(:x, {c1, c2, c3, c4, 'O', c6, c7, c8, c9})
      {:o, "6", {_, _, _, _, _, ' ', _, _, _}} ->
        tttoe(:x, {c1, c2, c3, c4, c5, 'O', c7, c8, c9})
      {:o, "7", {_, _, _, _, _, _, ' ', _, _}} ->
        tttoe(:x, {c1, c2, c3, c4, c5, c6, 'O', c8, c9})
      {:o, "8", {_, _, _, _, _, _, _, ' ', _}} ->
        tttoe(:x, {c1, c2, c3, c4, c5, c6, c7, 'O', c9})
      {:o, "9", {_, _, _, _, _, _, _, _, ' '}} ->
        tttoe(:x, {c1, c2, c3, c4, c5, c6, c7, c8, 'O'})
      {_, _, {_, _, _, _, _, _, _, _, _}} ->
        player(p, {c1, c2, c3, c4, c5, c6, c7, c8, c9})
    end

  end

end

Tttoe.main()
