defmodule Rosewood.DataCollection.Survey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "surveys" do
    field :code, :string
    field :title, :string
    field :user_id, :integer
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
