defmodule Identicon do
  alias Identicon.Image

  def main(input) do
    input
    |> hash_input()
    |> pick_color()
    |> build_grid()
    |> filter_odd_squares()
  end

  defp hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Image{hex: hex}
  end

  defp pick_color(%Image{hex: [r, g, b | _tail]} = image) do
    %Image{image | color: {r, g, b}}
  end

  defp build_grid(%Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Image{image | grid: grid}
  end

  defp mirror_row(row) do
    [first, second | _tail] = row

    row ++ [second, first]
  end

  defp filter_odd_squares(%Image{grid: grid} = image) do
    grid =
      Enum.filter(grid, fn {code, _index} ->
        rem(code, 2) == 0
      end)

    %Image{image | grid: grid}
  end
end
