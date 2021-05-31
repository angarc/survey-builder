defmodule Rosewood.DataCollection.Survey do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rosewood.Users.User

  schema "surveys" do
    field :code, :string
    field :title, :string
    belongs_to :user, User
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(survey, attrs) do
    survey
    |> cast(attrs, [:title, :user_id, :code, :description])
    |> validate_required([:title, :user_id, :code])
    |> unique_constraint(:code)
  end
end
