defmodule Valve.SourceControllerTest do
  use Valve.ConnCase

  alias Valve.Source
  @valid_attrs %{meta: %{}, name: "some content", version: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, source_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    source = Repo.insert! %Source{}
    conn = get conn, source_path(conn, :show, source)
    assert json_response(conn, 200)["data"] == %{"id" => source.id,
      "name" => source.name,
      "version" => source.version,
      "meta" => source.meta}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, source_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, source_path(conn, :create), source: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Source, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, source_path(conn, :create), source: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    source = Repo.insert! %Source{}
    conn = put conn, source_path(conn, :update, source), source: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Source, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    source = Repo.insert! %Source{}
    conn = put conn, source_path(conn, :update, source), source: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    source = Repo.insert! %Source{}
    conn = delete conn, source_path(conn, :delete, source)
    assert response(conn, 204)
    refute Repo.get(Source, source.id)
  end
end
