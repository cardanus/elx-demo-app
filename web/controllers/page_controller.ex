defmodule Elxdemoapp.PageController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.CreateCookie

  def index(conn, _params) do
    CreateCookie.add_variants_cookie(conn, :users_variants_cookie)
    |> render("index.html")
  end

end
