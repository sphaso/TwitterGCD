defmodule DateUtil do

  def parse_twitter_date(stringa) do
    [weekday, month, day, time, timezone, year] = String.split stringa
    Calendar.DateTime.Parse.rfc2822_utc "#{weekday}, #{day} #{month} #{year} #{time} #{timezone}"
  end

  def should_take(now, tweetDate) do
    {_, tData} = DateUtil.parse_twitter_date(tweetDate)
    now |> Calendar.DateTime.before?(tData)
  end

  def test do
    Timex.parse("Tue, 05 Mar 2013 23:25:19 +0200", "{RFC2822}")
  end

  def test2 do
    Calendar.DateTime.Parse.rfc2822_utc "Sat, 13 Mar 2010 11:23:03 -0800"
  end

end
