# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bird,
  ecto_repos: [Bird.Repo]

# Configures the endpoint
config :bird, BirdWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NZJa5Nm9vOtPz+F5AQkxWb34hrLKQsQs450+VL+lbSYy/gVo4ptgwoMI0aR0qmsU",
  render_errors: [view: BirdWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bird.PubSub,
  live_view: [signing_salt: "IBtb8hHL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :bird, :pow,
  user: Bird.Users.User,
  repo: Bird.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
