defmodule ElixirTodoList.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirTodoList.Repo, # 👈 adicionamos aqui
      ElixirTodoListWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:elixir_todo_list, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirTodoList.PubSub},
      # Start a worker by calling: ElixirTodoList.Worker.start_link(arg)
      # {ElixirTodoList.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirTodoListWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirTodoList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ElixirTodoListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
