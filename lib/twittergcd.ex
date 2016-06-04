defmodule Twittergcd do

  def start() do
    TwitterWrap.get_mentions("")
      |> Enum.map(&((Messenger.handle_input &1) |> TwitterWrap.post_status))
  end

end
