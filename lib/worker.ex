defmodule Worker do

  def start_link do
    spawn_link(fn -> loop() end)
  end

  defp loop do
    receive do
      {:work, since, sender} ->
          TwitterWrap.get_mentions(since)
                |> Enum.each(&((Messenger.handle_input &1) |> TwitterWrap.post_status))
          send sender, {:ok}
          loop()
    end
  end

end
