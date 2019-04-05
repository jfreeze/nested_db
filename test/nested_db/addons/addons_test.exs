defmodule NestedDb.AddonsTest do
  use NestedDb.DataCase

  alias NestedDb.Addons

  describe "addons" do
    alias NestedDb.Addons.Addon

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def addon_fixture(attrs \\ %{}) do
      {:ok, addon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Addons.create_addon()

      addon
    end

    test "list_addons/0 returns all addons" do
      addon = addon_fixture()
      assert Addons.list_addons() == [addon]
    end

    test "get_addon!/1 returns the addon with given id" do
      addon = addon_fixture()
      assert Addons.get_addon!(addon.id) == addon
    end

    test "create_addon/1 with valid data creates a addon" do
      assert {:ok, %Addon{} = addon} = Addons.create_addon(@valid_attrs)
      assert addon.name == "some name"
    end

    test "create_addon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addons.create_addon(@invalid_attrs)
    end

    test "update_addon/2 with valid data updates the addon" do
      addon = addon_fixture()
      assert {:ok, %Addon{} = addon} = Addons.update_addon(addon, @update_attrs)
      assert addon.name == "some updated name"
    end

    test "update_addon/2 with invalid data returns error changeset" do
      addon = addon_fixture()
      assert {:error, %Ecto.Changeset{}} = Addons.update_addon(addon, @invalid_attrs)
      assert addon == Addons.get_addon!(addon.id)
    end

    test "delete_addon/1 deletes the addon" do
      addon = addon_fixture()
      assert {:ok, %Addon{}} = Addons.delete_addon(addon)
      assert_raise Ecto.NoResultsError, fn -> Addons.get_addon!(addon.id) end
    end

    test "change_addon/1 returns a addon changeset" do
      addon = addon_fixture()
      assert %Ecto.Changeset{} = Addons.change_addon(addon)
    end
  end
end
