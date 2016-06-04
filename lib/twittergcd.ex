defmodule Twittergcd do

  def start() do
    now = Calendar.DateTime.now_utc
    loop(now)
  end

  defp loop(since) do
    IO.puts("Loop")
    TwitterWrap.get_mentions(since)
              |> Enum.each(&((Messenger.handle_input &1) |> TwitterWrap.post_status))
    now = Calendar.DateTime.now_utc
    :timer.sleep(5 * 60000)
    loop(now)
  end

end
