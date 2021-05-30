defmodule Rosewood.Repo.Migrations.CreateSurveys do
  use Ecto.Migration

  def change do
    create table(:surveys) do
      add :title, :string
      add :user_id, :integer
      add :code, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:surveys, [:code])
  end
end
