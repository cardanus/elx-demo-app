defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.CreateCookie

  def index(conn, _params) do
#    {variants_cookie, new_conn} = CreateCookie.select_variants_cookie(conn, :users_variants_cookies)


    variants_cookie = Map.get(conn.req_cookies, "_elxdemoapp_key")
    :io.format("~nconn:~p~n", [conn])
    :io.format("~nvariants_cookie:~p~n", [variants_cookie])
    variant = :erlexp.variant(variants_cookie, :req_cookies)
    subscribe_info = variants(variant)
    render(
      conn, "index.html",
      price: subscribe_info.price,
      period: subscribe_info.period,
      period_desc: subscribe_info.period_desc
    )
  end

  def show(conn, %{"id" => month}) do
    render(conn, "show.html", price: month)
  end

  def variants(:a) do
    %{period: 1, period_desc: "month", price: 12 }
  end

  def variants(:b) do
    %{period: 12, period_desc: "monthes", price: 144 }
  end
end
