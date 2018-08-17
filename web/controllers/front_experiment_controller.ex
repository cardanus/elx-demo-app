defmodule Elxdemoapp.FrontExperimentController do
  use Elxdemoapp.Web, :controller
  alias Elxdemoapp.Helpers.UserId

  def index(conn, _params) do
     user_id = conn |> UserId.fetch()

    button_content = user_id
      |> :erlexp.variant("deposit_button_exp0") # "deposit_button_exp0" is experiment name
      |> gen_button_content()

    button_class = user_id
      |> :erlexp.variant("deposit_button_green") # "deposit_button_green" is experiment name
      |> gen_button_class()

    render(
      conn, "index.html",
      content: button_content,
      button_class: button_class
    )
  end

  def gen_button_content(:a), do: "Earn 18% with us!"
  def gen_button_content(:b), do: "Save 18% with us!"

  def gen_button_class(:a), do: ""
  def gen_button_class(:b), do: "green"


end
