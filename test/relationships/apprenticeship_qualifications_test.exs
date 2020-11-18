defmodule Relationships.ApprenticeshipQualificationsTest do
  use Relationships.DataCase

  alias Relationships.ApprenticeshipQualifications

  alias Relationships.ApprenticeshipQualifications.ApprenticeshipQualification

  @valid_aq_attrs %{name: "some name"}
  @update_aq_attrs %{name: "some updated name"}
  @invalid_aq_attrs %{name: nil}

  def apprenticeship_qualification_fixture(attrs \\ %{}) do
    {:ok, apprenticeship_qualification} =
      attrs
      |> Enum.into(@valid_aq_attrs)
      |> ApprenticeshipQualifications.create_apprenticeship_qualification()

    apprenticeship_qualification
  end

  describe "apprenticeship_qualifications" do
    test "list_apprenticeship_qualifications/0 returns all apprenticeship_qualifications" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert ApprenticeshipQualifications.list_apprenticeship_qualifications() == [
               apprenticeship_qualification
             ]
    end

    test "get_apprenticeship_qualification!/1 returns the apprenticeship_qualification with given id" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert ApprenticeshipQualifications.get_apprenticeship_qualification!(
               apprenticeship_qualification.id
             ) == apprenticeship_qualification
    end

    test "create_apprenticeship_qualification/1 with valid data creates a apprenticeship_qualification" do
      assert {:ok, %ApprenticeshipQualification{} = apprenticeship_qualification} =
               ApprenticeshipQualifications.create_apprenticeship_qualification(@valid_aq_attrs)

      assert apprenticeship_qualification.name == "some name"
    end

    test "create_apprenticeship_qualification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               ApprenticeshipQualifications.create_apprenticeship_qualification(@invalid_aq_attrs)
    end

    test "update_apprenticeship_qualification/2 with valid data updates the apprenticeship_qualification" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert {:ok, %ApprenticeshipQualification{} = apprenticeship_qualification} =
               ApprenticeshipQualifications.update_apprenticeship_qualification(
                 apprenticeship_qualification,
                 @update_aq_attrs
               )

      assert apprenticeship_qualification.name == "some updated name"
    end

    test "update_apprenticeship_qualification/2 with invalid data returns error changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ApprenticeshipQualifications.update_apprenticeship_qualification(
                 apprenticeship_qualification,
                 @invalid_aq_attrs
               )

      assert apprenticeship_qualification ==
               ApprenticeshipQualifications.get_apprenticeship_qualification!(
                 apprenticeship_qualification.id
               )
    end

    test "delete_apprenticeship_qualification/1 deletes the apprenticeship_qualification" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert {:ok, %ApprenticeshipQualification{}} =
               ApprenticeshipQualifications.delete_apprenticeship_qualification(
                 apprenticeship_qualification
               )

      assert_raise Ecto.NoResultsError, fn ->
        ApprenticeshipQualifications.get_apprenticeship_qualification!(
          apprenticeship_qualification.id
        )
      end
    end

    test "change_apprenticeship_qualification/1 returns a apprenticeship_qualification changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      assert %Ecto.Changeset{} =
               ApprenticeshipQualifications.change_apprenticeship_qualification(
                 apprenticeship_qualification
               )
    end
  end

  describe "programme_versions" do
    alias Relationships.ApprenticeshipQualifications.ProgrammeVersion

    @valid_attrs %{version: 42}
    @update_attrs %{version: 43}
    @invalid_attrs %{version: nil}

    def programme_version_fixture(attrs \\ %{}) do
      {:ok, programme_version} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ApprenticeshipQualifications.create_programme_version()

      programme_version
    end

    test "list_programme_versions/0 returns all programme_versions" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert ApprenticeshipQualifications.list_programme_versions() == [programme_version]
    end

    test "get_programme_version!/1 returns the programme_version with given id" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert ApprenticeshipQualifications.get_programme_version!(programme_version.id) ==
               programme_version
    end

    test "create_programme_version/1 with valid data creates a programme_version" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      attrs =
        Map.put(@valid_attrs, :apprenticeship_qualification_id, apprenticeship_qualification.id)

      assert {:ok, %ProgrammeVersion{} = programme_version} =
               ApprenticeshipQualifications.create_programme_version(attrs)

      programme_version = Repo.preload(programme_version, :apprenticeship_qualification)

      assert programme_version.version == 42
      assert programme_version.apprenticeship_qualification_id == apprenticeship_qualification.id

      assert programme_version.apprenticeship_qualification.name ==
               apprenticeship_qualification.name
    end

    test "create_programme_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               ApprenticeshipQualifications.create_programme_version(@invalid_attrs)
    end

    test "update_programme_version/2 with valid data updates the programme_version" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert {:ok, %ProgrammeVersion{} = programme_version} =
               ApprenticeshipQualifications.update_programme_version(
                 programme_version,
                 @update_attrs
               )

      assert programme_version.version == 43
    end

    test "update_programme_version/2 with invalid data returns error changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert {:error, %Ecto.Changeset{}} =
               ApprenticeshipQualifications.update_programme_version(
                 programme_version,
                 @invalid_attrs
               )

      assert programme_version ==
               ApprenticeshipQualifications.get_programme_version!(programme_version.id)
    end

    test "delete_programme_version/1 deletes the programme_version" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert {:ok, %ProgrammeVersion{}} =
               ApprenticeshipQualifications.delete_programme_version(programme_version)

      assert_raise Ecto.NoResultsError, fn ->
        ApprenticeshipQualifications.get_programme_version!(programme_version.id)
      end
    end

    test "change_programme_version/1 returns a programme_version changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()

      programme_version =
        programme_version_fixture(%{
          apprenticeship_qualification_id: apprenticeship_qualification.id
        })

      assert %Ecto.Changeset{} =
               ApprenticeshipQualifications.change_programme_version(programme_version)
    end
  end
end
