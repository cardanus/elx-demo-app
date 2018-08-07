defmodule Elxdemoapp.Repo.Migrations.CreateBackExperiment do
  use Ecto.Migration

  def change do
    create table(:back_experiment) do

      timestamps()
    end

  end
end
