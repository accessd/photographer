defmodule Photographer.Router do
  use Photographer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Photographer do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    resources "/admin/categories", Admin.CategoryController
    resources "/admin/photos", Admin.PhotoController

    get "/admin/login", Admin.SessionController, :new, as: :login
    post "/admin/login", Admin.SessionController, :create, as: :login
    delete "/admin/logout", Admin.SessionController, :delete, as: :logout
    get "/admin/logout", Admin.SessionController, :delete, as: :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", Photographer do
  #   pipe_through :api
  # end
end
