defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  alias ElixirTodoList.Repo
  alias ElixirTodoList.Task

  @impl true
  def mount(_params, _session, socket) do
    tasks = Repo.all(Task)
    changeset = Task.changeset(%Task{}, %{})

    {:ok,
     assign(socket,
       tasks: tasks,
       form: to_form(changeset)
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-lg mx-auto mt-12 p-6 bg-white rounded-lg shadow-md">
      <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">
        Minha Lista de Tarefas (com DB!)
      </h1>

      <!-- FORMULÁRIO DE CRIAÇÃO -->
      <.form for={@form} id="task-form" phx-submit="save_task">
        <.input
          field={@form[:title]}
          type="text"
          label="Nova Tarefa"
          placeholder="O que precisa ser feito?"
        />
        <.button phx-disable-with="Salvando...">
          Adicionar Tarefa
        </.button>
      </.form>

      <!-- LISTA DE TAREFAS -->
      <div class="mt-8">
        <ul id="task-list">
          <li
            :for={task <- @tasks}
            id={"task-#{task.id}"}
            class="flex justify-between items-center p-3 border-b"
          >

            <% task_form = Task.changeset(task, %{}) |> to_form() %>

            <!-- FORM DE CHECKBOX -->
            <.form
              for={task_form}
              phx-change="toggle_complete"
              phx-value-id={task.id}
              class="flex-grow"
            >
              <div class="flex items-center space-x-4">
                <.input
                  type="checkbox"
                  field={task_form[:completed]}
                />

                <label
                  class={
                    if task.completed,
                      do: "line-through text-gray-400 italic",
                      else: "text-gray-900 font-medium"
                  }
                >
                  <%= task.title %>
                </label>
              </div>
            </.form>

            <!-- BOTÃO EXCLUIR -->
            <.button
              type="button"
              phx-click="delete"
              phx-value-id={task.id}
              class="!p-2 !bg-red-600 hover:!bg-red-700 text-white font-bold rounded-full"
            >
              &times;
            </.button>
          </li>
        </ul>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("save_task", %{"task" => params}, socket) do
    case Repo.insert(Task.changeset(%Task{}, params)) do
      {:ok, _task} ->
        {:noreply,
         socket
         |> assign(:tasks, Repo.all(Task))
         |> assign(:form, to_form(Task.changeset(%Task{}, %{})))
         |> put_flash(:info, "Tarefa salva com sucesso!")}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = Repo.get(Task, id)

    if task do
      Repo.delete(task)
    end

    {:noreply,
     socket
     |> assign(:tasks, Repo.all(Task))
     |> put_flash(:info, "Tarefa removida com sucesso!")}
  end

  @impl true
  def handle_event("toggle_complete", %{"id" => id, "task" => task_params}, socket) do
    task = Repo.get!(Task, id)

    completed_status = Map.has_key?(task_params, "completed")

    task
    |> Task.changeset(%{completed: completed_status})
    |> Repo.update()

    {:noreply, assign(socket, tasks: Repo.all(Task))}
  end
end
