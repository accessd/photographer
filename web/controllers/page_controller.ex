defmodule Photographer.PageController do
  use Photographer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
