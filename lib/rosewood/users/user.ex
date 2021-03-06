defmodule Rosewood.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    has_many :surveys, Rosewood.DataCollection.Survey

    timestamps()
  end
end
