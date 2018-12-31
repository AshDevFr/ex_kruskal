defmodule Kruskal do
  @moduledoc """
  Documentation for Kruskal.
  """

  @doc """
  Get the Minimum Spanning Tree

  vertices is the array of points: `[{x, y}, ...]`
  edges is an array of the edges with their weight: `[{p0, p1, weight}, ...]`

  ## Examples

    iex> points |> Kruskal.getEdges(edges_with_weight)
      {
        [{x, y}, {x1, y1}, ...],
        [{x2, y2}, {x3, y3}, ...]
      }
  """
  def getEdges(vertices, edges) do
    n = length(vertices)
    forest = UnionFind.new(n)

    {_, connections, excluded_connections} =
      edges
      |> Enum.sort_by(&(elem(&1, 2)))
      |> Enum.reduce(
           {forest, [], []},
           fn {p0, p1, _}, {f, c, ec} ->
             if (
                  f
                  |> UnionFind.connected(p0, p1)) do
               {f, c, ec ++ [{p0, p1}]}
             else
               {
                 f
                 |> UnionFind.union(p0, p1),
                 c ++ [{p0, p1}],
                 ec
               }
             end
           end
         )

    {connections, excluded_connections}
  end
end
