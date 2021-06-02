defmodule Rosewood.DataCollection.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :title, :string
    belongs_to :survey, Rosewood.DataCollection.Survey

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :survey_id])
    |> validate_required([:title, :survey_id])
  end
end
