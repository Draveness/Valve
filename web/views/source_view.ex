defmodule Valve.SourceView do
  use Valve.Web, :view

  def render("source.json", %{json: json}) do
    Poison.Parser.parse! json
  end

  def render("error.json", %{reason: error}) do
    %{
      error: error
    }
  end
end
