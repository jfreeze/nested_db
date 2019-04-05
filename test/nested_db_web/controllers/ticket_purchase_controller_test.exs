defmodule NestedDbWeb.TicketPurchaseControllerTest do
  use NestedDbWeb.ConnCase

  alias NestedDb.Orders

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:ticket_purchase) do
    {:ok, ticket_purchase} = Orders.create_ticket_purchase(@create_attrs)
    ticket_purchase
  end

  describe "index" do
    test "lists all ticket_purchases", %{conn: conn} do
      conn = get(conn, Routes.ticket_purchase_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ticket purchases"
    end
  end

  describe "new ticket_purchase" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ticket_purchase_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ticket purchase"
    end
  end

  describe "create ticket_purchase" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ticket_purchase_path(conn, :create), ticket_purchase: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ticket_purchase_path(conn, :show, id)

      conn = get(conn, Routes.ticket_purchase_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ticket purchase"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ticket_purchase_path(conn, :create), ticket_purchase: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ticket purchase"
    end
  end

  describe "edit ticket_purchase" do
    setup [:create_ticket_purchase]

    test "renders form for editing chosen ticket_purchase", %{conn: conn, ticket_purchase: ticket_purchase} do
      conn = get(conn, Routes.ticket_purchase_path(conn, :edit, ticket_purchase))
      assert html_response(conn, 200) =~ "Edit Ticket purchase"
    end
  end

  describe "update ticket_purchase" do
    setup [:create_ticket_purchase]

    test "redirects when data is valid", %{conn: conn, ticket_purchase: ticket_purchase} do
      conn = put(conn, Routes.ticket_purchase_path(conn, :update, ticket_purchase), ticket_purchase: @update_attrs)
      assert redirected_to(conn) == Routes.ticket_purchase_path(conn, :show, ticket_purchase)

      conn = get(conn, Routes.ticket_purchase_path(conn, :show, ticket_purchase))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, ticket_purchase: ticket_purchase} do
      conn = put(conn, Routes.ticket_purchase_path(conn, :update, ticket_purchase), ticket_purchase: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ticket purchase"
    end
  end

  describe "delete ticket_purchase" do
    setup [:create_ticket_purchase]

    test "deletes chosen ticket_purchase", %{conn: conn, ticket_purchase: ticket_purchase} do
      conn = delete(conn, Routes.ticket_purchase_path(conn, :delete, ticket_purchase))
      assert redirected_to(conn) == Routes.ticket_purchase_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.ticket_purchase_path(conn, :show, ticket_purchase))
      end
    end
  end

  defp create_ticket_purchase(_) do
    ticket_purchase = fixture(:ticket_purchase)
    {:ok, ticket_purchase: ticket_purchase}
  end
end
