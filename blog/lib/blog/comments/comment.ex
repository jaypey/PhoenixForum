defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.Posts.Post
  alias Blog.Accounts.User

  schema "comments" do
    field :content, :string
    field :name, :string
    belongs_to(:post, Post)
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content, :post_id, :user_id])
    |> validate_required([:name, :content, :post_id, :user_id])
  end
end
