defmodule Store.Core.Product do
  @moduledoc false

  use.Ecto.Schema

  schema "products" do
    field :title, :string
    field :descrption, :string
    field :price, :integer


    timestemp()
end
