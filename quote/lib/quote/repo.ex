defmodule Quote.Repo do
  use Ecto.Repo,
    otp_app: :quote,
    adapter: Ecto.Adapters.Postgres
end
