defmodule Relationships.ApprenticeshipQualifications do
  @moduledoc """
  The ApprenticeshipQualifications context.
  """

  import Ecto.Query, warn: false
  alias Relationships.Repo

  alias Relationships.ApprenticeshipQualifications.ApprenticeshipQualification

  @doc """
  Returns the list of apprenticeship_qualifications.

  ## Examples

      iex> list_apprenticeship_qualifications()
      [%ApprenticeshipQualification{}, ...]

  """
  def list_apprenticeship_qualifications do
    Repo.all(ApprenticeshipQualification)
  end

  @doc """
  Gets a single apprenticeship_qualification.

  Raises `Ecto.NoResultsError` if the Apprenticeship qualification does not exist.

  ## Examples

      iex> get_apprenticeship_qualification!(123)
      %ApprenticeshipQualification{}

      iex> get_apprenticeship_qualification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_apprenticeship_qualification!(id), do: Repo.get!(ApprenticeshipQualification, id)

  @doc """
  Creates a apprenticeship_qualification.

  ## Examples

      iex> create_apprenticeship_qualification(%{field: value})
      {:ok, %ApprenticeshipQualification{}}

      iex> create_apprenticeship_qualification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_apprenticeship_qualification(attrs \\ %{}) do
    %ApprenticeshipQualification{}
    |> ApprenticeshipQualification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a apprenticeship_qualification.

  ## Examples

      iex> update_apprenticeship_qualification(apprenticeship_qualification, %{field: new_value})
      {:ok, %ApprenticeshipQualification{}}

      iex> update_apprenticeship_qualification(apprenticeship_qualification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_apprenticeship_qualification(
        %ApprenticeshipQualification{} = apprenticeship_qualification,
        attrs
      ) do
    apprenticeship_qualification
    |> ApprenticeshipQualification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a apprenticeship_qualification.

  ## Examples

      iex> delete_apprenticeship_qualification(apprenticeship_qualification)
      {:ok, %ApprenticeshipQualification{}}

      iex> delete_apprenticeship_qualification(apprenticeship_qualification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_apprenticeship_qualification(
        %ApprenticeshipQualification{} = apprenticeship_qualification
      ) do
    Repo.delete(apprenticeship_qualification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking apprenticeship_qualification changes.

  ## Examples

      iex> change_apprenticeship_qualification(apprenticeship_qualification)
      %Ecto.Changeset{data: %ApprenticeshipQualification{}}

  """
  def change_apprenticeship_qualification(
        %ApprenticeshipQualification{} = apprenticeship_qualification,
        attrs \\ %{}
      ) do
    ApprenticeshipQualification.changeset(apprenticeship_qualification, attrs)
  end

  alias Relationships.ApprenticeshipQualifications.ProgrammeVersion

  @doc """
  Returns the list of programme_versions.

  ## Examples

      iex> list_programme_versions()
      [%ProgrammeVersion{}, ...]

  """
  def list_programme_versions do
    Repo.all(ProgrammeVersion)
    |> Repo.preload(:apprenticeship_qualification)
  end

  @doc """
  Gets a single programme_version.

  Raises `Ecto.NoResultsError` if the Programme version does not exist.

  ## Examples

      iex> get_programme_version!(123)
      %ProgrammeVersion{}

      iex> get_programme_version!(456)
      ** (Ecto.NoResultsError)

  """
  def get_programme_version!(id),
    do: Repo.get!(ProgrammeVersion, id) |> Repo.preload(:apprenticeship_qualification)

  @doc """
  Creates a programme_version.

  ## Examples

      iex> create_programme_version(%{field: value})
      {:ok, %ProgrammeVersion{}}

      iex> create_programme_version(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_programme_version(attrs \\ %{}) do
    %ProgrammeVersion{}
    |> ProgrammeVersion.changeset(attrs)
    |> Repo.insert()
  end

  def create_programme_version_for(%ApprenticeshipQualification{} = aq, attrs \\ %{}) do
    %ProgrammeVersion{apprenticeship_qualification: aq}
    |> ProgrammeVersion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a programme_version.

  ## Examples

      iex> update_programme_version(programme_version, %{field: new_value})
      {:ok, %ProgrammeVersion{}}

      iex> update_programme_version(programme_version, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_programme_version(%ProgrammeVersion{} = programme_version, attrs) do
    programme_version
    |> ProgrammeVersion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a programme_version.

  ## Examples

      iex> delete_programme_version(programme_version)
      {:ok, %ProgrammeVersion{}}

      iex> delete_programme_version(programme_version)
      {:error, %Ecto.Changeset{}}

  """
  def delete_programme_version(%ProgrammeVersion{} = programme_version) do
    Repo.delete(programme_version)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking programme_version changes.

  ## Examples

      iex> change_programme_version(programme_version)
      %Ecto.Changeset{data: %ProgrammeVersion{}}

  """
  def change_programme_version(%ProgrammeVersion{} = programme_version, attrs \\ %{}) do
    ProgrammeVersion.changeset(programme_version, attrs)
  end
end
