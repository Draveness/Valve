defmodule Valve.PageController do
  use Valve.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
