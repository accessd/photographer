defmodule Photographer.PageController do
  use Photographer.Web, :controller
  alias Photographer.Repo
  alias Photographer.Category

  def index(conn, _params) do
    conn
    |> assign(:categories, categories)
    |> render "index.html"
  end

  def send_message(conn, %{"name" => name, "message" => message}) do
    Photographer.Mailer.send_message_email(name, message)
    conn
    |> put_flash(:info, "Message successfully sent")
    |> redirect(to: page_path(conn, :index))
  end

  defp categories do
    Category
    |> Category.with_photos
    |> Repo.all
  end
end
