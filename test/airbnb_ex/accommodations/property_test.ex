defmodule AirbnbEx.Accommodations.PropertyTest do
  use AirbnbEx.DataCase
  import AirbnbEx.Factory

  alias AirbnbEx.Accommodations.Property
  alias AirbnbEx.Accommodations

  describe "create_property/1" do
    test "when valid data create a property " do
      user = insert(:user)

      attrs = %{
        title: "My House",
        description: "A beautiful house",
        host_id: user.id,
        price_per_night: 100.00,
        max_guests: 5,
        status: :active
      }

      assert {:ok, %Property{} = property} = Accommodations.create_property(attrs)
      assert property.status == :active
    end

    test "when invalid data return error" do
      attrs = %{
        title: "My House",
        description: "A beautiful house",
        host_id: nil,
        price_per_night: 100.00,
        max_guests: 5,
        status: :active
      }

      assert {:error, %Ecto.Changeset{} = changeset} =
               Accommodations.create_property(attrs)

      assert changeset.errors[:host_id] == {"can't be blank", [validation: :required]}
    end
  end

  describe "get_property!" do
    test "when the property exists it returns data" do
      property = insert(:property)

      assert %Property{} =
               response =
               Accommodations.get_property!(property.id)

      assert response.title == property.title
    end

    test "when the property does not exist it raises an error" do
      assert_raise Ecto.NoResultsError, fn ->
        Accommodations.get_property!("4e02eeac-17ac-45c6-b46a-74563f28e222")
      end
    end
  end

  describe "update_property/2" do
    test "when valid data update a property" do
      property =
        insert(:property, %{
          title: "My House I",
          description: "A beautiful house",
          price_per_night: 50.00,
          max_guests: 1,
          status: :inactive
        })

      attrs = %{
        title: "My House",
        description: "A beautiful house",
        price_per_night: 100.00,
        max_guests: 2,
        status: :active
      }

      assert {:ok, %Property{} = updated_property} =
               Accommodations.update_property(property, attrs)

      assert updated_property.title == attrs.title
      assert updated_property.price_per_night == Decimal.new("100.0")
      assert updated_property.max_guests == attrs.max_guests
      assert updated_property.status == attrs.status
    end

    test "when invalid data return error" do
      property = insert(:property)

      attrs = %{
        title: "My House",
        description: "A beautiful house",
        price_per_night: 100.00,
        max_guests: 0,
        status: :active
      }

      assert {:error, %Ecto.Changeset{} = changeset} =
               Accommodations.update_property(property, attrs)

      assert changeset.errors[:max_guests] ==
               {"must be greater than %{number}",
                [{:validation, :number}, {:kind, :greater_than}, {:number, 0}]}
    end
  end

  describe "delete_property/1" do
    test "when the property exist delete" do
      property = insert(:property)

      assert {:ok, %Property{}} = Accommodations.delete_property(property.id)
      assert_raise Ecto.NoResultsError, fn -> Accommodations.get_property!(property.id) end
    end

    test "when the property does not exist raise an error" do
      assert_raise Ecto.NoResultsError, fn ->
        Accommodations.delete_property("4e02eeac-17ac-45c6-b46a-74563f28e222")
      end
    end
  end
end
