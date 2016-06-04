defmodule Messenger do

  defp parse(stringa) do
    (String.split stringa)
            |> Enum.filter(fn(x) -> String.first(x) != "@" and String.first(x) != "#" end)
            |> Enum.uniq
            |> Enum.map(&String.to_integer/1)
  end

  defp output({_, send_to, result}) do
    "#{send_to} #{result}"
  end

  def handle_input(send_to, input) do
    try do
      numbers = parse input
      gcd = Gcd.gcd(numbers)
      output({:ok, send_to, gcd})
    rescue
      e in ArgumentError -> output({:mistake, send_to, "Invalid input"})
    end
  end

end
