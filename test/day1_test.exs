defmodule Aoc2022.Day1Test do
  use ExUnit.Case

  test "p1 example" do
    assert 24_000 == Aoc2022.Day1.p1(example_1())
  end

  test "p2 example" do
    assert 45000 == Aoc2022.Day1.p2(example_1())
  end

  defp example_1 do
    """
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
    """
  end
end
