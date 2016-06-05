defmodule DateUtil do

  def parse_twitter_date(stringa) do
    [weekday, month, day, time, timezone, year] = String.split stringa
    Calendar.DateTime.Parse.rfc2822_utc "#{weekday}, #{day} #{month} #{year} #{time} #{timezone}"
  end

  def should_take(now, tweetDate) do
    {_, tData} = DateUtil.parse_twitter_date(tweetDate)
    now |> Calendar.DateTime.before?(tData)
  end

end
