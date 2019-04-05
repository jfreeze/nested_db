defmodule NestedDb.Repo.Migrations.CreateAddons do
  use Ecto.Migration

  def change do
    create table(:addons) do
      add :name, :string
      add :ticket_purchase_id, references(:ticket_purchases, on_delete: :nothing)

      timestamps()
    end

    create index(:addons, [:ticket_purchase_id])
  end
end
