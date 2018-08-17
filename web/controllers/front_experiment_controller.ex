defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.UserId

  def index(conn, _params) do
    subscribe_info = conn
      |> UserId.fetch()
      |> :erlexp.variant("year_subscribtion") # "year_subscribtion" is experiment name
      |> gen_price()

    render(
      conn, "index.html",
      price: subscribe_info.price,
      period: subscribe_info.period,
      period_desc: subscribe_info.period_desc
    )
  end

  # old version with monthly price
  def gen_price(:a) do
    %{period: 1, period_desc: "month", price: 12 }
  end

  # new version with yearly price
  def gen_price(:b) do
    %{period: 1, period_desc: "year", price: 144 }
  end

  def show(conn, %{"id" => month}) do
    render(conn, "show.html", price: month)
  end

end
