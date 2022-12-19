defmodule Aoc2022.Day3 do
  def p1(input \\ input()) do
    input
    |> String.split("\n", trim: true)
    |> Stream.map(fn line ->
      length = String.length(line)
      {first, second} = String.split_at(line, div(length, 2))

      first
      |> String.graphemes()
      |> Enum.reduce_while(0, fn e, a ->
        if String.contains?(second, e) do
          {:halt, value(e)}
        else
          {:cont, a}
        end
      end)
    end)
    |> Enum.sum()
  end

  def p2(input \\ input()) do
    input
    |> String.split("\n", trim: true)
    |> Stream.chunk_every(3)
    |> Stream.map(fn [first, second, third] ->
      first
      |> String.graphemes()
      |> Enum.reduce_while(0, fn e, a ->
        if String.contains?(second, e) && String.contains?(third, e) do
          {:halt, value(e)}
        else
          {:cont, a}
        end
      end)
    end)
    |> Enum.sum()
  end

  @lowercase ?a..?z |> Enum.zip(1..26) |> Enum.into(%{})
  @uppercase ?A..?Z |> Enum.zip(27..52) |> Enum.into(%{})
  @mapping Map.merge(@lowercase, @uppercase)
  defp value(<<char>>) do
    Map.fetch!(@mapping, char)
  end

  defp input do
    File.read!("#{Aoc2022.inputs_path()}/day3")
  end
end
