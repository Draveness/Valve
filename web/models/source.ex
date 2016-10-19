defmodule Valve.Source do
  use Valve.Web, :model

  schema "sources" do
    field :name, :string
    field :version, :string
    field :meta, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :version, :meta])
    |> validate_required([:name, :version, :meta])
  end
end
