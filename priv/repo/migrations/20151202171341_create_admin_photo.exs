defmodule Photographer.Repo.Migrations.CreateAdmin.Photo do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :description, :text
      add :file, :string
      add :category_id, references(:categories)

      timestamps
    end
    create index(:photos, [:category_id])

  end
end
