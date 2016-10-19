defmodule Valve.SourceTest do
  use Valve.ModelCase

  alias Valve.Source

  @valid_attrs %{meta: %{}, name: "some content", version: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Source.changeset(%Source{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Source.changeset(%Source{}, @invalid_attrs)
    refute changeset.valid?
  end
end
