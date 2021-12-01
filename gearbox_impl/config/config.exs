import Config

config :gearbox_impl, Clients.Repo,
  database: "gearbox_impl_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

  config :gearbox_impl, ecto_repos: [Clients.Repo]
