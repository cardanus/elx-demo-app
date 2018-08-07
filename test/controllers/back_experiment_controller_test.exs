defmodule Elxdemoapp.BackExperimentControllerTest do
  use Elxdemoapp.ConnCase

  alias Elxdemoapp.BackExperiment
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, back_experiment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing back experiment"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, back_experiment_path(conn, :new)
    assert html_response(conn, 200) =~ "New back experiment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, back_experiment_path(conn, :create), back_experiment: @valid_attrs
    assert redirected_to(conn) == back_experiment_path(conn, :index)
    assert Repo.get_by(BackExperiment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, back_experiment_path(conn, :create), back_experiment: @invalid_attrs
    assert html_response(conn, 200) =~ "New back experiment"
  end

  test "shows chosen resource", %{conn: conn} do
    back_experiment = Repo.insert! %BackExperiment{}
    conn = get conn, back_experiment_path(conn, :show, back_experiment)
    assert html_response(conn, 200) =~ "Show back experiment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, back_experiment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    back_experiment = Repo.insert! %BackExperiment{}
    conn = get conn, back_experiment_path(conn, :edit, back_experiment)
    assert html_response(conn, 200) =~ "Edit back experiment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    back_experiment = Repo.insert! %BackExperiment{}
    conn = put conn, back_experiment_path(conn, :update, back_experiment), back_experiment: @valid_attrs
    assert redirected_to(conn) == back_experiment_path(conn, :show, back_experiment)
    assert Repo.get_by(BackExperiment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    back_experiment = Repo.insert! %BackExperiment{}
    conn = put conn, back_experiment_path(conn, :update, back_experiment), back_experiment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit back experiment"
  end

  test "deletes chosen resource", %{conn: conn} do
    back_experiment = Repo.insert! %BackExperiment{}
    conn = delete conn, back_experiment_path(conn, :delete, back_experiment)
    assert redirected_to(conn) == back_experiment_path(conn, :index)
    refute Repo.get(BackExperiment, back_experiment.id)
  end
end
