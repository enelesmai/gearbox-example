defmodule Clients.Repo do
  use Ecto.Repo,
    otp_app: :gearbox_impl,
    adapter: Ecto.Adapters.Postgres
end
