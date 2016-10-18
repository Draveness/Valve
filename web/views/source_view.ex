defmodule Valve.SourceView do
  use Valve.Web, :view

  def render("source.json", %{version: version, name: name}) do
    %{
      version: version,
      name: name
    }
  end
end
