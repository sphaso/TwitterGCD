defmodule Twittergcd do

  def start() do
    true = Process.register(Worker.start_link, :worker)
    pid = spawn_link(fn -> loop() end)
    send pid, {:work, Calendar.DateTime.now_utc}
  end

  defp loop() do
    receive do
      {:work, since} ->
                    IO.puts("Going to work")
                    send :worker, {:work, since, self}
                    loop()
      {:ok} -> IO.puts("OK!")
               now = Calendar.DateTime.now_utc
               :timer.sleep(5 * 60000)
               send self, {:work, now}
               loop()
    end
  end

end
