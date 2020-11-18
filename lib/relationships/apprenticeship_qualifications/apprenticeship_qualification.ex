defmodule Relationships.ApprenticeshipQualifications.ApprenticeshipQualification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apprenticeship_qualifications" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(apprenticeship_qualification, attrs) do
    apprenticeship_qualification
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
