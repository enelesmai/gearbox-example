defmodule ProcessService do
  alias Clients.Client
  alias ProcessMachine
  alias Clients.Repo

  def init_process(name) do
    %Clients.Client{name: name, status: "pending"}
    |> Repo.insert!
  end

  def authorize(client) do
    with {:ok, changeset} <-
    client
    |> Gearbox.Ecto.transition_changeset(ProcessMachine, "authorized")
    do
      Repo.update(changeset)
    else
      {:error, changeset} -> {:error, changeset}
    end
  end

  def sign(client) do
    with {:ok, changeset} <-
    client
    |> Gearbox.Ecto.transition_changeset(ProcessMachine, "signed")
    do
      Repo.update(changeset)
    else
      {:error, changeset} -> {:error, changeset}
    end
  end

  def identify(client) do
    with {:ok, changeset} <-
      client
      |> Gearbox.Ecto.transition_changeset(ProcessMachine, "identification")
      do
        Repo.update(changeset)
      else
        {:error, changeset} -> {:error, changeset}
      end
  end

  def current(id) do
    Repo.get_by(Client, id: id)
  end

  def current_status(id) do
    Repo.get_by(Client, id: id).status
  end

end
