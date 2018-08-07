defmodule Elxdemoapp.BackExperimentController do
  use Elxdemoapp.Web, :controller


  def index(conn, _params) do
    render(conn, "index.html")
  end

end
