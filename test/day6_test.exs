defmodule Day6Test do
  use ExUnit.Case, async: true

  test "example p1" do
    assert 5 == Aoc2022.Day6.p1("bvwbjplbgvbhsrlpgdmjqwftvncz")
    assert 7 == Aoc2022.Day6.p1("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    assert 10 == Aoc2022.Day6.p1("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    assert 11 == Aoc2022.Day6.p1("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
    assert 1544 == Aoc2022.Day6.p1()
  end

  test "example p2" do
    assert 2145 == Aoc2022.Day6.p2()
  end
end
