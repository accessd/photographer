defmodule Photographer.Photo do
  use Photographer.Web, :model

  schema "photos" do
    field :description, :string
    field :file, :string
    belongs_to :category, Photographer.Category

    timestamps
  end

  @required_fields ~w(description file category_id)
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
end
