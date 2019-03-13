defmodule MapperTest do
  use ExUnit.Case
  doctest Mapper

  test "greets the world" do
    assert Mapper.hello() == :world
  end
end
