defmodule MapperTest do
  use ExUnit.Case
  use Timing
  doctest Mapper

  test "lookup for 2282668687" do
    out = [
      ["act", "amounts"],
      ["act", "contour"],
      ["acta", "mounts"],
      ["bat", "amounts"],
      ["bat", "contour"],
      ["cat", "contour"],
      "catamounts"
    ]

    {elapsed_time, timed_result} =
      time do
        Mapper.lookup(2_282_668_687)
      end

    assert timed_result |> length() == out |> length()
    assert timed_result |> Enum.sort() == out |> Enum.sort()
    # assert elapsed_time < 1000
  end

  test "lookup for 6686787825" do
    out = [
      ["motor", "usual"],
      ["noun", "struck"],
      ["nouns", "truck"],
      ["nouns", "usual"],
      ["onto", "struck"],
      "motortruck"
    ]

    {elapsed_time, timed_result} =
      time do
        Mapper.lookup(6_686_787_825)
      end

    assert timed_result |> length() == out |> length()
    assert timed_result |> Enum.sort() == out |> Enum.sort()
    # assert elapsed_time < 1000
  end
end
