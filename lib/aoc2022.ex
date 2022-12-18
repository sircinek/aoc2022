defmodule Aoc2022 do
  def inputs_path, do: "./priv/inputs"

  def day1 do
    """
    Day1
    Part1: #{Aoc2022.Day1.p1()}
    Part2: #{Aoc2022.Day1.p2()}
    """
    |> IO.puts()
  end
end
