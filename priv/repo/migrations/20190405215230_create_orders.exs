defmodule NestedDb.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :human_id, :string

      timestamps()
    end

  end
end
