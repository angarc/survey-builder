defmodule Rosewood.DataCollection.Survey do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rosewood.Users.User
  alias Rosewood.DataCollection.Question

  schema "surveys" do
    field :code, :string
    field :title, :string
    belongs_to :user, User
    field :description, :string
    has_many :questions, Question

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
