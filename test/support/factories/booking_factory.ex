defmodule AirbnbEx.BookingFactory do
  alias AirbnbEx.Bookings.Booking

  defmacro __using__(_opts) do
    quote do
      def booking_factory do
        %Booking{
          id: Faker.UUID.v4(),
          check_in: Faker.Date.backward(30),
          check_out: Faker.Date.forward(30),
          property: build(:property),
          guest: build(:user)
        }
      end
    end
  end
end
