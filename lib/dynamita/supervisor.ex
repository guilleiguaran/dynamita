Code.require_file "../../../web/repositories/blog_repo.ex", __FILE__

defmodule Dynamita.Supervisor do
  use Supervisor.Behaviour

  def start_link(_stack) do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [
      worker(BlogRepo, []),
      supervisor(Dynamita.Dynamo, [])
    ]
    supervise(tree, strategy: :one_for_one)
  end
end
