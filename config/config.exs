# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :relationships,
  ecto_repos: [Relationships.Repo]

# Configures the endpoint
config :relationships, RelationshipsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I5qB4z2j9xqtYijrlul8QI+k/HAiTNtQYpljXQEHfAVeIOhIpVnzVpex4kmK1nPi",
  render_errors: [view: RelationshipsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Relationships.PubSub,
  live_view: [signing_salt: "2g+S1j11"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
