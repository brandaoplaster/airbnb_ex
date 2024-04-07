defmodule Mix.Tasks.DevDatabase do
  @moduledoc """
  This task is used to populate the database with data for development
  """
  @shortdoc "Populates the database with data for development"

  use Mix.Task

  alias AirbnbEx.{Accounts, Accommodations}

  def run(_) do
    Application.ensure_all_started(:airbnb_ex)
    AirbnbEx.Repo.start_link()

    users = Enum.map(1..3, &create_user/1)
    Enum.each(1..25, fn _ -> create_property(Enum.random(users)) end)
  end

  defp create_user(n) do
    attrs = %{
      email: "user#{n}@example.com",
      hashed_password: "user12345678",
      password: "user12345678"
    }

    {:ok, user} = Accounts.register_user(attrs)
    user.id
  end

  defp create_property(user_id) do
    property = %{
      title: Faker.Lorem.sentence(),
      description: Faker.Lorem.paragraph(),
      price_per_night: Faker.Commerce.price(),
      max_guests: :rand.uniform(10),
      status: :active,
      host_id: user_id
    }

    Accommodations.create_property(property)
  end
end
