defmodule Rosewood.DataCollection do
  import Ecto.Query, warn: false
  alias Rosewood.Repo
  alias Rosewood.DataCollection.Survey

  def list_surveys(user) do
    query = from survey in Survey,
      where: survey.user_id == ^user.id
    
    Repo.all(query)
  end

  def get_survey!(user, id) do
    query = from survey in Survey,
      where: survey.user_id == ^user.id and survey.id == ^id

    [survey | _] = Repo.all(query)
    survey
  end

  def create_survey(user, attrs \\ %{}) do
    survey = Ecto.build_assoc(user, :surveys)
      
    survey
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
