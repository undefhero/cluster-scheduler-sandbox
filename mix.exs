defmodule ClusterScheduler.MixProject do
  use Mix.Project

  def project do
    [
      app: :cluster_scheduler,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ClusterScheduler.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sched_ex, "~> 1.0"}
    ]
  end
end
