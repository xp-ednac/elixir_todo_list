defmodule ElixirTodoListWeb.Router do
  use ElixirTodoListWeb, :router

  # 🔥 ESTA LINHA É O QUE FALTAVA
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirTodoListWeb do
    pipe_through :browser

    live "/", TodoLive
  end
end
