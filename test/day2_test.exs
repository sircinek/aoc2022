defmodule Aoc2022.Day2Test do
  use ExUnit.Case, async: true

  test "p1 example" do
    assert 15 == Aoc2022.Day2.p1(example_p1())
  end

  test "p2 example" do
    assert 12 == Aoc2022.Day2.p2(example_p1())
  end

  defp example_p1 do
    """
    A Y
    B X
    C Z
    """
  end
end
