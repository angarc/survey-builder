defmodule Rosewood.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string
      add :survey_id, :integer

      timestamps()
    end

  end
end
