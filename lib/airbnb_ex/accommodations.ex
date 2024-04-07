defmodule AirbnbEx.Accommodations do
  @moduledoc """
  The Accommodations context.
  """

  import Ecto.Query, warn: false
  alias AirbnbEx.Repo
  alias AirbnbEx.Accommodations.Property

  def create_property(attrs \\ %{}) do
    attrs
    |> Property.changeset()
    |> Repo.insert()
  end

  def get_property!(id) do
    Repo.get!(Property, id)
  end

  def update_property(property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  def delete_property(id) do
    id
    |> get_property!()
    |> Repo.delete()
  end
end
