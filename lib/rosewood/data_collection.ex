defmodule Rosewood.DataCollection do
  import Ecto.Query, warn: false
  alias Rosewood.Repo
  alias Rosewood.DataCollection.{Survey, Question}

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



  alias Rosewood.DataCollection.Question

  def list_questions(survey) do
    query = from question in Question,
      where: question.survey_id == ^survey.id

    Repo.all(query)
  end

  def get_question!(survey, id) do
    query = from question in Question,
      where: question.survey_id == ^survey.id and question.id == ^id

    [question | _] = Repo.all(query)

    question
  end

  def create_question(survey, attrs \\ %{}) do
    question_assoc = Ecto.build_assoc(survey, :questions)
    question = Question.changeset(question_assoc, attrs)

    Repo.insert(question)
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end
end
