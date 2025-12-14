defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Meu Todo List (Hello LiveView!)</h1>
    """
  end
end
