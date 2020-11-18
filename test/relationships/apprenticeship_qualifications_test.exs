defmodule Relationships.ApprenticeshipQualificationsTest do
  use Relationships.DataCase

  alias Relationships.ApprenticeshipQualifications

  describe "apprenticeship_qualifications" do
    alias Relationships.ApprenticeshipQualifications.ApprenticeshipQualification

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def apprenticeship_qualification_fixture(attrs \\ %{}) do
      {:ok, apprenticeship_qualification} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ApprenticeshipQualifications.create_apprenticeship_qualification()

      apprenticeship_qualification
    end

    test "list_apprenticeship_qualifications/0 returns all apprenticeship_qualifications" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert ApprenticeshipQualifications.list_apprenticeship_qualifications() == [apprenticeship_qualification]
    end

    test "get_apprenticeship_qualification!/1 returns the apprenticeship_qualification with given id" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert ApprenticeshipQualifications.get_apprenticeship_qualification!(apprenticeship_qualification.id) == apprenticeship_qualification
    end

    test "create_apprenticeship_qualification/1 with valid data creates a apprenticeship_qualification" do
      assert {:ok, %ApprenticeshipQualification{} = apprenticeship_qualification} = ApprenticeshipQualifications.create_apprenticeship_qualification(@valid_attrs)
      assert apprenticeship_qualification.name == "some name"
    end

    test "create_apprenticeship_qualification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApprenticeshipQualifications.create_apprenticeship_qualification(@invalid_attrs)
    end

    test "update_apprenticeship_qualification/2 with valid data updates the apprenticeship_qualification" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert {:ok, %ApprenticeshipQualification{} = apprenticeship_qualification} = ApprenticeshipQualifications.update_apprenticeship_qualification(apprenticeship_qualification, @update_attrs)
      assert apprenticeship_qualification.name == "some updated name"
    end

    test "update_apprenticeship_qualification/2 with invalid data returns error changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert {:error, %Ecto.Changeset{}} = ApprenticeshipQualifications.update_apprenticeship_qualification(apprenticeship_qualification, @invalid_attrs)
      assert apprenticeship_qualification == ApprenticeshipQualifications.get_apprenticeship_qualification!(apprenticeship_qualification.id)
    end

    test "delete_apprenticeship_qualification/1 deletes the apprenticeship_qualification" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert {:ok, %ApprenticeshipQualification{}} = ApprenticeshipQualifications.delete_apprenticeship_qualification(apprenticeship_qualification)
      assert_raise Ecto.NoResultsError, fn -> ApprenticeshipQualifications.get_apprenticeship_qualification!(apprenticeship_qualification.id) end
    end

    test "change_apprenticeship_qualification/1 returns a apprenticeship_qualification changeset" do
      apprenticeship_qualification = apprenticeship_qualification_fixture()
      assert %Ecto.Changeset{} = ApprenticeshipQualifications.change_apprenticeship_qualification(apprenticeship_qualification)
    end
  end
end
