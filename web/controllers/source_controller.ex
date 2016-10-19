defmodule Valve.SourceController do
  use Valve.Web, :controller

  def source(conn, %{"version" => version, "name" => name}) do
    case File.read "master/Specs/#{name}/#{version}/#{name}.podspec.json" do
      {:ok, json} -> render conn, "source.json", json: json
      {:error, reason} -> render conn, "error.json", reason: reason
    end
    # render conn, "source.json", version: version, name: name
  end
end
