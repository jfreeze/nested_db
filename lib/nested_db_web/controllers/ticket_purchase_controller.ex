defmodule NestedDbWeb.TicketPurchaseController do
  use NestedDbWeb, :controller

  alias NestedDb.Orders
  alias NestedDb.Orders.TicketPurchase

  def index(conn, _params) do
    ticket_purchases = Orders.list_ticket_purchases()
    render(conn, "index.html", ticket_purchases: ticket_purchases)
  end

  def new(conn, _params) do
    changeset = Orders.change_ticket_purchase(%TicketPurchase{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ticket_purchase" => ticket_purchase_params}) do
    case Orders.create_ticket_purchase(ticket_purchase_params) do
      {:ok, ticket_purchase} ->
        conn
        |> put_flash(:info, "Ticket purchase created successfully.")
        |> redirect(to: Routes.ticket_purchase_path(conn, :show, ticket_purchase))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ticket_purchase = Orders.get_ticket_purchase!(id)
    render(conn, "show.html", ticket_purchase: ticket_purchase)
  end

  def edit(conn, %{"id" => id}) do
    ticket_purchase = Orders.get_ticket_purchase!(id)
    changeset = Orders.change_ticket_purchase(ticket_purchase)
    render(conn, "edit.html", ticket_purchase: ticket_purchase, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ticket_purchase" => ticket_purchase_params}) do
    ticket_purchase = Orders.get_ticket_purchase!(id)

    case Orders.update_ticket_purchase(ticket_purchase, ticket_purchase_params) do
      {:ok, ticket_purchase} ->
        conn
        |> put_flash(:info, "Ticket purchase updated successfully.")
        |> redirect(to: Routes.ticket_purchase_path(conn, :show, ticket_purchase))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ticket_purchase: ticket_purchase, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ticket_purchase = Orders.get_ticket_purchase!(id)
    {:ok, _ticket_purchase} = Orders.delete_ticket_purchase(ticket_purchase)

    conn
    |> put_flash(:info, "Ticket purchase deleted successfully.")
    |> redirect(to: Routes.ticket_purchase_path(conn, :index))
  end
end
