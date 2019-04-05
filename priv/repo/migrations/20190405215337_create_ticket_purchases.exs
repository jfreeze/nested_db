defmodule NestedDb.Repo.Migrations.CreateTicketPurchases do
  use Ecto.Migration

  def change do
    create table(:ticket_purchases) do
      add :name, :string
      add :order_id, references(:orders, on_delete: :nothing)

      timestamps()
    end

    create index(:ticket_purchases, [:order_id])
  end
end
