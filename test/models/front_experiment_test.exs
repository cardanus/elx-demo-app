defmodule Elxdemoapp.FrontExperimentTest do
  use Elxdemoapp.ModelCase

  alias Elxdemoapp.FrontExperiment

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FrontExperiment.changeset(%FrontExperiment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FrontExperiment.changeset(%FrontExperiment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
