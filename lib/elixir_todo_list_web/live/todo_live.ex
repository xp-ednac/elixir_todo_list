defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  import ElixirTodoListWeb.CoreComponents

  alias ElixirTodoList.Todos
  alias ElixirTodoList.Todos.Task

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:tasks, Todos.list_todos())
      |> assign(:changeset, Todos.change_todo(%Task{}))

    {:ok, socket}
  end

  @impl true
  def handle_event("save", %{"task" => task_params}, socket) do
    case Todos.create_todo(task_params) do
      {:ok, _task} ->
        {:noreply,
         socket
         |> assign(:tasks, Todos.list_todos())
         |> assign(:changeset, Todos.change_todo(%Task{}))}

      {:error, changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = Todos.get_todo!(id)
    {:ok, _task} = Todos.delete_todo(task)

    {:noreply, assign(socket, :tasks, Todos.list_todos())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 max-w-xl mx-auto">
      <h1 class="text-2xl font-bold mb-4">Todo List</h1>

      <.form for={@changeset} phx-submit="save">
        <.input field={@changeset[:title]} label="Nova tarefa" />
        <.button class="mt-2 w-full">Adicionar</.button>
      </.form>

      <ul class="mt-6 space-y-2">
        <li :for={task <- @tasks} class="flex justify-between items-center">
          <span><%= task.title %></span>

          <.button
            phx-click="delete"
            phx-value-id={task.id}
            class="ml-2"
          >
            Excluir
          </.button>
        </li>
      </ul>
    </div>
    """
  end
end
