defmodule Photographer.PageController do
  use Photographer.Web, :controller
  alias Photographer.Repo
  alias Photographer.Category

  def index(conn, _params) do
    conn
    |> assign(:categories, categories)
    |> render "index.html"
  end

  defp categories do
    Category
    |> Category.with_photos
    |> Repo.all
  end
end
