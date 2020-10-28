defmodule ClusterScheduler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: "#1",
        start:
          {SchedEx, :run_every, [ClusterScheduler.Runner, :every_minute_task, [], "*/1 * * * *"]}
      },
      %{
        id: "#2",
        start:
          {SchedEx, :run_every,
           [ClusterScheduler.Runner, :every_two_minutes_task, [], "*/2 * * * *"]}
      },
      %{
        id: "#3",
        start:
          {SchedEx, :run_every,
           [ClusterScheduler.Runner, :every_five_minutes_task, [], "*/5 * * * *"]}
      },
      %{
        id: "#4",
        start:
          {SchedEx, :run_every,
           [ClusterScheduler.Runner, :every_ten_minutes_task, [], "*/10 * * * *"]}
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClusterScheduler.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
