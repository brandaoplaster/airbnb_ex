defmodule AirbnbEx.Factory do
  use ExMachina.Ecto, repo: AirbnbEx.Repo

  use AirbnbEx.UserFactory
  use AirbnbEx.PropertyFactory
  use AirbnbEx.BookingFactory
end
