defmodule RosewoodWeb.Dashboard.SurveyController do
  use RosewoodWeb, :controller
  alias Rosewood.DataCollection
  alias Rosewood.DataCollection.Survey

  def new(conn, _params) do
    changeset = Survey.changeset(%Survey{}, %{})

    conn
    |> assign(:changeset, changeset)
    |> render("new.html")
  end

  def create(conn, %{"survey" => survey}) do
    current_user = Pow.Plug.current_user(conn)
    case DataCollection.create_survey(current_user, survey) do
      {:ok, survey} ->
        conn
        |> assign(:survey, survey)
        |> render("show.html")
      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render("new.html")
    end
  end

  def edit(conn, %{"id" => id}) do
    current_user = Pow.Plug.current_user(conn)
    survey = DataCollection.get_survey!(current_user, id)
    changeset = Survey.changeset(survey, %{})

    conn
    |> assign(:changeset, changeset)
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "survey" => survey_params}) do
    current_user = Pow.Plug.current_user(conn)
    survey = DataCollection.get_survey!(current_user, id)
    DataCollection.update_survey(survey, survey_params)

    redirect(conn, to: Routes.dashboard_survey_path(conn, :show, survey.id))
  end

  def show(conn, %{"id" => id}) do
    current_user = Pow.Plug.current_user(conn)
    survey = DataCollection.get_survey!(current_user, id)
    questions = DataCollection.list_questions(survey)

    conn
    |> assign(:survey, survey)
    |> assign(:questions, questions)
    |> render("show.html")
  end

  def delete(conn, %{"id" => id}) do
    current_user = Pow.Plug.current_user(conn)
    survey = DataCollection.get_survey!(current_user, id)
    DataCollection.delete_survey(survey)

    redirect(conn, to: Routes.dashboard_dashboard_path(conn, :index))
  end
end
