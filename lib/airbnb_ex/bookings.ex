defmodule AirbnbEx.Bookings do
  @moduledoc """
  The Booking context.
  """

  import Ecto.Query, warn: false

  alias AirbnbEx.Repo
  alias AirbnbEx.Bookings.Booking

  def create_booking(attrs \\ %{}) do
    attrs
    |> Booking.changeset()
    |> Repo.insert()
  end

  def get_booking!(id) do
    Repo.get!(Booking, id)
  end

  def update_booking(%Booking{} = booking, attrs) do
    booking
    |> Booking.changeset(attrs)
    |> Repo.update()
  end

  def delete_booking(id) do
    id
    |> get_booking!()
    |> Repo.delete()
  end
end
