defmodule Aoc2022.Day5 do
  def p1(input \\ input()) do
    [crates, moves] = String.split(input, "\n\n")
    crates = parse_crates(crates)
    moves = parse_moves(moves)
    move_crates(crates, moves, &move_single/2)
  end

  def p2(input \\ input()) do
    [crates, moves] = String.split(input, "\n\n")
    crates = parse_crates(crates)
    moves = parse_moves(moves)
    move_crates(crates, moves, &move_multiple/2)
  end

  defp move_crates(crates, moves, movement_fn) do
    Enum.reduce(moves, crates, movement_fn)
    |> Enum.map(fn {_, stack} -> hd(stack) end)
    |> Enum.join()
  end

  defp move_multiple({count, from, to}, crates) do
    {to_push, left} = crates[from] |> Enum.split(count)

    crates
    |> Map.put(from, left)
    |> Map.put(to, to_push ++ crates[to])
  end

  defp move_single({count, from, to}, crates) do
    {to_push, left} = crates[from] |> Enum.split(count)

    crates
    |> Map.put(from, left)
    |> Map.put(to, Enum.reverse(to_push) ++ crates[to])
  end

  defp parse_moves(moves) do
    moves
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(fn line ->
      [_, count, _, from, _, to] = String.split(line, " ")
      [count, from, to] |> Enum.map(&String.to_integer/1) |> List.to_tuple()
    end)
  end

  defp parse_crates(crates) do
    crates
    |> String.split("\n")
    |> Stream.map(fn line ->
      line
      |> String.codepoints()
      |> Stream.chunk_every(4)
      |> Stream.map(fn
        ["[", crate, "]" | _] ->
          crate

        _ ->
          nil
      end)
    end)
    |> Enum.reduce([], fn stacks_in_line, acc ->
      stacks_in_line
      |> Enum.with_index(fn e, i -> {i + 1, e} end)
      |> then(fn stack -> acc ++ stack end)
    end)
    |> Enum.group_by(fn {stack, _} -> stack end, fn {_, value} -> value end)
    |> Stream.map(fn {k, v} -> {k, Enum.filter(v, & &1)} end)
    |> Enum.into(%{})
  end

  defp input do
    File.read!("#{Aoc2022.inputs_path()}/day5")
  end
end
