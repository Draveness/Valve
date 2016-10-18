defmodule Valve.SourceController do
  use Valve.Web, :controller

  def source(conn, _params) do
    render conn, "source.json", source: "json"
  end
end
