defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, todos: [], new_todo: "")}
  end

  def render(assigns) do
    ~H"""
    <div style="padding: 40px; font-family: Arial;">
      <h1>📝 Todo List</h1>

      <form phx-submit="add">
        <input
          type="text"
          name="todo"
          value={@new_todo}
          placeholder="Digite uma tarefa"
        />
        <button type="submit">Adicionar</button>
      </form>

      <ul>
        <%= for todo <- @todos do %>
          <li><%= todo %></li>
        <% end %>
      </ul>
    </div>
    """
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    {:noreply,
     assign(socket,
       todos: socket.assigns.todos ++ [todo],
       new_todo: ""
     )}
  end
end
