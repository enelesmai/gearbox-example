defmodule Clients.Client do
  use Ecto.Schema

  schema "client" do
    field :name, :string
    field :status, :string
  end

end
