defmodule AirbnbEx.Repo.Migrations.CreateBookingTable do
  use Ecto.Migration

  def change do
    create table(:bookings, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :check_in, :date, null: false
      add :check_out, :date, null: false
      add :amount, :decimal, precision: 10, scale: 2, null: false
      add :quantity_days, :integer, null: false
      add :status, :string, null: false
      add :guest_id, references(:users, type: :uuid, on_delete: :delete_all)
      add :property_id, references(:properties, type: :uuid, on_delete: :delete_all)

      timestamps()
    end

    create index(:bookings, :property_id)
    create index(:bookings, :guest_id)
  end
end
