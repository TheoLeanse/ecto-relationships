defmodule Relationships.Repo.Migrations.CreateApprenticeshipQualifications do
  use Ecto.Migration

  def change do
    create table(:apprenticeship_qualifications) do
      add :name, :string

      timestamps()
    end

  end
end
