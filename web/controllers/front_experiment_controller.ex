defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.UserId

  def index(conn, _params) do
    variant = conn
      |> UserId.build_id()
      |> :erlexp.variant("acceptable_subscription_period")

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
    %{period: 1, period_desc: "year", price: 144 }
  end
end
