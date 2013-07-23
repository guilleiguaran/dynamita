defmodule BlogRepo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url, do: Dynamita.config[:database][:url]
  # def url, do: "ecto://guille@localhost/blog_development"
  # def url, do: String.replace(System.get_env("DATABASE_URL"), "postgres", "ecto")
end
