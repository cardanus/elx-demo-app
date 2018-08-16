defmodule Elxdemoapp.Helpers.UserId do
  @moduledoc false

  def build_id(conn) do
    to_string(:inet_parse.ntoa(conn.remote_ip)) <> Map.get(Enum.into(conn.req_headers, %{}) , "user-agent")
  end

end
