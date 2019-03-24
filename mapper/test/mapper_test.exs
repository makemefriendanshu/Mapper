defmodule MapperTest do
  use ExUnit.Case
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

    assert Mapper.lookup(2_282_668_687) |> length() == out |> length()
    assert Mapper.lookup(2_282_668_687) |> Enum.sort() == out |> Enum.sort()
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

    assert Mapper.lookup(6_686_787_825) |> length() == out |> length()
    assert Mapper.lookup(6_686_787_825) |> Enum.sort() == out |> Enum.sort()
  end
end
