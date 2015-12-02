defmodule Photographer.Admin.PhotoTest do
  use Photographer.ModelCase

  alias Photographer.Photo

  @valid_attrs %{description: "some content", file: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Photo.changeset(%Photo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Photo.changeset(%Photo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
