defmodule SearcherTest do
  use ExUnit.Case, async: true
  doctest Searcher

  describe "find/2" do
    test "when find element of list, returns the element" do
      list = [1, 2, 3, 4, 5, 6, 7]

      expected = 7

      result = Searcher.find(list, fn x -> x === expected end)

      assert result == expected
    end

    test "when find element of list and doesn't have my element, returns nil" do
      list = [1, 2, 3, 4, 5, 6, 6, 7]

      result = Searcher.find(list, fn x -> x > 5 end)

      assert result > 5 
    end

    test "when find element of big range, returns the element" do
      range = 1..100_000_000

      expected = 90_000_000

      result = Searcher.find(range, fn x -> x === expected end)

      assert result == expected
    end

    test "when find element of empty list, returns nil" do
      list = []

      expected = nil

      result = Searcher.find(list, fn x -> x end)

      assert result == expected
    end
  end
end
