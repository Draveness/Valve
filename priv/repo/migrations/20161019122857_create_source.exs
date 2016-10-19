defmodule Valve.Repo.Migrations.CreateSource do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :name, :string
      add :version, :string
      add :meta, :map

      timestamps()
    end

  end
end
