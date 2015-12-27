defmodule Photographer.Admin.SessionView do
  use Photographer.Web, :view

  def render("new.json", assigns) do
    Poison.encode!(assigns.users)
  end
end
