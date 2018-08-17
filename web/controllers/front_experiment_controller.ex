defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.UserId

  def index(conn, _params) do
    button_content = conn
      |> UserId.fetch()
      |> :erlexp.variant("deposit_button_exp0") # "year_subscribtion" is experiment name
      |> gen_button_content()

    render(
      conn, "index.html",
      content: button_content
    )
  end

  def gen_button_content(:a), do: "Yes, I want!"
  def gen_button_content(:b), do: "No! I want to earn 16%!"

end
