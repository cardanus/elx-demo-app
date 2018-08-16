defmodule Elxdemoapp.PageController do
  use Elxdemoapp.Web, :controller

  def index(conn, _params) do
    conn |> render("index.html")
  end

end
