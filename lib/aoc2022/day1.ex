defmodule Aoc2022.Day1 do
  def p1(input \\ p1_input()) do
    input
    |> count_elf_calories()
    |> Enum.max()
  end

  def p2(input \\ p1_input()) do
    input
    |> count_elf_calories()
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp count_elf_calories(input) do
    input
    |> String.split("\n\n")
    |> Stream.map(&String.split/1)
    |> Stream.map(fn elf ->
      elf
      |> Stream.map(&String.to_integer/1)
      |> Enum.sum()
    end)
  end

  defp p1_input do
    File.read!("#{Aoc2022.inputs_path()}/day1")
  end
end
