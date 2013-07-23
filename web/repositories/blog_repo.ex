defmodule BlogRepo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url, do: Dynamita[:database][:url]
end
