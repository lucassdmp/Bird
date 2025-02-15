defmodule Bird.Repo do
  use Ecto.Repo,
    otp_app: :bird,
    adapter: Ecto.Adapters.Postgres
end
