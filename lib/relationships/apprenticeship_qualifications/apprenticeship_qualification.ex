defmodule Relationships.ApprenticeshipQualifications.ApprenticeshipQualification do
  use Ecto.Schema
  import Ecto.Changeset
  alias Relationships.ApprenticeshipQualifications.ProgrammeVersion

  schema "apprenticeship_qualifications" do
    field :name, :string
    has_many :programme_versions, ProgrammeVersion

    timestamps()
  end

  @doc false
  def changeset(apprenticeship_qualification, attrs) do
    apprenticeship_qualification
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
