defmodule Valve.SourceController do
  use Valve.Web, :controller

  def source(conn, %{"version" => version, "name" => name}) do
    render conn, "source.json", version: version, name: name
  end
end
