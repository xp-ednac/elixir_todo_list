import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.

# Enable the server in releases by setting PHX_SERVER=true
if System.get_env("PHX_SERVER") do
  config :elixir_todo_list, ElixirTodoListWeb.Endpoint, server: true
end

# Set the port for all environments
config :elixir_todo_list, ElixirTodoListWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT", "4000"))]

# Production-only runtime configuration
if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"

  config :elixir_todo_list, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

  config :elixir_todo_list, ElixirTodoListWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0}
    ],
    secret_key_base: secret_key_base
end
