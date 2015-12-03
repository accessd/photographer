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
    if is_map(params) do
      %{"photo" => %Plug.Upload{filename: filename, path: temp_file_path}} = params
      params = Map.put(params, "file", filename)
      save_file(temp_file_path, filename)
    end
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defp save_file(temp_file_path, original_file_name) do
    {:ok, basepath} = File.cwd
    File.cp! temp_file_path,
    "#{basepath}/priv/static/images/portfolio/#{original_file_name}"
  end
end
