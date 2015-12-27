defmodule Photographer.RedirectsPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, options) do
    to = options[conn.request_path]
    do_redirect(conn, to)
  end

  defp do_redirect(conn, nil), do: conn

  defp do_redirect(conn, to) do
    conn
    |> Phoenix.Controller.redirect(to: to)
    |> halt
  end
end
