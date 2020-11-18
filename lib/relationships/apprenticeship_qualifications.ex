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
  def update_apprenticeship_qualification(%ApprenticeshipQualification{} = apprenticeship_qualification, attrs) do
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
  def delete_apprenticeship_qualification(%ApprenticeshipQualification{} = apprenticeship_qualification) do
    Repo.delete(apprenticeship_qualification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking apprenticeship_qualification changes.

  ## Examples

      iex> change_apprenticeship_qualification(apprenticeship_qualification)
      %Ecto.Changeset{data: %ApprenticeshipQualification{}}

  """
  def change_apprenticeship_qualification(%ApprenticeshipQualification{} = apprenticeship_qualification, attrs \\ %{}) do
    ApprenticeshipQualification.changeset(apprenticeship_qualification, attrs)
  end
end
