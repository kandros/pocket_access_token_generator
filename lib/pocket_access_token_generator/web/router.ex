defmodule Pocket.Web.Router do
  use Pocket.Web, :router

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

  scope "/", Pocket.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/authorize", PageController, :authorize
  end

  # Other scopes may use custom stacks.
  # scope "/api", lol.ex.Web do
  #   pipe_through :api
  # end
end
