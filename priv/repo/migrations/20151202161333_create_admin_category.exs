defmodule Photographer.Repo.Migrations.CreateAdmin.Category do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string

      timestamps
    end

  end
end
