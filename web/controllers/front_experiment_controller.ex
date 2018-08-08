defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.CreateCookie

  def index(conn, _params) do
    cookie_name = Application.get_env(:elxdemoapp, :coockie_name)
    {variants_cookie, new_conn} = CreateCookie.select_variants_cookie(conn, cookie_name)
    variant = :erlexp.variant(variants_cookie, "acceptable_subscription_period")
    subscribe_info = variants(variant)
    render(
      new_conn, "index.html",
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
    %{period: 1, period_desc: "year", price: 144 }
  end
end
