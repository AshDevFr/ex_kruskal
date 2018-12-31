# Kruskal

Elixir library for Minimum Spanning Tree using Kruskal's algorithm

## Example

```elixir
iex> points = [{111, 0}, {98, 77}, {57, 194}, {120, 110}, {28, 187}, {113, 61}, {43, 36}, ...]

iex> edges_with_weight = [{1, 18, 1861}, {5, 18, 2434}, {1, 5, 481}, {1, 3, 1573}, {3, 18, 68}, {1, 29, 2353}, {3, 29, 296}, {18, 29, 580}, {15, 31, 3280}, {18, 31, 2257}, {15, 18, 4041}, {5, 31, 2857}, ...]

iex> {edges, excluded_edges} = Kruskal.getEdges(points, edges_with_weight)

iex> {edges, excluded_edges}
  {
    [{3, 18}, {17, 25}, {0, 8}, {12, 30}, {17, 29}, {17, 21}, {16, 31}, {14, 16}, ...],
    [{21, 25}, {25, 29}, {14, 26}, {6, 20}, {7, 10}, {18, 29}, {14, 31}, {10, 17}, {0, 28}, {19, 21}, {11, 19}, {9, 22}, {10, 29}]
  }
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kruskal` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kruskal, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kruskal](https://hexdocs.pm/kruskal).
