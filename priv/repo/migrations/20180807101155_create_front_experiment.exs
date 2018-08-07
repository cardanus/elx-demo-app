defmodule Elxdemoapp.Repo.Migrations.CreateFrontExperiment do
  use Ecto.Migration

  def change do
    create table(:front_experement) do

      timestamps()
    end

  end
end
