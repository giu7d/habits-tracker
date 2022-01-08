defmodule HabitsTracker.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HabitsTracker.Repo,
      HabitsTrackerWeb.Telemetry,
      {Phoenix.PubSub, name: HabitsTracker.PubSub},
      HabitsTrackerWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: HabitsTracker.Supervisor]

    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    HabitsTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
