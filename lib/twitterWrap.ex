defmodule TwitterWrap do

  def get_mentions(since) do
    ExTwitter.mentions_timeline()
      |> Enum.map(fn(tweet) -> {"@#{tweet.user.screen_name}", tweet.text} end)
  end

  def post_status(message) do
    ExTwitter.update(message)
  end

end
