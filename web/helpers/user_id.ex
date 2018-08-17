defmodule Elxdemoapp.Helpers.UserId do
  @moduledoc false

  @doc """
  Right now we are using combination of user_ip and user_agent as user_id, but actually any mechanism can be
  implemented here (eg cookie, fingerprintjs, user_id from authorization, etc).
  """
  def fetch(conn) do
    to_string(:inet_parse.ntoa(conn.remote_ip)) <> Map.get(Enum.into(conn.req_headers, %{}) , "user-agent")
  end

end
