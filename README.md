# Searcher

Searcher is library to find an element of an enumerable 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `searcher` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:searcher, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
Searcher.find(enumerable, fn item -> item == "element" end)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/searcher](https://hexdocs.pm/searcher).

