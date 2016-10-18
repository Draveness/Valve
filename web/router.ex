defmodule Valve.Router do
  use Valve.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Valve do
   pipe_through :api

   get "/source", SourceController, :source
  end
end
