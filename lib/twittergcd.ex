defmodule Twittergcd do

  def start() do
    pid_worker = Worker.start_link
    pid = spawn_link(fn -> loop(pid_worker) end)
    send pid, {:work, Calendar.DateTime.now_utc}
  end

  defp loop(pid_worker) do
    receive do
      {:work, since} ->
                    IO.puts("Going to work")
                    send pid_worker, {:work, since, self}
                    loop(pid_worker)
      {:ok} -> IO.puts("OK!")
               now = Calendar.DateTime.now_utc
               :timer.sleep(5 * 60000)
               send self, {:work, now}
               loop(pid_worker)
    end
  end

end
