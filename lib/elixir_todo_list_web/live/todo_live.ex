defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  alias ElixirTodoList.Task
  alias ElixirTodoList.Repo

  @impl true
  def mount(_params, _session, socket) do
    tasks = Repo.all(Task) |> Enum.reverse()  # traz todas as tarefas, mais recentes primeiro

    socket =
      assign(socket,
        tasks: tasks,
        new_task_title: ""
      )

    {:ok, socket}
  end

  # Captura o evento de digitação no campo
  @impl true
  def handle_event("update_form", %{"title" => new_title}, socket) do
    {:noreply, assign(socket, new_task_title: new_title)}
  end

  # Adiciona uma nova tarefa no banco
  @impl true
  def handle_event("save_task", %{"title" => title}, socket) do
    if title != "" do
      %Task{}
      |> Task.changeset(%{title: title})
      |> Repo.insert()

      tasks = Repo.all(Task) |> Enum.reverse()
      {:noreply, assign(socket, tasks: tasks, new_task_title: "")}
    else
      {:noreply, socket}
    end
  end

  # Marca/desmarca uma tarefa como concluída
  @impl true
  def handle_event("toggle_task", %{"id" => id}, socket) do
    task = Repo.get!(Task, id)
    task
    |> Task.changeset(%{completed: !task.completed})
    |> Repo.update()

    tasks = Repo.all(Task) |> Enum.reverse()
    {:noreply, assign(socket, tasks: tasks)}
  end

  # Deleta uma tarefa
  @impl true
  def handle_event("delete_task", %{"id" => id}, socket) do
    task = Repo.get!(Task, id)
    Repo.delete(task)

    tasks = Repo.all(Task) |> Enum.reverse()
    {:noreply, assign(socket, tasks: tasks)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-lg mx-auto mt-12 p-6 bg-white rounded-lg shadow-md">
      <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">
        Minha Lista de Tarefas
      </h1>

      <form phx-submit="save_task" phx-change="update_form" class="flex gap-2 mb-6">
        <input
          type="text"
          name="title"
          value={@new_task_title}
          placeholder="O que precisa ser feito?"
          class="flex-grow p-2 border rounded"
          autofocus
        />
        <button type="submit" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">
          Adicionar
        </button>
      </form>

      <div class="mt-8">
        <ul id="task-list">
          <li :for={task <- @tasks} class="flex justify-between items-center p-3 border-b">
            <div class="flex items-center gap-2">
              <input
                type="checkbox"
                phx-click="toggle_task"
                phx-value-id={task.id}
                checked={task.completed}
              />
              <span class={if task.completed, do: "line-through text-gray-500", else: "text-gray-900"}>
                <%= task.title %>
              </span>
            </div>
            <button
              phx-click="delete_task"
              phx-value-id={task.id}
              class="text-red-500 hover:text-red-700"
            >
              Deletar
            </button>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
