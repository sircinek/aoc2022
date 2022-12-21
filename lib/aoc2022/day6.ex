defmodule Aoc2022.Day6 do
  def p1(input \\ input()) do
    solve(input, 4)
  end

  def p2(input \\ input()) do
    solve(input, 14)
  end

  def solve(input, uniq_characters) do
    input
    |> String.codepoints()
    |> Stream.with_index(1)
    |> Enum.reduce_while([], fn {item, index}, queue ->
      new_queue = queue ++ [item]

      if length(new_queue) == uniq_characters do
        different_signals =
          new_queue
          |> Stream.uniq()
          |> Enum.count()

        if different_signals == uniq_characters do
          {:halt, index}
        else
          {:cont, tl(new_queue)}
        end
      else
        {:cont, new_queue}
      end
    end)
  end

  defp input do
    File.read!("#{Aoc2022.inputs_path()}/day6")
  end
end
