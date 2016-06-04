defmodule Gcd do

  defp gcd(x, y) when x == y do
    x
  end
  defp gcd(x, 0) do
    x
  end
  defp gcd(x, y) when x > y do
    gcd(x-y, y)
  end
  defp gcd(x, y) do
    gcd(x, y-x)
  end

  def gcd(lista) when is_list(lista) and (length lista) >= 2 do
    lista
          |> Enum.map(&abs/1)
          |> Enum.uniq
          |> Enum.reduce(&gcd/2)
  end
  def gcd(lista) when is_list(lista) do
    hd lista
  end

end
