defmodule Searcher do
  @moduledoc """
  Module to find element of an enumerable performatically.
  """

  @doc """
  Find element of an enumerable.
  Returns the any element that evaluation in predicate was true.

  ## Parameters
   - enumerable: an Enumerable
   - function: predicate to evaluate item

  ## Examples

      iex> Searcher.find([1, 2, 3], fn item -> item === 3 end)
      3
  """
  def find(enumerable, function) when is_function(function) do
    search(enumerable, function)
  end
  
  defp search(enumerable, function) do
    count = enumerable
    |> Enum.map(&evaluate_item_async(&1, function))
    |> Enum.count()
    
    handle_response(count)
  end

  defp evaluate_item_async(item, function) do
    current = self()

    spawn_link(fn -> 
      case !!function.(item) do
        true -> send(current, {item, true})
        _ -> send(current, {item, false})
      end
    end)
  end

  defp handle_response(count) when count == 0, do: nil
  defp handle_response(count) do
    receive do
      {item, true} -> item
      _ -> handle_response(count - 1)
    end
  end
end
