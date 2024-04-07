defmodule AirbnbEx.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  alias AirbnbEx.Accommodations.Property
  alias AirbnbEx.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params ~w(property_id guest_id check_in check_out amount quantity_days status)a
  @status_values ["active", "cancelled"]

  schema "bookings" do
    field :check_in, :date
    field :check_out, :date
    field :amount, :decimal
    field :quantity_days, :integer
    field :status, :string

    belongs_to :property, Property, type: :binary_id
    belongs_to :guest, User, type: :binary_id

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:quantity_days, greater_than: 0)
    |> validate_number(:amount, greater_than: 0)
    |> validate_inclusion(:status, @status_values)
    |> validate_past_date(:check_in)
    |> validate_past_date(:check_out)
    |> validate_date_grater_than(:check_in, :check_out)
    |> assoc_constraint(:property)
    |> assoc_constraint(:guest)
  end

  defp validate_past_date(changeset, field) do
    data = get_field(changeset, field)

    case Date.compare(data, Date.utc_today()) do
      :lt ->
        add_error(changeset, field, "#{field} is in the past")

      _ ->
        changeset
    end
  end

  defp validate_date_grater_than(changeset, date_in, date_out) do
    check_in = get_field(changeset, date_in)
    check_out = get_field(changeset, date_out)

    case Date.compare(check_in, check_out) do
      :gt ->
        add_error(changeset, :check_out, "Check out date must be greater than check in date")

      _ ->
        changeset
    end
  end
end
