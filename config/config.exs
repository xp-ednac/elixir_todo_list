import Config

config :elixir_todo_list,
  ecto_repos: [ElixirTodoList.Repo]

config :elixir_todo_list, ElixirTodoListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SUA_SECRET_KEY_AQUI",
  render_errors: [
    formats: [html: ElixirTodoListWeb.ErrorHTML, json: ElixirTodoListWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ElixirTodoList.PubSub,
  live_view: [signing_salt: "GIE6xb580oD2UgEE"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason


config :elixir_todo_list, ElixirTodoList.Repo,
  database: "priv/todo_list.db",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 5
