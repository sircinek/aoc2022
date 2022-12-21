defmodule Aoc2022.Day4Test do
  use ExUnit.Case, async: true

  test "example p1" do
    assert 2 == Aoc2022.Day4.p1(input())
  end

  test "example p2" do
    assert 4 == Aoc2022.Day4.p2(input())
  end

  def input do
    """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """
  end
end
