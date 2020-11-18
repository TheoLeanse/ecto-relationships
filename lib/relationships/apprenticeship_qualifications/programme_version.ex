defmodule Relationships.ApprenticeshipQualifications.ProgrammeVersion do
  use Ecto.Schema
  import Ecto.Changeset
  alias Relationships.ApprenticeshipQualifications.ApprenticeshipQualification

  schema "programme_versions" do
    field :version, :integer
    belongs_to :apprenticeship_qualification, ApprenticeshipQualification

    timestamps()
  end

  @doc false
  def changeset(programme_version, attrs) do
    programme_version
    |> cast(attrs, [:version])
    |> cast_assoc(:apprenticeship_qualification, required: true)
    |> validate_required([:version])
  end
end
