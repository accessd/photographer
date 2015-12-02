use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :photographer, Photographer.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :photographer, Photographer.Repo,
  adapter: Sqlite.Ecto,
  database: "db/photographer_test.sqlite",
  pool: Ecto.Adapters.SQL.Sandbox
