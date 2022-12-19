defmodule Aoc2022.Day3Test do
  use ExUnit.Case, async: true

  test "example p1" do
    assert 157 == Aoc2022.Day3.p1(example_p1())
  end

  test "example p2" do
    assert 70 == Aoc2022.Day3.p2(example_p1())
  end

  defp example_p1 do
    """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """
  end
end
