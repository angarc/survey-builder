defmodule Rosewood.DataCollectionTest do
  use Rosewood.DataCase

  alias Rosewood.DataCollection

  describe "surveys" do
    alias Rosewood.DataCollection.Survey

    @valid_attrs %{code: "some code", title: "some title", user_id: 42}
    @update_attrs %{code: "some updated code", title: "some updated title", user_id: 43}
    @invalid_attrs %{code: nil, title: nil, user_id: nil}

    def survey_fixture(attrs \\ %{}) do
      {:ok, survey} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DataCollection.create_survey()

      survey
    end

    test "list_surveys/0 returns all surveys" do
      survey = survey_fixture()
      assert DataCollection.list_surveys() == [survey]
    end

    test "get_survey!/1 returns the survey with given id" do
      survey = survey_fixture()
      assert DataCollection.get_survey!(survey.id) == survey
    end

    test "create_survey/1 with valid data creates a survey" do
      assert {:ok, %Survey{} = survey} = DataCollection.create_survey(@valid_attrs)
      assert survey.code == "some code"
      assert survey.title == "some title"
      assert survey.user_id == 42
    end

    test "create_survey/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DataCollection.create_survey(@invalid_attrs)
    end

    test "update_survey/2 with valid data updates the survey" do
      survey = survey_fixture()
      assert {:ok, %Survey{} = survey} = DataCollection.update_survey(survey, @update_attrs)
      assert survey.code == "some updated code"
      assert survey.title == "some updated title"
      assert survey.user_id == 43
    end

    test "update_survey/2 with invalid data returns error changeset" do
      survey = survey_fixture()
      assert {:error, %Ecto.Changeset{}} = DataCollection.update_survey(survey, @invalid_attrs)
      assert survey == DataCollection.get_survey!(survey.id)
    end

    test "delete_survey/1 deletes the survey" do
      survey = survey_fixture()
      assert {:ok, %Survey{}} = DataCollection.delete_survey(survey)
      assert_raise Ecto.NoResultsError, fn -> DataCollection.get_survey!(survey.id) end
    end

    test "change_survey/1 returns a survey changeset" do
      survey = survey_fixture()
      assert %Ecto.Changeset{} = DataCollection.change_survey(survey)
    end
  end

  describe "questions" do
    alias Rosewood.DataCollection.Question

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DataCollection.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert DataCollection.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert DataCollection.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = DataCollection.create_question(@valid_attrs)
      assert question.title == "some title"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DataCollection.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = DataCollection.update_question(question, @update_attrs)
      assert question.title == "some updated title"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = DataCollection.update_question(question, @invalid_attrs)
      assert question == DataCollection.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = DataCollection.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> DataCollection.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = DataCollection.change_question(question)
    end
  end
end
