defmodule ClusterScheduler.Runner do
  require Logger

  def every_minute_task(), do: log_it("Every minute")
  def every_two_minutes_task(), do: log_it("Every two minutes")
  def every_five_minutes_task(), do: log_it("Every five minutes")
  def every_ten_minutes_task(), do: log_it("Every ten minutes")

  defp log_it(task) do
    with {:ok, hostname} <- :inet.gethostname() do
      Logger.info(fn -> "#{task} task finished on #{hostname}" end)
    end
  end
end
