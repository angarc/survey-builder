defmodule Rosewood.Repo do
  use Ecto.Repo,
    otp_app: :rosewood,
    adapter: Ecto.Adapters.Postgres
end
