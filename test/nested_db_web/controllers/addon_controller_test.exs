defmodule NestedDbWeb.AddonControllerTest do
  use NestedDbWeb.ConnCase

  alias NestedDb.Addons

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:addon) do
    {:ok, addon} = Addons.create_addon(@create_attrs)
    addon
  end

  describe "index" do
    test "lists all addons", %{conn: conn} do
      conn = get(conn, Routes.addon_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Addons"
    end
  end

  describe "new addon" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.addon_path(conn, :new))
      assert html_response(conn, 200) =~ "New Addon"
    end
  end

  describe "create addon" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.addon_path(conn, :create), addon: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.addon_path(conn, :show, id)

      conn = get(conn, Routes.addon_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Addon"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.addon_path(conn, :create), addon: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Addon"
    end
  end

  describe "edit addon" do
    setup [:create_addon]

    test "renders form for editing chosen addon", %{conn: conn, addon: addon} do
      conn = get(conn, Routes.addon_path(conn, :edit, addon))
      assert html_response(conn, 200) =~ "Edit Addon"
    end
  end

  describe "update addon" do
    setup [:create_addon]

    test "redirects when data is valid", %{conn: conn, addon: addon} do
      conn = put(conn, Routes.addon_path(conn, :update, addon), addon: @update_attrs)
      assert redirected_to(conn) == Routes.addon_path(conn, :show, addon)

      conn = get(conn, Routes.addon_path(conn, :show, addon))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, addon: addon} do
      conn = put(conn, Routes.addon_path(conn, :update, addon), addon: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Addon"
    end
  end

  describe "delete addon" do
    setup [:create_addon]

    test "deletes chosen addon", %{conn: conn, addon: addon} do
      conn = delete(conn, Routes.addon_path(conn, :delete, addon))
      assert redirected_to(conn) == Routes.addon_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.addon_path(conn, :show, addon))
      end
    end
  end

  defp create_addon(_) do
    addon = fixture(:addon)
    {:ok, addon: addon}
  end
end
