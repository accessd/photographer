defmodule Photographer.Repo.Migrations.AddCoverToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :cover, :boolean
    end
  end
end
