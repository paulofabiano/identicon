defmodule Identicon do
  alias Identicon.Image

  def main(input) do
    input
    |> hash_input()
    |> pick_color()
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
end
