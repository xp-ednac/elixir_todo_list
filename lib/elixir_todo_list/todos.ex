defmodule ElixirTodoList.Todos do
  import Ecto.Query, warn: false
  alias ElixirTodoList.Repo
  alias ElixirTodoList.Todos.Task

  # LISTAR
  def list_todos do
    Repo.all(Task)
  end

  # BUSCAR
  def get_todo!(id), do: Repo.get!(Task, id)

  # CRIAR
  def create_todo(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  # DELETAR
  def delete_todo(%Task{} = task) do
    Repo.delete(task)
  end

  # CHANGESET (FORM)
  def change_todo(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end
end
