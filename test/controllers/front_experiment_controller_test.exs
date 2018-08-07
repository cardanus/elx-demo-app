defmodule Elxdemoapp.FrontExperimentControllerTest do
  use Elxdemoapp.ConnCase

  alias Elxdemoapp.FrontExperiment
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, front_experiment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing front experement"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, front_experiment_path(conn, :new)
    assert html_response(conn, 200) =~ "New front experiment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, front_experiment_path(conn, :create), front_experiment: @valid_attrs
    assert redirected_to(conn) == front_experiment_path(conn, :index)
    assert Repo.get_by(FrontExperiment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, front_experiment_path(conn, :create), front_experiment: @invalid_attrs
    assert html_response(conn, 200) =~ "New front experiment"
  end

  test "shows chosen resource", %{conn: conn} do
    front_experiment = Repo.insert! %FrontExperiment{}
    conn = get conn, front_experiment_path(conn, :show, front_experiment)
    assert html_response(conn, 200) =~ "Show front experiment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, front_experiment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    front_experiment = Repo.insert! %FrontExperiment{}
    conn = get conn, front_experiment_path(conn, :edit, front_experiment)
    assert html_response(conn, 200) =~ "Edit front experiment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    front_experiment = Repo.insert! %FrontExperiment{}
    conn = put conn, front_experiment_path(conn, :update, front_experiment), front_experiment: @valid_attrs
    assert redirected_to(conn) == front_experiment_path(conn, :show, front_experiment)
    assert Repo.get_by(FrontExperiment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    front_experiment = Repo.insert! %FrontExperiment{}
    conn = put conn, front_experiment_path(conn, :update, front_experiment), front_experiment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit front experiment"
  end

  test "deletes chosen resource", %{conn: conn} do
    front_experiment = Repo.insert! %FrontExperiment{}
    conn = delete conn, front_experiment_path(conn, :delete, front_experiment)
    assert redirected_to(conn) == front_experiment_path(conn, :index)
    refute Repo.get(FrontExperiment, front_experiment.id)
  end
end
