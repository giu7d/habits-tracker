import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :habits_tracker, HabitsTracker.Repo,
  username: System.get_env("DATABASE_USER") || "postgres",
  password: System.get_env("DATABASE_PASS") || "postgres",
  hostname: System.get_env("DATABASE_HOST") || "localhost",
  database: System.get_env("DATABASE_NAME") || "habits_tracker_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :habits_tracker, HabitsTrackerWeb.Endpoint,
  http: [port: 4002],
  secret_key_base: "YcdJOz5w9pp/aHVOMoJ5P0k027dfWPUGIpYq71N6lSqMXQlT3zec7dQu7shryY5U",
  server: false

# In test we don't send emails.
config :habits_tracker, HabitsTracker.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
