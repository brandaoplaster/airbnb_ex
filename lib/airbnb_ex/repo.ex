defmodule AirbnbEx.Repo do
  use Ecto.Repo,
    otp_app: :airbnb_ex,
    adapter: Ecto.Adapters.Postgres
end
