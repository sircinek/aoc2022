defmodule Aoc2022.Day5Test do
  use ExUnit.Case, async: true

  test "example p1" do
    assert "CMZ" == Aoc2022.Day5.p1(input())
  end

  test "example p2" do
    assert "MCD" == Aoc2022.Day5.p2(input())
  end

  defp input do
    File.read!("#{Aoc2022.inputs_path()}/day5_example")
  end
end
