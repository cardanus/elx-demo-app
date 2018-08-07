defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller


  def index(conn, _params) do
    subscribe_info = subscribe_info_year()
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

  def subscribe_info_month() do
    %{period: 1, period_desc: "month", price: 12 }
  end

  def subscribe_info_year() do
    %{period: 12, period_desc: "monthes", price: 144 }
  end
end
