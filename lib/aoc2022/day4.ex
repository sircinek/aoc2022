defmodule Aoc2022.Day4 do
  def p1(input \\ input()) do
    filter = fn first_elf, second_elf ->
      MapSet.subset?(first_elf, second_elf) || MapSet.subset?(second_elf, first_elf)
    end

    solve(input, filter)
  end

  def p2(input \\ input()) do
    filter = fn first_elf, second_elf ->
      not MapSet.disjoint?(first_elf, second_elf)
    end

    solve(input, filter)
  end

  defp solve(input, filter_fn) do
    input
    |> String.split("\n", trim: true)
    |> Stream.filter(fn line ->
      [first, second, third, fourth] =
        String.split(line, ",")
        |> Stream.flat_map(&String.split(&1, "-"))
        |> Enum.map(&String.to_integer/1)

      first_elf = MapSet.new(first..second)
      second_elf = MapSet.new(third..fourth)
      filter_fn.(first_elf, second_elf)
    end)
    |> Enum.count()
  end

  defp input do
    File.read!("#{Aoc2022.inputs_path()}/day4")
  end
end
