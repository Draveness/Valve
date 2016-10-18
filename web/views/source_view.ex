defmodule Valve.SourceView do
  use Valve.Web, :view

  def render("source.json", %{source: source}) do
    %{
      source: source
    }
  end
end
