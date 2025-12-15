defmodule ElixirTodoListWeb.ErrorView do
  use ElixirTodoListWeb, :html

  def render("404.html", _assigns), do: "Página não encontrada"
  def render("500.html", _assigns), do: "Erro interno do servidor"

  def template_not_found(_template, assigns) do
    render("500.html", assigns)
  end
end
