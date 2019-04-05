defmodule NestedDb.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias NestedDb.Repo

  alias NestedDb.Orders.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{source: %Order{}}

  """
  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end

  alias NestedDb.Orders.TicketPurchase

  @doc """
  Returns the list of ticket_purchases.

  ## Examples

      iex> list_ticket_purchases()
      [%TicketPurchase{}, ...]

  """
  def list_ticket_purchases do
    Repo.all(TicketPurchase)
  end

  @doc """
  Gets a single ticket_purchase.

  Raises `Ecto.NoResultsError` if the Ticket purchase does not exist.

  ## Examples

      iex> get_ticket_purchase!(123)
      %TicketPurchase{}

      iex> get_ticket_purchase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ticket_purchase!(id), do: Repo.get!(TicketPurchase, id)

  @doc """
  Creates a ticket_purchase.

  ## Examples

      iex> create_ticket_purchase(%{field: value})
      {:ok, %TicketPurchase{}}

      iex> create_ticket_purchase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ticket_purchase(attrs \\ %{}) do
    %TicketPurchase{}
    |> TicketPurchase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ticket_purchase.

  ## Examples

      iex> update_ticket_purchase(ticket_purchase, %{field: new_value})
      {:ok, %TicketPurchase{}}

      iex> update_ticket_purchase(ticket_purchase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ticket_purchase(%TicketPurchase{} = ticket_purchase, attrs) do
    ticket_purchase
    |> TicketPurchase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TicketPurchase.

  ## Examples

      iex> delete_ticket_purchase(ticket_purchase)
      {:ok, %TicketPurchase{}}

      iex> delete_ticket_purchase(ticket_purchase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ticket_purchase(%TicketPurchase{} = ticket_purchase) do
    Repo.delete(ticket_purchase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ticket_purchase changes.

  ## Examples

      iex> change_ticket_purchase(ticket_purchase)
      %Ecto.Changeset{source: %TicketPurchase{}}

  """
  def change_ticket_purchase(%TicketPurchase{} = ticket_purchase) do
    TicketPurchase.changeset(ticket_purchase, %{})
  end

  def test_create_order() do
    attrs = %{
      human_id: "JDFABC",
      ticket_purchases: [
          %{name: "ticket 1",
            addons: [
              %{name: "addon a"},
              %{name: "addon b"}
            ]
          },
          %{name: "ticket 2",
            addons: [
                %{name: "addon 1"},
                %{name: "addon 2"}
            ]
        }
      ]
    }

    # IO.inspect build_assoc(:ticket_purchases, attrs)
#    order = create_order(attrs)
#    IO.inspect order
  end
end
