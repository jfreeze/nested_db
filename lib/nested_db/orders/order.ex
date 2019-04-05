defmodule NestedDb.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :human_id, :string

    has_many :ticket_purchases, NestedDb.Orders.TicketPurchase
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:human_id])
    |> validate_required([:human_id])
  end
end
