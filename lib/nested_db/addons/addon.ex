defmodule NestedDb.Addons.Addon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addons" do
    field :name, :string

    belongs_to :ticket_purchase, NestedDb.Orders.TicketPurchase
    timestamps()
  end

  @doc false
  def changeset(addon, attrs) do
    addon
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
