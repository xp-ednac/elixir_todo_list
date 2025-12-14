defmodule ElixirTodoListWeb do
  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: ElixirTodoListWeb.Layouts]

      import Plug.Conn
      import ElixirTodoListWeb.Gettext

      unquote(verified_routes())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      import Phoenix.Controller,
        only: [get_csrf_token: 0]

      import ElixirTodoListWeb.Gettext

      unquote(verified_routes())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {ElixirTodoListWeb.Layouts, :app}

      unquote(html())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html())
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import ElixirTodoListWeb.Gettext
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: ElixirTodoListWeb.Endpoint,
        router: ElixirTodoListWeb.Router,
        statics: ElixirTodoListWeb.static_paths()
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
