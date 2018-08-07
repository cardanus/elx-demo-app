defmodule Elxdemoapp.Router do
  use Elxdemoapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Elxdemoapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/frontend_experiment", FrontExperimentController, [:new, :show]
    get "/backend experiment", BackExperimentController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Elxdemoapp do
  #   pipe_through :api
  # end
end
