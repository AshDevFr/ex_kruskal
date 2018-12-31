defmodule UnionFind do
  alias __MODULE__
  @moduledoc """
  Documentation for UnionFind.
  """

  @doc """
  """
  defstruct [:nodes, :sizes]

  def new(n) do
    1..n
    |> Enum.reduce(
         %UnionFind{
           nodes: List.duplicate(0, n),
           sizes: List.duplicate(1, n)
         },
         fn i, %UnionFind{nodes: nodes} = u ->
           %{
             u |
             nodes: nodes
                    |> List.replace_at(i, i)
           }
         end
       )
  end

  def root(%UnionFind{nodes: nodes} = u, i) do
    # Loop up the chain until reaching root
    if(
      nodes
      |> Enum.at(i) != i
    ) do
      # path compression for future lookups
      root(
        %{
          u |
          nodes: nodes
                 |> List.replace_at(
                      i,
                      (
                        nodes
                        |> Enum.at(
                             nodes
                             |> Enum.at(i)
                           ))
                    )
        },
        nodes
        |> Enum.at(i)
      )
    else
      i
    end
  end

  def union(%UnionFind{nodes: nodes, sizes: sizes} = u, i, j) do
    rooti = root(u, i)
    rootj = root(u, j)

    # already connected
    if (rooti == rootj) do
      u
    else
      # root smaller to root of larger
      {new_nodes, new_sizes} =
        if (
             sizes
             |> Enum.at(i) < sizes
                             |> Enum.at(j)) do
          {
            nodes
            |> List.replace_at(rooti, rootj),
            sizes
            |> List.replace_at(
                 rootj,
                 (sizes
                  |> Enum.at(rootj)) + (sizes
                                        |> Enum.at(rooti))
               )
          }
        else
          {
            nodes
            |> List.replace_at(rootj, rooti),
            sizes
            |> List.replace_at(
                 rooti,
                 (sizes
                  |> Enum.at(rooti)) + (sizes
                                        |> Enum.at(rootj))
               )
          }
        end

      %{u | nodes: new_nodes, sizes: new_sizes}
    end
  end

  def connected(u, i, j) do
    root(u, i) == root(u, j)
  end
end
