defmodule Elxdemoapp.FrontExperiment do
  use Elxdemoapp.Web, :model

  schema "front_experement" do

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
