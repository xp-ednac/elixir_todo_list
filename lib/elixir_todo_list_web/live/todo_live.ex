defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       todos: [],
       new_todo: ""
     )}
  end

  @impl true
  def handle_event("add_todo", %{"todo" => todo}, socket) do
    todos = socket.assigns.todos ++ [todo]

    {:noreply,
     assign(socket,
       todos: todos,
       new_todo: ""
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="padding: 2rem;">
      <h1>Minha Lista de Tarefas</h1>

      <form phx-submit="add_todo">
        <input
          type="text"
          name="todo"
          value={@new_todo}
          placeholder="Nova tarefa"
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
end
