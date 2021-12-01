defmodule GearboxImplTest do
  use ExUnit.Case
  doctest GearboxImpl

  test "greets the world" do
    assert GearboxImpl.hello() == :world
  end
end
