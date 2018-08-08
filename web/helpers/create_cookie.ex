defmodule Elxdemoapp.Helpers.CreateCookie do
  use Elxdemoapp.Web, :controller
  @moduledoc false

  def select_variants_cookie(conn, cookie_name)do
    Map.get(conn.req_cookies, cookie_name)
    |> check_variants_cookie(conn, cookie_name)
  end

  def add_variants_cookie(conn, cookie_name) do
    {_, conn} =
      Map.get(conn.req_cookies, cookie_name)
      |> check_variants_cookie(conn, cookie_name)
    conn
  end

  defp check_variants_cookie(nil, conn, cookie_name) do
    salt = Phoenix.Config.from_env(:elxdemoapp, Elxdemoapp.Endpoint,[])[:secret_key_base]
    new_conn = put_session(conn, :users_variants_cookies, salt)
    { Map.get(conn.req_cookies, cookie_name), new_conn}
  end
  defp check_variants_cookie(variants_cookie, conn, _), do: {variants_cookie, conn}

end
