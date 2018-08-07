# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elxdemoapp,
  ecto_repos: [Elxdemoapp.Repo]

# Configures the endpoint
config :elxdemoapp, Elxdemoapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yL98CXxjEoQONV9S3qJWYPgIXpsuo383Tcep/dUi4Pq903lVbT/39na0RRy5Te1J",
  render_errors: [view: Elxdemoapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elxdemoapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
