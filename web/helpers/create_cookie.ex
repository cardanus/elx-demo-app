defmodule Elxdemoapp.Helpers.CreateCookie do
  use Elxdemoapp.Web, :controller
  @moduledoc false

#  def select_variants_cookie(conn, cookie_name)do
#    get_session(conn, cookie_name)
#    |> check_variants_cookie(conn)
#  end

  def add_variants_cookie(conn, cookie_name) do
    {_, conn} =
      get_session(conn, cookie_name)
      |> check_variants_cookie(conn)
    conn
  end

  defp check_variants_cookie(nil, conn) do
    variants_cookie = create_variants_cookie()
    new_conn = put_session(conn, :users_variants_cookies, variants_cookie)
    {variants_cookie, new_conn}
  end
  defp check_variants_cookie(variants_cookie, conn), do: {variants_cookie, conn}

  defp create_variants_cookie() do
    unick_num =
      :erlang.system_time(:millisecond)
      |> Integer.to_string()

    salt = Phoenix.Config.from_env(:elxdemoapp, Elxdemoapp.Endpoint,[])[:secret_key_base]

    :crypto.hash(:sha256, Enum.join([salt, unick_num]))
    |> Base.encode64()
  end
end
