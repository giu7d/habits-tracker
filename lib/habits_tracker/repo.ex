defmodule HabitsTracker.Repo do
  use Ecto.Repo,
    otp_app: :habits_tracker,
    adapter: Ecto.Adapters.Postgres
end
