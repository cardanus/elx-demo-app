defmodule Elxdemoapp.BackExperimentTest do
  use Elxdemoapp.ModelCase

  alias Elxdemoapp.BackExperiment

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BackExperiment.changeset(%BackExperiment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BackExperiment.changeset(%BackExperiment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
