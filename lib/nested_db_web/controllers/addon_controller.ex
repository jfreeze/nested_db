defmodule NestedDbWeb.AddonController do
  use NestedDbWeb, :controller

  alias NestedDb.Addons
  alias NestedDb.Addons.Addon

  def index(conn, _params) do
    addons = Addons.list_addons()
    render(conn, "index.html", addons: addons)
  end

  def new(conn, _params) do
    changeset = Addons.change_addon(%Addon{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"addon" => addon_params}) do
    case Addons.create_addon(addon_params) do
      {:ok, addon} ->
        conn
        |> put_flash(:info, "Addon created successfully.")
        |> redirect(to: Routes.addon_path(conn, :show, addon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    addon = Addons.get_addon!(id)
    render(conn, "show.html", addon: addon)
  end

  def edit(conn, %{"id" => id}) do
    addon = Addons.get_addon!(id)
    changeset = Addons.change_addon(addon)
    render(conn, "edit.html", addon: addon, changeset: changeset)
  end

  def update(conn, %{"id" => id, "addon" => addon_params}) do
    addon = Addons.get_addon!(id)

    case Addons.update_addon(addon, addon_params) do
      {:ok, addon} ->
        conn
        |> put_flash(:info, "Addon updated successfully.")
        |> redirect(to: Routes.addon_path(conn, :show, addon))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", addon: addon, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    addon = Addons.get_addon!(id)
    {:ok, _addon} = Addons.delete_addon(addon)

    conn
    |> put_flash(:info, "Addon deleted successfully.")
    |> redirect(to: Routes.addon_path(conn, :index))
  end
end
