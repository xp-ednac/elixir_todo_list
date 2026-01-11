defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  alias ElixirTodoList.Repo
  alias ElixirTodoList.Task

@impl true
def mount(_params, _session, socket) do
  tasks = Repo.all(Task)
  changeset = Task.changeset(%Task{}, %{})
  form = to_form(changeset)

  socket =
    assign(socket,
      tasks: tasks,
      form: form
    )

  {:ok, socket}
end


@impl true
def render(assigns) do
  ~H"""
  <div class="w-full max-w-lg mx-auto mt-12 p-6 bg-white rounded-lg shadow-md">
    <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">Minha Lista de Tarefas (com DB!)</h1>

    <.form for={@form} id="task-form" phx-submit="save_task">
      <.input
        field={@form[:title]}
        type="text"
        label="Nova Tarefa"
        placeholder="O que precisa ser feito?"
      />
      <.button phx-disable-with="Salvando...">Adicionar Tarefa</.button>
    </.form>

    <div class="mt-8">
      <ul id="task-list">
        <li :for={task <- @tasks} class="flex justify-between items-center p-3 border-b">
          <span class={if task.completed, do: "line-through text-gray-500", else: "text-gray-900"}>
            <%= task.title %>
          </span>
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
  tasks = Repo.all(Task)

  {:noreply,
   socket
   |> assign(:tasks, tasks)
   |> assign(:form, to_form(Task.changeset(%Task{}, %{})))
   |> put_flash(:info, "Tarefa salva com sucesso!")}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end
end
