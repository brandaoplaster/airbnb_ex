defmodule AirbnbEx.Repo.Migrations.CreatePropertyTable do
  use Ecto.Migration

  def change do
    create table(:properties, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :description, :text
      add :price_per_night, :decimal, precision: 10, scale: 2, null: false
      add :max_guests, :integer, null: false
      add :status, :string, null: false
      add :host_id, references(:users, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end

    create index(:properties, :host_id)
  end
end
