defmodule Elxdemoapp.BackExperiment do
  use Elxdemoapp.Web, :model

  schema "back_experiment" do

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
