defmodule AirbnbEx.Accommodations.Property do
  use Ecto.Schema
  import Ecto.Changeset

  alias AirbnbEx.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params ~w(title host_id description price_per_night max_guests status)a

  schema "properties" do
    field :title, :string
    field :description, :string
    field :price_per_night, :decimal
    field :max_guests, :integer
    field :status, Ecto.Enum, values: [:active, :inactive, :pending]

    belongs_to :host, User, type: :binary_id

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:max_guests, greater_than: 0)
    |> validate_number(:price_per_night, greater_than: 0)
    |> assoc_constraint(:host)
  end
end
