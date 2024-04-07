defmodule AirbnbEx.Accommodations.BookingTest do
  use AirbnbEx.DataCase
  import AirbnbEx.Factory

  alias AirbnbEx.Bookings.Booking
  alias AirbnbEx.Bookings

  describe "create_booking/1" do
    test "when valid data create a booking" do
      user = insert(:user)
      property = insert(:property)

      check_in = Date.utc_today()
      check_out = Date.add(check_in, 5)

      attrs = %{
        check_in: check_in,
        check_out: check_out,
        amount: 200.00,
        quantity_days: 5,
        status: "active",
        property_id: property.id,
        guest_id: user.id
      }

      assert {:ok, %Booking{} = booking} = Bookings.create_booking(attrs)
      assert booking.status == "active"
      assert booking.property_id == property.id
      assert booking.guest_id == user.id
    end

    test "when invalid data return error" do
      check_in = Date.utc_today()
      check_out = Date.add(check_in, 5)

      attrs = %{
        check_in: check_in,
        check_out: check_out,
        amount: 200.00,
        quantity_days: 5,
        status: "active"
      }

      assert {:error, %Ecto.Changeset{} = changeset} =
               Bookings.create_booking(attrs)

      assert changeset.errors[:guest_id] == {"can't be blank", [validation: :required]}
      assert changeset.errors[:property_id] == {"can't be blank", [validation: :required]}
    end
  end

  describe "get_booking!" do
    test "when the booking exists it returns data" do
      booking = insert(:booking)

      assert %Booking{} =
               response =
               Bookings.get_booking!(booking.id)

      assert response.status == booking.status
    end

    test "when the booking does not exist it raises an error" do
      assert_raise Ecto.NoResultsError, fn ->
        Bookings.get_booking!("4e02eeac-17ac-45c6-b46a-74563f28e222")
      end
    end
  end

  describe "update_booking/2" do
    test "when valid data update a booking" do
      booking =
        insert(:booking, %{
          check_in: Date.utc_today(),
          check_out: Date.add(Date.utc_today(), 5),
          amount: 200.00,
          quantity_days: 5,
          status: "cancelled"
        })

      attrs = %{
        status: "active",
        check_out: Date.add(Date.utc_today(), 4),
        quantity_days: 4
      }

      assert {:ok, %Booking{} = updated_booking} =
               Bookings.update_booking(booking, attrs)

      assert updated_booking.status == "active"
      assert updated_booking.quantity_days == attrs.quantity_days
      assert updated_booking.check_out == attrs.check_out
    end

    test "when invalid data return error" do
      booking =
        insert(:booking)

      attrs = %{
        status: "pending"
      }

      assert {:error, %Ecto.Changeset{} = changeset} =
               Bookings.update_booking(booking, attrs)

      assert changeset.errors[:status] ==
               {"is invalid", [{:validation, :inclusion}, {:enum, ["active", "cancelled"]}]}
    end
  end

  describe "delete_booking/1" do
    test "when the booking exist delete" do
      booking = insert(:booking)

      assert {:ok, %Booking{}} = Bookings.delete_booking(booking.id)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_booking!(booking.id) end
    end

    test "when the booking does not exist raise an error" do
      assert_raise Ecto.NoResultsError, fn ->
        Bookings.delete_booking("4e02eeac-17ac-45c6-b46a-74563f28e222")
      end
    end
  end
end
