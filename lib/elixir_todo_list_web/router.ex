defmodule ElixirTodoListWeb.Router do
  use ElixirTodoListWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ElixirTodoListWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElixirTodoListWeb do
    pipe_through :browser

    live "/", TodoLive, :index
  end
end
