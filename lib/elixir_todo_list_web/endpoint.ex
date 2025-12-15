defmodule ElixirTodoListWeb.Endpoint do
  use Phoenix.Endpoint,
    otp_app: :elixir_todo_list,
    render_errors: [
      formats: [html: ElixirTodoListWeb.ErrorHTML, json: ElixirTodoListWeb.ErrorJSON],
      layout: false
    ]

  @session_options [
    store: :cookie,
    key: "_elixir_todo_list_key",
    signing_salt: "123456"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :elixir_todo_list,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options

  plug ElixirTodoListWeb.Router
end
