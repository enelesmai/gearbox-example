defmodule ProcessService do
  alias Clients.Client
  alias ProcessMachine
  alias Clients.Repo

  def init_process do
    %Clients.Client{name: "selene",status: "pending"}
    |> Repo.insert!
  end

  def authorize(client) do
    with {:ok, changeset} <-
    client
    |> Gearbox.Ecto.transition_changeset(ProcessMachine, "authorized")
    do
      Repo.update(changeset)
    else
      {:error, changeset} ->
        #handle error here
    end
  end

  def sign(client) do
    with {:ok, changeset} <-
    client
    |> Gearbox.Ecto.transition_changeset(ProcessMachine, "signed")
    do
      Repo.update(changeset)
    else
      {:error, changeset} ->
        #handle error here
    end
  end

  def guard_transition(struct, _from, _to) do
    {:halt, "You have been snapped."}
  end

  def current(id) do
    Repo.get_by(Client, id: id)
  end

  def current_status(id) do
    Repo.get_by(Client, id: id).status
  end

end
