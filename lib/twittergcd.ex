defmodule Twittergcd do

  def start() do
    now = Calendar.DateTime.now_utc
    TwitterWrap.get_mentions(now)
      |> Enum.map(&((Messenger.handle_input &1) |> TwitterWrap.post_status))
  end

end
