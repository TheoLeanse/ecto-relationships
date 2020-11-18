defmodule Relationships.Repo.Migrations.CreateProgrammeVersions do
  use Ecto.Migration

  def change do
    create table(:programme_versions) do
      add :version, :integer
      add :apprenticeship_qualification_id, references(:apprenticeship_qualifications, on_delete: :nothing)

      timestamps()
    end

    create index(:programme_versions, [:apprenticeship_qualification_id])
  end
end
