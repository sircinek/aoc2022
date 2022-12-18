defmodule Aoc2022.Day2 do
  def p1(input \\ p1_input()) do
    input
    |> String.split("\n", trim: true)
    |> Stream.map(fn line ->
      [elf, you] = line |> String.split() |> Enum.map(&shape/1)
      result = result(elf, you) |> score()
      shape_score = shape_score(you)
      result + shape_score
    end)
    |> Enum.sum()
  end

  def p2(input \\ p1_input()) do
    input
    |> String.split("\n", trim: true)
    |> Stream.map(fn line ->
      [elf, expected_result] = line |> String.split()
      elf_shape = shape(elf)
      your_shape = what_to_play(elf_shape, how_ends(expected_result))
      result = result(elf_shape, your_shape) |> score()
      shape_score = shape_score(your_shape)
      result + shape_score
    end)
    |> Enum.sum()
  end

  defp what_to_play(:rock, :win), do: :paper
  defp what_to_play(:rock, :lose), do: :scissors
  defp what_to_play(:paper, :win), do: :scissors
  defp what_to_play(:paper, :lose), do: :rock
  defp what_to_play(:scissors, :win), do: :rock
  defp what_to_play(:scissors, :lose), do: :paper
  defp what_to_play(shape, :draw), do: shape

  defp how_ends("X"), do: :lose
  defp how_ends("Y"), do: :draw
  defp how_ends("Z"), do: :win

  defp result(:rock, :paper), do: :win
  defp result(:rock, :scissors), do: :lose
  defp result(:paper, :rock), do: :lose
  defp result(:paper, :scissors), do: :win
  defp result(:scissors, :rock), do: :win
  defp result(:scissors, :paper), do: :lose
  defp result(shape, shape), do: :draw

  defp shape_score(:rock), do: 1
  defp shape_score(:paper), do: 2
  defp shape_score(:scissors), do: 3

  defp score(:win), do: 6
  defp score(:draw), do: 3
  defp score(:lose), do: 0

  defp shape(a) when a in ~w(A X), do: :rock
  defp shape(a) when a in ~w(B Y), do: :paper
  defp shape(a) when a in ~w(C Z), do: :scissors

  defp p1_input do
    File.read!("#{Aoc2022.inputs_path()}/day2")
  end
end
