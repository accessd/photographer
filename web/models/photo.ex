defmodule Photographer.Photo do
  use Photographer.Web, :model

  schema "photos" do
    field :description, :string
    field :file, :string
    field :cover, :boolean
    belongs_to :category, Photographer.Category

    timestamps
  end

  after_delete :delete_file

  @required_fields ~w(file category_id)
  @optional_fields ~w(description cover)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    if is_map(params) && params["photo"] do
      %{"photo" => %Plug.Upload{filename: filename, path: temp_file_path}} = params
      params = Map.put(params, "file", filename)
      save_file(temp_file_path, filename)
    end
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defp file_path(filename) do
    {:ok, basepath} = File.cwd
    "#{basepath}/priv/static/images/portfolio/#{filename}"
  end

  defp save_file(temp_file_path, original_file_name) do
    File.cp! temp_file_path, file_path(original_file_name)
  end

  defp delete_file(changeset) do
    changeset
    |> Ecto.Changeset.get_field(:file)
    |> file_path
    |> File.rm
    changeset
  end
end
