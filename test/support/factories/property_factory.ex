defmodule AirbnbEx.PropertyFactory do
  alias AirbnbEx.Accommodations.Property

  defmacro __using__(_opts) do
    quote do
      def property_factory do
        %Property{
          id: Faker.UUID.v4(),
          title: Faker.Lorem.sentence(),
          description: Faker.Lorem.paragraph(),
          max_guests: :rand.uniform(10),
          price_per_night: Faker.Commerce.price(),
          status: :active,
          host: build(:user)
        }
      end
    end
  end
end
