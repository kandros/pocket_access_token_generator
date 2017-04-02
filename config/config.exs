# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pocket_access_token_generator,
  namespace: Pocket

# Configures the endpoint
config :pocket_access_token_generator, Pocket.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IblfaPpPtU+q43IWmPvtMdmLu92ETWLB6oZCNnH/5gbrZBc4kXgd8Iqhy8Cfuoso",
  render_errors: [view: Pocket.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pocket.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
