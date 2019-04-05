defmodule NestedDb.Repo do
  use Ecto.Repo,
    otp_app: :nested_db,
    adapter: Ecto.Adapters.Postgres
end
