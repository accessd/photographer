defmodule Photographer.Admin.PhotoView do
  use Photographer.Web, :view
  alias Photographer.Category

  def categories do
    Photographer.Repo.all(Category)
    |> Enum.into(%{}, fn c -> {c.title, c.id} end)
    |> Enum.into(%{"": ""})
  end
end
