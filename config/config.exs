# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rosewood,
  ecto_repos: [Rosewood.Repo]

# Configures the endpoint
config :rosewood, RosewoodWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q3YICOdOjywKYnpwRfEFow7kvA2KzH1d8xChTEvCchHgGrnRfQsDdVO90ZVhvafu",
  render_errors: [view: RosewoodWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Rosewood.PubSub,
  live_view: [signing_salt: "J7JobnKS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :rosewood, :pow,
  user: Rosewood.Users.User,
  repo: Rosewood.Repo,
  web_module: RosewoodWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
