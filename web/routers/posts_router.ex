defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn.assign :layout, "layout"
    conn.fetch :params
  end

  # GET /posts
  get "/" do
    posts = Post.all

    conn = conn.assign(:posts, posts)
    render conn, "posts/index.html"
  end

  # GET /posts/new
  get "/new" do
    render conn, "posts/new.html"
  end

  # GET /posts/:id
  get "/:id" do
    {id, _} = String.to_integer(conn.params[:id])
    post = Post.find(id)

    conn = conn.assign(:post, post)
    render conn, "posts/show.html"
  end

  # POST /posts
  post "/" do
    post = Post.create(post_params(conn.params))
    redirect conn, to: "/posts/#{post.id}"
  end

  # filter permitted params for posts
  @post_params ["title", "body"]
  def post_params(params) do
    Enum.filter(params[:post], fn {key, _} -> Enum.member?(@post_params, key) end)
    |> Enum.map(fn {key, value} -> {:"#{key}", value} end)
  end
end
