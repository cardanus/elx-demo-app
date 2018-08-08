defmodule Elxdemoapp.PageController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.CreateCookie

  def index(conn, _params) do
    coockie_name = Application.get_env(:elxdemoapp, :coockie_name)
    CreateCookie.add_variants_cookie(conn, coockie_name)
    |> render("index.html")
  end

end
