defmodule Photographer.Category do
  use Photographer.Web, :model
  import Ecto.Query
  alias Photographer.Photo

  schema "categories" do
    field :title, :string

    has_many :photos, Photographer.Photo
    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def with_photos(query) do
    photos_query = from p in Photo,
      order_by: [desc: p.cover, asc: p.id]
    from c in query,
      left_join: p in assoc(c, :photos),
      where: p.cover == true,
      select: {c, p.file},
      preload: [photos: ^photos_query]
  end
end
