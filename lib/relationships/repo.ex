defmodule Relationships.Repo do
  use Ecto.Repo,
    otp_app: :relationships,
    adapter: Ecto.Adapters.Postgres
end
