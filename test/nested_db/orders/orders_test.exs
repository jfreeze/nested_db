defmodule NestedDb.OrdersTest do
  use NestedDb.DataCase

  alias NestedDb.Orders

  describe "orders" do
    alias NestedDb.Orders.Order

    @valid_attrs %{human_id: "some human_id"}
    @update_attrs %{human_id: "some updated human_id"}
    @invalid_attrs %{human_id: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.human_id == "some human_id"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Orders.update_order(order, @update_attrs)
      assert order.human_id == "some updated human_id"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end

  describe "ticket_purchases" do
    alias NestedDb.Orders.TicketPurchase

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def ticket_purchase_fixture(attrs \\ %{}) do
      {:ok, ticket_purchase} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_ticket_purchase()

      ticket_purchase
    end

    test "list_ticket_purchases/0 returns all ticket_purchases" do
      ticket_purchase = ticket_purchase_fixture()
      assert Orders.list_ticket_purchases() == [ticket_purchase]
    end

    test "get_ticket_purchase!/1 returns the ticket_purchase with given id" do
      ticket_purchase = ticket_purchase_fixture()
      assert Orders.get_ticket_purchase!(ticket_purchase.id) == ticket_purchase
    end

    test "create_ticket_purchase/1 with valid data creates a ticket_purchase" do
      assert {:ok, %TicketPurchase{} = ticket_purchase} = Orders.create_ticket_purchase(@valid_attrs)
      assert ticket_purchase.name == "some name"
    end

    test "create_ticket_purchase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_ticket_purchase(@invalid_attrs)
    end

    test "update_ticket_purchase/2 with valid data updates the ticket_purchase" do
      ticket_purchase = ticket_purchase_fixture()
      assert {:ok, %TicketPurchase{} = ticket_purchase} = Orders.update_ticket_purchase(ticket_purchase, @update_attrs)
      assert ticket_purchase.name == "some updated name"
    end

    test "update_ticket_purchase/2 with invalid data returns error changeset" do
      ticket_purchase = ticket_purchase_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_ticket_purchase(ticket_purchase, @invalid_attrs)
      assert ticket_purchase == Orders.get_ticket_purchase!(ticket_purchase.id)
    end

    test "delete_ticket_purchase/1 deletes the ticket_purchase" do
      ticket_purchase = ticket_purchase_fixture()
      assert {:ok, %TicketPurchase{}} = Orders.delete_ticket_purchase(ticket_purchase)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_ticket_purchase!(ticket_purchase.id) end
    end

    test "change_ticket_purchase/1 returns a ticket_purchase changeset" do
      ticket_purchase = ticket_purchase_fixture()
      assert %Ecto.Changeset{} = Orders.change_ticket_purchase(ticket_purchase)
    end
  end
end
