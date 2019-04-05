defmodule NestedDb.Orders.TicketPurchase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ticket_purchases" do
    field :name, :string

    belongs_to :order, NestedDb.Orders.Order
    has_many :addons, NestedDb.Addons.Addon

    timestamps()
  end

  @doc false
  def changeset(ticket_purchase, attrs) do
    ticket_purchase
    |> cast(attrs, [:name])
    |> cast_assoc(:addons)
    |> validate_required([:name])
  end
end
