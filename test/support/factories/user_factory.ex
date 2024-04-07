defmodule AirbnbEx.UserFactory do
  alias AirbnbEx.Accounts.User

  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %User{
          id: Faker.UUID.v4(),
          email: Faker.Internet.email(),
          hashed_password: "1234567891212"
        }
      end
    end
  end
end
