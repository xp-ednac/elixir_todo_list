import Config

config :elixir_todo_list, ElixirTodoListWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "FAe5MlBOUT82uO5JFOhL1Wmkd6vo+4D9FyYVkJ9uQ80CpQq1VktH3T4ivL/ijXXE",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:elixir_todo_list, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:elixir_todo_list, ~w(--watch)]}
  ]

config :elixir_todo_list, ElixirTodoListWeb.Endpoint,
  live_reload: [
    web_console_logger: true,
    patterns: [
      ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$"E,
      ~r"priv/gettext/.*\.po$"E,
      ~r"lib/elixir_todo_list_web/router\.ex$"E,
      ~r"lib/elixir_todo_list_web/(controllers|live|components)/.*\.(ex|heex)$"E
    ]
  ]

config :elixir_todo_list, dev_routes: true

config :logger, :default_formatter, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  debug_attributes: true,
  enable_expensive_runtime_checks: true

config :swoosh, :api_client, false
