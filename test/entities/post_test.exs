Code.require_file "../../test_helper.exs", __FILE__

defmodule PostTest do
  use Dynamita.TestCase

  test :all do
    posts = Post.all
    post = Enum.first(posts)

    assert Enum.count(posts) == 1
    assert post.title == "Hello world"
  end

  test :find do
    post = Post.find(1)
    assert post.title == "Hello world"
  end
end
