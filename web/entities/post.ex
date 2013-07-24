defmodule PostMapper do
  use Ecto.Entity

  dataset :posts do
    field :title, :string
    field :body, :string
  end
end

defmodule Post do
  import Ecto.Query
  alias Ecto.Adapters.Postgres.SQL

  def all do
    from(p in PostMapper)
    |> BlogRepo.all
  end

  # TODO: Replace this with BlogRepo.get when implemented
  def find(id) do
    from(p in PostMapper)
    |> where([p], p.id == id)
    |> BlogRepo.all
    |> Enum.first
  end

  def create(post_params) do
    PostMapper.new(post_params)
    |> BlogRepo.create
  end
end
