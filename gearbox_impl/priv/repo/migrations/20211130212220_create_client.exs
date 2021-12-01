defmodule Clients.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:client) do
      add :name, :string, null: false
      add :status, :string
    end
  end
end
