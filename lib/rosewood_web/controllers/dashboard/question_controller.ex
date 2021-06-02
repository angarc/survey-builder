defmodule RosewoodWeb.Dashboard.QuestionController do
  use RosewoodWeb, :controller

  alias Rosewood.Repo
  alias Rosewood.DataCollection.Question
  alias Rosewood.DataCollection

  def new(conn, %{"survey_id" => survey_id}) do
    survey = DataCollection.get_survey!(Pow.Plug.current_user(conn), survey_id)
    changeset = Question.changeset(%Question{}, %{})

    conn
    |> assign(:changeset, changeset)
    |> assign(:survey, survey)
    |> render("new.html");
  end

  def create(conn, %{"question" => question_params, "survey_id" => survey_id}) do
    survey = DataCollection.get_survey!(Pow.Plug.current_user(conn), survey_id)

    case DataCollection.create_question(survey, question_params) do
      {:ok, question} ->
        redirect(conn, to: Routes.dashboard_survey_question_path(conn, :edit, survey, question))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id, "survey_id" => survey_id}) do
    survey = DataCollection.get_survey!(Pow.Plug.current_user(conn), survey_id)
    question = DataCollection.get_question!(survey, id)

    changeset = Question.changeset(question, %{})

    conn
    |> assign(:changeset, changeset)
    |> assign(:survey, survey)
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "question" => question_params, "survey_id" => survey_id}) do
    survey = DataCollection.get_survey!(Pow.Plug.current_user(conn), survey_id)
    question = DataCollection.get_question!(survey, id)
    DataCollection.update_question(question, question_params)

    redirect(conn, to: Routes.dashboard_survey_path(conn, :show, survey))
  end
end
