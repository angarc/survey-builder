defmodule Rosewood.DataCollection do
  import Ecto.Query, warn: false
  alias Rosewood.Repo
  alias Rosewood.DataCollection.Survey

  def list_surveys do
    Repo.all(Survey)
  end

  def get_survey!(id), do: Repo.get!(Survey, id)

  def create_survey(attrs \\ %{}) do
    %Survey{}
    |> Survey.changeset(attrs)
    |> Repo.insert()
  end

  def update_survey(%Survey{} = survey, attrs) do
    survey
    |> Survey.changeset(attrs)
    |> Repo.update()
  end

  def delete_survey(%Survey{} = survey) do
    Repo.delete(survey)
  end

  def change_survey(%Survey{} = survey, attrs \\ %{}) do
    Survey.changeset(survey, attrs)
  end
end
