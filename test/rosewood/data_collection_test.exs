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
end
