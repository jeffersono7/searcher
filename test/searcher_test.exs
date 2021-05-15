defmodule SearcherTest do
  use ExUnit.Case
  doctest Searcher

  test "greets the world" do
    assert Searcher.hello() == :world
  end
end
